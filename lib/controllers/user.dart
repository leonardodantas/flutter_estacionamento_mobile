import 'package:estacionamentodigital/models/user.dart';
import 'package:estacionamentodigital/models/validacao.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/userService.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart'; 

part 'user.g.dart';

enum ESTADOLOGIN {IDEL, CARREGADO, SUCESSO, FALHA, USUARIOCRIADOSUCESSO}

enum ESTADOCRIARUSUARIO {IDEL, CARREGADO, SUCESSO, FALHA}

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {

  UserModel userModel = UserModel();  
  LogService logService = LogService();
  UserService userService = new UserService();

  final validacaoClass = GetIt.I<Validacao>();

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

      validacaoClass.validarUsuario(userModel);
      
      if(validacaoClass.getObjetoValidado) {
        bool usuarioCriado = await userService.criarNovoUSuario(userModel);
      
        if(usuarioCriado){
          setEstadoCriarUsuario(ESTADOCRIARUSUARIO.SUCESSO);
          setEstadoLogin(ESTADOLOGIN.USUARIOCRIADOSUCESSO);
        }
        else setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA); 
      } else {
        setEstadoCriarUsuario(ESTADOCRIARUSUARIO.FALHA);
      }

      
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

  Future<bool> redefinirSenha() async {
    
    try {
      if(userModel.email.isNotEmpty) {
        await userService.redefinirSenha(userModel.email.trim());
        await logService.criarLogSucesso("log_recuperar_senha", userModel.email, {"date": new DateTime.now()});
        return true;
      }
    } catch (e) {
      await logService.criarLogErro(e, new DateTime.now().toString(), "log_erro_recuperar_senha");
    }
    return false;
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

  @action
  Future deletarUsuario(String pass) async {
    String uid = await userService.retornarUsuarioAtualUID();
    try {
      setUsuarioLogado(false);
      setEstadoLogin(ESTADOLOGIN.IDEL);
      return await userService.deletarUsuario(pass,uid);
    } catch (e) {
      await logService.criarLogErro(e, uid, "controller_deletar_usuario");
      return false;
    }
  }

}