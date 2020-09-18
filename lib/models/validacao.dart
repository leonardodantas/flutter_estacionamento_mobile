import 'package:estacionamentodigital/models/user.dart';
import 'package:mobx/mobx.dart';

part 'validacao.g.dart';

class Validacao = ValidacaoBase with _$Validacao;

abstract class ValidacaoBase with Store {

  @observable
  String mensagemValidacao;
  @action
  setMensagemValidacao(String mensagem) => mensagemValidacao = mensagem;
  @computed
  String get getMensagemValidacao {
    return mensagemValidacao;
  }

  @observable
  bool objetoValidado;
  @action
  setObjetoValidado(bool objeto) => objetoValidado = objeto;
  @computed
  bool get getObjetoValidado {
    return objetoValidado;
  }

  @action
  validarUsuario(UserModel model){

    _inicializarVariaveis();
    
    if(model.nome.length < 6){
      setMensagemValidacao("Nome deve ser maior que 6");
    }

    if(model.email.length < 6){
      setMensagemValidacao("Email deve ser maior que 6");
    }

    if(model.senha.length < 6){
      setMensagemValidacao("Senha deve ser maior que 6");
    }

    if(mensagemValidacao.length > 0) {
      setObjetoValidado(false);
    }

  }

  _inicializarVariaveis(){
    setMensagemValidacao("");
    setObjetoValidado(true);
  }
}