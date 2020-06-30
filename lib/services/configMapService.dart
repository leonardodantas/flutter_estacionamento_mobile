import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigMapService {

  Firestore _firestore;

  recuperarTipoDoMapa(String uid) async {
    int valueType;
    try {
      _firestore = Firestore.instance;
      var document = await _firestore.collection("usuarios").document(uid).collection("config").document("maps").get();

      valueType = document.data["type"];
    } catch (e) {
      print(e);
    }
    return valueType;
  }

  alterarTipoDoMapa(String uid, int newValeuType) async {
    try {
      await _firestore.collection("usuarios").document(uid).collection("config").document("maps").updateData({"type": newValeuType});
    } catch (e) {
      print(e);
    }
  }
}