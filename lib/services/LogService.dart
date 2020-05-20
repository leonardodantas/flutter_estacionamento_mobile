import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class LogService {

  Firestore firestore;

  criarLogErro(PlatformException erro,String uid, String localLog) async {
    firestore = Firestore.instance;
    try {
      await firestore.collection(localLog).document(uid).setData(criarMensagemErro(erro));
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> criarMensagemErro(PlatformException e){
    return {
      "code": e.code,
      "message": e.message,
      "details": e.details
    };
  }

}