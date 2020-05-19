import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart'; 

part 'user.g.dart';

enum ESTADOLOGIN {IDEL, CARREGADO, SUCESSO, FALHA}

enum ESTADOCRIARUSUARIO {IDEL, CARREGADO, SUCESSO, FALHA}

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {

  UserModel userModel = UserModel();  

  Map<String, dynamic> toMap(){
    return {
      'nome': userModel.nome,
      'email': userModel.email,
      'data_criacao': new DateTime.now()
    };
  }

  @observable 
  ESTADOLOGIN estadologin = ESTADOLOGIN.IDEL;
  @action
  setEstadoLogin(ESTADOLOGIN estado) => estadologin = estado;
  @computed 
  ESTADOLOGIN get getEstadoLogin {
    return estadologin;
  }

  @observable 
  ESTADOCRIARUSUARIO estadocriarusuario = ESTADOCRIARUSUARIO.IDEL;
  @action
  setEstadoCriarUsuario(ESTADOCRIARUSUARIO estado) => estadocriarusuario = estado;
  @computed 
  ESTADOCRIARUSUARIO get getEstadoCriarUsuario {
    return estadocriarusuario;
  }

  criarNovoUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    Firestore firestore = Firestore.instance;
    setEstadoCriarUsuario(ESTADOCRIARUSUARIO.CARREGADO);
    try {
      AuthResult user = await auth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.senha);
      firestore.collection("usuarios").document(user.user.uid).setData(toMap());
      await criarLogSucesso(localLog: "log_criar_usuario",uid: user.user.uid ,data: {"date": new DateTime.now()});
      setEstadoCriarUsuario(ESTADOCRIARUSUARIO.SUCESSO);
    } catch (e) {
      setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA);
      await criarLogErro(localLog: "log_criar_usuario_erro",uid: new DateTime.now().toString() ,data: {"e": e});
    }
    setEstadoCriarUsuario(ESTADOCRIARUSUARIO.IDEL);
    
  }

  login() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    setEstadoLogin(ESTADOLOGIN.CARREGADO);
    try {
      AuthResult user = await auth.signInWithEmailAndPassword(email: userModel.email, password: userModel.senha);      
      await criarLogSucesso(localLog: "log_login",uid: user.user.uid ,data: {"date": new DateTime.now()});
      setEstadoLogin(ESTADOLOGIN.SUCESSO);
      } catch (e) {
      await criarLogErro(localLog: "log_login_erro",uid: new DateTime.now().toString() ,data: {"e": e});
      setEstadoLogin(ESTADOLOGIN.FALHA);
    }
    setEstadoLogin(ESTADOLOGIN.IDEL);
  }

  redefinirSenha() async {
    
    FirebaseAuth auth = FirebaseAuth.instance;
    
    try {
      await auth.sendPasswordResetEmail(email: userModel.email);  
      await criarLogSucesso(localLog: "log_redefinir_senha",uid: userModel.email ,data: {"date": new DateTime.now()});
    } catch (e) {
      await criarLogErro(localLog: "log_redefinir_senha_erro",uid: new DateTime.now().toString() ,data: {"e": e});
    }
  }

  criarLogSucesso({String localLog, String uid ,Map<String, dynamic> data}) async{
    Firestore firestore = Firestore.instance;
    try {
      await firestore.collection(localLog).document(uid).setData(data);
    } catch (e) {
      print(e);
    }
  }

  criarLogErro({String localLog, String uid ,Map<String, dynamic> data}) async{
    Firestore firestore = Firestore.instance;
    try {
      await firestore.collection(localLog).document(uid).setData(data);
    } catch (e) {
      print(e);
    }
  }

}