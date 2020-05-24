import 'package:mobx/mobx.dart';

part 'cartao.g.dart';

class CartaoModel = CartaoModelBase with _$CartaoModel;

abstract class CartaoModelBase with Store {
  @observable
  String uid;

  @observable
  String placaVeiculo;
  @action
  setPlacaVeiculo(String placa) => placaVeiculo = placa;

  @observable
  String nomeProprietario;
  @action
  setProprietario(String proprietario) => nomeProprietario = proprietario;

  @observable
  String cpf;
  @action
  setCPF(String novoCpf) => cpf = novoCpf;

  @observable
  String nomeCartao;
  @action
  setNomeCartao(String nome) => nomeCartao = nome;

  @observable
  String numeroCartao;
  @action
  setNumeroCartao(String numero) => numeroCartao = numero;

  @observable
  String cv;
  @action
  setCV(String c) => cv = c;

  @observable 
  String dataValidadeCartao;
  @action 
  setDataValidadeCartao(String novaData) => dataValidadeCartao = novaData;
  
  @observable
  double quantidade;
  @action
  setQuantidade(double qtd) => quantidade = qtd;

  String calcularHoraDeInicio(){
    var data = new DateTime.now();
    var hora = data.hour;
    var minutos = data.minute;
    return '${hora}:${minutos}';
  }
 
  String calcularHoraDeTermino() {
    var data = new DateTime.now();
    var hora = data.hour + 2;
    var minutos = data.minute;
    return '${hora}:${minutos}';
  }

  Map<String, dynamic> toMap() {
    return {
      "placaVeiculo": placaVeiculo.replaceAll('-', '').toUpperCase(),
      "nomeProprietario": nomeProprietario.toUpperCase(),
      "cpf": cpf,
      "nomeCartao": nomeCartao.toUpperCase(),
      "numeroCartao": numeroCartao,
      "CV": cv,
      "quantidade": 1,
      "horaDeInicio": calcularHoraDeInicio(),
      "horaDeTermino": calcularHoraDeTermino(),
      "data": new DateTime.now()
    };
  }

  zerarVariaveis() {
    placaVeiculo = '';
    nomeProprietario = '';
    cpf = '';
    nomeCartao = '';
    cv = '';
  }

  bool _valida(String campo, int length) {
    if(campo != null)
      return campo.length < length;
    return false;
  }

  bool validarPlacaVeiculo() {
    return _valida(placaVeiculo, 7);
  }

  bool validarNomeProprietario() {
    return _valida(nomeProprietario, 8);
  }

  bool validarCpfVeiculo() {
    return _valida(cpf, 11);
  }

   bool validarNomeCartao(){
    return _valida(nomeCartao, 8);
  }

  bool validarNumeroCartao(){
    return _valida(numeroCartao, 16);
  }

  bool validarCVCartao(){
    return _valida(cv, 3);
  }
}
