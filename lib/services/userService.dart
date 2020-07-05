import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserService {

  FirebaseUser user;
  FirebaseAuth auth;
  Firestore firestore;
  LogService logService = new LogService();

  Future<bool> criarNovoUSuario(String email, String pass, String nome) async {
    try {
      firestore = Firestore.instance;
      auth = FirebaseAuth.instance;
      AuthResult user = await auth.createUserWithEmailAndPassword(email: email, password: pass);
      if(user.user.uid != null){
        await firestore.collection("usuarios").document(user.user.uid).setData(toMap(nome,email));
        await criarConfiguracoesUsuario(user.user.uid);
        await logService.criarLogSucesso("log_criar_usuario", user.user.uid, {"date": new DateTime.now()});
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  criarConfiguracoesUsuario(String uid) async {
    firestore = Firestore.instance;
    try {
      await firestore.collection("usuarios").document(uid).collection("config")
        .document("idioma").setData({"idioma":1});

      await firestore.collection("usuarios").document(uid).collection("config")
        .document("maps").setData({"type":1});
    } catch (e) {
      await logService.criarLogErro(e, uid, "criar_config_usuarios");
    }
  }

  Map<String, dynamic> toMap(nome, email){
    return {
      'nome': nome,
      'email': email,
      'data_criacao': new DateTime.now()
    };
  }

  login(String email, String pass) async {
    try {
      auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: pass);  
    } catch (e) {
      print(e);
    }
  }

  redefinirSenha(String email) async {
    auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);  
      await auth.signOut();
    } catch (e) {
    }
  }

  logout() async {
    auth = FirebaseAuth.instance;
    try {
      await auth.signOut();   
    } catch (e) {
    }
  }

  Future<bool> verificarSeExiseUsuarioLogado() async {
    try {
      user = await _acessarUsuario();
    } catch (e) {
      return false;
    }
    return user != null ? true : false;
  }

  Future<String> retornarUsuarioAtualUID() async {
    try {
      user = await _acessarUsuario();  
    } catch (e) {
    }
    return user.uid;
  }

  Future<FirebaseUser> _acessarUsuario() async {
    auth = FirebaseAuth.instance;
    try {
      return await auth.currentUser();  
    } catch (e) {
      throw new PlatformException(code: '00002');
    }
  }

  Future<bool> deletarUsuario(String pass, String uid) async {
    String password = pass.trim();
    try {
      auth = FirebaseAuth.instance;
      FirebaseUser user = await auth.currentUser();
      await auth.signOut();
      print("USEREEEEEE");
      print(user.email);
      print(password);
      var result = await auth.signInWithEmailAndPassword(email: user.email, password: password);

      if(result.user != null){
        await result.user.delete();
        await deletarDadosUsuario(uid); 
        return true;
      }
      return true;
    } catch (e) {
      await logService.criarLogErro(e, uid, "deletar_usuario");
      return false;
    }
  }

  Future deletarDadosUsuario(String uid) async {
    firestore = Firestore.instance;
    try {
      await firestore.collection("usuarios").document(uid).delete();
    } catch (e) {
      await logService.criarLogErro(e, uid, "deletar_dados_usuario");
    }    
  }
}