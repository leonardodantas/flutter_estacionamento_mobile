import 'package:cloud_firestore/cloud_firestore.dart';

class CartaoDto {

  String cv;
  String cpf;
  DateTime data;
  String dataInicioCompleta;
  String horaInicio;
  String horaTermino;
  String nomeCartao;
  String nomeProprietario;
  String numeroCartao;
  String placaVeiculo;
  double latitude;
  double longitude;
  String endereco;
  int quantidade;

  CartaoDto(Map<String, dynamic> documentSnapshot) {
    this.cv = documentSnapshot["CV"]; 
    this.cpf = documentSnapshot["cpf"];
    this.horaInicio = documentSnapshot["horaDeInicio"];
    this.horaTermino = documentSnapshot["horaDeTermino"];
    this.nomeCartao = documentSnapshot["nomeCartao"];
    this.numeroCartao = documentSnapshot["numeroCartao"];
    this.placaVeiculo = documentSnapshot["placaVeiculo"];
    this.quantidade = documentSnapshot["quantidade"];
    this.latitude = documentSnapshot["latitude"];
    this.longitude = documentSnapshot["longitude"];
    this.nomeProprietario = documentSnapshot["nomeProprietario"]; 
    this.dataInicioCompleta = converterTimestampParaDate(documentSnapshot["dataInicioCompleta"]);
  }

  String converterTimestampParaDate(Timestamp timestamp) {
    var data = DateTime.parse(timestamp.toDate().toString());
    String dmy = data.day.toString() + "/" + data.month.toString() + "/" + data.year.toString();
    String hm = data.hour.toString() + ":" + data.minute.toString();
    return dmy + " " + hm;
  }

}