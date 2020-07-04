import 'package:estacionamentodigital/models/user.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/userService.dart';
import 'package:mobx/mobx.dart'; 

part 'user.g.dart';

enum ESTADOLOGIN {IDEL, CARREGADO, SUCESSO, FALHA}

enum ESTADOCRIARUSUARIO {IDEL, CARREGADO, SUCESSO, FALHA}

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {

  UserModel userModel = UserModel();  
  LogService logService = LogService();
  UserService userService = new UserService();

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

  @observable 
  bool usuarioLogado = true;
  @action
  setUsuarioLogado(bool usuario) => usuarioLogado = usuario;
  @computed 
  bool get getUsuarioLogado {
    return usuarioLogado;
  }

  @action
  criarNovoUsuario() async {

    setEstadoCriarUsuario(ESTADOCRIARUSUARIO.CARREGADO);
    try {
      
      bool usuarioCriado = await userService.criarNovoUSuario(userModel.email, userModel.senha, userModel.nome);
      
      if(usuarioCriado)
        setEstadoCriarUsuario(ESTADOCRIARUSUARIO.SUCESSO);
      else setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA); 
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_criar_usuario");
      setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA);
    }
    
  }

  @action
  login() async {

    setEstadoLogin(ESTADOLOGIN.CARREGADO);
    try {
      await userService.login(userModel.email, userModel.senha);

      String uid = await userService.retornarUsuarioAtualUID();    
      await logService.criarLogSucesso("log_login_usuario", uid, {"date": new DateTime.now()});
      setEstadoLogin(ESTADOLOGIN.SUCESSO);
      } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_login_usuario");
      setEstadoLogin(ESTADOLOGIN.FALHA);
    }
  }

  Future redefinirSenha() async {
    
    try {
      await userService.redefinirSenha(userModel.email);
      await logService.criarLogSucesso("log_recuperar_senha", userModel.email, {"date": new DateTime.now()});
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_recuperar_senha");
    }
  }

  @action 
  verificarSeExisteUsuarioLogado() async {
    bool usuarioLogado = await userService.verificarSeExiseUsuarioLogado();
    if(usuarioLogado) {
      String uid = await userService.retornarUsuarioAtualUID();
      await logService.criarLogSucesso("log_login_usuario", uid, {"date": new DateTime.now()});
      
      setEstadoLogin(ESTADOLOGIN.SUCESSO);
    } else {
      setUsuarioLogado(false);
    }
    
  }

  @action
  Future logout() async {
   
    try {
      String uid = await userService.retornarUsuarioAtualUID();
      setUsuarioLogado(false);
      setEstadoLogin(ESTADOLOGIN.IDEL);
      await userService.logout();
      await logService.criarLogSucesso("log_logout_user_sucesso", uid, {"date": new DateTime.now()});
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_logout");
    }
  }

  Future deletarUsuario(String pass) async {
    String uid = await userService.retornarUsuarioAtualUID();
    try {
      return await userService.deletarUsuario(pass,uid);
    } catch (e) {
      await logService.criarLogErro(e, uid, "controller_deletar_usuario");
      return false;
    }
  }

}