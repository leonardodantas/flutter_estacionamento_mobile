import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class LogService {

  Firestore firestore;

  criarLogErro(PlatformException erro,String uid, String localLog) async {
    firestore = Firestore.instance;
    try {
      await firestore.collection("logs").document(localLog).collection(new DateTime.now().toString()).document(uid).setData(_criarMensagemErro(erro));
    } catch (e) {
      print(e);
    }
  }

  criarLogSucesso(String localLog, String uid, Map<String, dynamic> dado) async {
    firestore = Firestore.instance;
    try {
      await firestore.collection("logs").document(localLog).collection(new DateTime.now().toString()).document(uid).setData(dado);
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> _criarMensagemErro(PlatformException e){
    return {
      "code": e.code,
      "message": e.message,
      "details": e.details
    };
  }

}