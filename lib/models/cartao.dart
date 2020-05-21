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
      "placaVeiculo": placaVeiculo,
      "nomeProprietario": nomeProprietario,
      "cpf": cpf,
      "nomeCartao": nomeCartao,
      "numeroCartao": numeroCartao,
      "CV": cv,
      "quantidade": quantidade,
      "horaDeInicio": calcularHoraDeInicio(),
      "horaDeTermino": calcularHoraDeTermino()
    };
  }

  String validarPlacaVeiculo(String placa) {
    if (placa.isNotEmpty && placa.length < 8)
      return "Valor invalido para placa";
    return "";
  }

  String validarNomeProprietario(String nome) {
    if (nomeProprietario.isNotEmpty && nomeProprietario.length < 8)
      return "Valor invalido para nome";
    return "";
  }

  String validarCpfVeiculo(String cpf) {
    if (cpf.isNotEmpty && cpf.length < 11) return "Valor invalido para Cpf";
    return "";
  }

   String validarNomeCartao(String nome){
    if(nomeCartao.isNotEmpty && nomeCartao.length < 8)
      return "Valor invalido para nome";
    return "";
  }

  String validarNumeroCartao(String numero){
    if(numeroCartao.isNotEmpty && numeroCartao.length < 16)
      return "Valor invalido para cartão";
    return "";
  }

  
  String validarCVCartao(String numero){
    if(cv.isNotEmpty && cv.length < 2)
      return "Valor invalido para CV";
    return "";
  }
}
