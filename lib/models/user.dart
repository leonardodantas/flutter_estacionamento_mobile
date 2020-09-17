import 'package:mobx/mobx.dart'; 

part 'user.g.dart';

class UserModel = UserModelBase with _$UserModel;

abstract class UserModelBase with Store {

  @observable
  String uid;
  @action 
  setUid(String id) => uid = id;
  @computed
  String get getUid {
    return uid;
  }

  @observable 
  String nome;
  @action 
  setNome(String novoNome) => nome = novoNome;
  @computed 
  String get getNome {
    return nome;
  }

  @observable 
  String email;
  setEmail(String novoEmail) => email = novoEmail;
  @computed 
  String get getEmail {
    return email;
  }

  @observable 
  bool logado;
  setLogado(bool novoLogado) => logado = novoLogado;
  @computed 
  bool get getLogado {
    return logado;
  }

  @observable
  String senha;
  setSenha(String novaSenha) => senha = novaSenha;
}