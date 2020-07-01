import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:flutter/services.dart';

class LanguageService {

  LogService _logService = LogService();

  Future<Map<String, dynamic>> carregarIdioma(String uid) async {
    Map<String, dynamic> idioma = {};
    try {
      String idiomaUsuario = await buscarIdiomaUsuario(uid);
      String jsonString = await rootBundle.loadString('lang/${idiomaUsuario}.json');
      idioma = await json.decode(jsonString);
    } catch (e) {
      _logService.criarLogErro(e, uid, "log_erro_carregar_idioma");
    }
    return idioma;
  }

  Future<String> buscarIdiomaUsuario(String uid) async {
    Firestore firestore = Firestore.instance;
    String arquivoIdioma = "pt";
    try {
      var document = await firestore.collection("usuarios").document(uid).collection("config").document("idioma").get();
      int idioma = document.data["idioma"];
      switch (idioma) {
        case 1:
          arquivoIdioma = "pt";
        break;
        case 2:
          arquivoIdioma = "en";
        break;
        case 3:
          arquivoIdioma = "es";
        break;
        default: arquivoIdioma = "pt";
      }
    } catch (e) {
      print(e);
    }
    return arquivoIdioma;
  }

  Future alterarIdiomaUsuario(String uid, indexNovoIdioma) async {
    Firestore firestore = Firestore.instance;
    try {
      await firestore.collection("usuarios").document(uid).collection("config").document("idioma").setData({"idioma": indexNovoIdioma});
    } catch (e) {
      print(e);
    }
  }
}