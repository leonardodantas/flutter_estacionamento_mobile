import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/dateTimeService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {

  Firestore _firestore;
  FirebaseAuth _auth;
  LogService _logService = LogService();

  Future<Set<Marker>> marcacoesMapa() async {
    Set<Marker> markets = {};
    String uid = await recuperarUidUsuarioAtual();
    try {
      _firestore = Firestore.instance;
      var documents = await _firestore.collection("cartao").getDocuments();
     
      markets = verificarMarcacoes(documents.documents);

      _logService.criarLogSucesso("log_sucesso_marker_service", uid, {"data": new DateTime.now()});
    } catch (e) {
      _logService.criarLogErro(e, uid, "log_erro_marker_service");
      return markets;
    }
    return markets;
      
  }

  Set<Marker> verificarMarcacoes(List<DocumentSnapshot> data) {
    DateTimeService dateTimeService = new DateTimeService();
    Set<Marker> markets = {};
    data.forEach((value) {
      bool cartaoValidado = dateTimeService.verificarValidadeCartao(value["dataTermino"]);
      
      if(cartaoValidado) {
        Marker marker = new Marker(markerId: MarkerId(value.documentID), position:LatLng(value["latitude"], value["longitude"]) );
        markets.add(marker);
      }
      });
    return markets;
  }

   Future<String> recuperarUidUsuarioAtual() async {
    _auth = FirebaseAuth.instance;
    FirebaseUser user;
    try {
      user = await _auth.currentUser();
    } catch (e) {
      print(e);
    }
    return user.uid;
  }

  
}