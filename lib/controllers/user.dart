import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/user.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart'; 

part 'user.g.dart';

enum ESTADOLOGIN {IDEL, CARREGADO, SUCESSO, FALHA}

enum ESTADOCRIARUSUARIO {IDEL, CARREGADO, SUCESSO, FALHA}

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {

  UserModel userModel = UserModel();  
  LogService logService = LogService();

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

      await logService.criarLogSucesso("log_criar_usuario", user.user.uid, {"date": new DateTime.now()});
      
      setEstadoCriarUsuario(ESTADOCRIARUSUARIO.SUCESSO);
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_criar_usuario");
      setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA);
    }
    setEstadoCriarUsuario(ESTADOCRIARUSUARIO.IDEL);
    
  }

  login() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    setEstadoLogin(ESTADOLOGIN.CARREGADO);
    try {
      AuthResult user = await auth.signInWithEmailAndPassword(email: userModel.email, password: userModel.senha);      
      await logService.criarLogSucesso("log_login_usuario", user.user.uid, {"date": new DateTime.now()});
      setEstadoLogin(ESTADOLOGIN.SUCESSO);
      } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_login_usuario");
      setEstadoLogin(ESTADOLOGIN.FALHA);
    }
    setEstadoLogin(ESTADOLOGIN.IDEL);
  }

  Future redefinirSenha() async {
    
    FirebaseAuth auth = FirebaseAuth.instance;
    
    try {
      await auth.sendPasswordResetEmail(email: userModel.email);  
      await logService.criarLogSucesso("log_recuperar_senha", userModel.email, {"date": new DateTime.now()});
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_recuperar_senha");
    }
  }

  Future logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      FirebaseUser currentUser = await auth.currentUser();
      await logService.criarLogSucesso("log_logout_user_sucesso", currentUser.uid, {"date": new DateTime.now()});
      await auth.signOut();
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_logout");
    }
  }

}