import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/cartao.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartaoService {

  Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  inserirNovoCartao(CartaoModel cartaoModel){
    Map<String, dynamic> erros;
    try {
      if(cartaoModel.placaVeiculo.isEmpty || cartaoModel.placaVeiculo.length < 5)
        erros.addAll({"placa":"Erro placa"});
      if(cartaoModel.cpf.isEmpty || cartaoModel.cpf.length < 11)
        erros.addAll({"cpf":"Erro cpf"});
      if(cartaoModel.cv.isEmpty || cartaoModel.cv.length < 3)
        erros.addAll({"cv":"Erro cv"});
      if(cartaoModel.nomeCartao.isEmpty || cartaoModel.nomeCartao.length < 8)
        erros.addAll({"nome_cartao":"Erro nome no cartão"});
      if(cartaoModel.nomeProprietario.isEmpty || cartaoModel.nomeProprietario.length < 8)
        erros.addAll({"proprietario":"Erro proprietario veiculo"});
      if(cartaoModel.numeroCartao.isEmpty || cartaoModel.numeroCartao.length < 16)
        erros.addAll({"cartao":"Erro cartão"});
      if(cartaoModel.quantidade.isNaN || cartaoModel.quantidade.isInfinite || cartaoModel.quantidade.isNegative)
        erros.addAll({"quantidade":"Erro quantidade"});
      
      if(erros.length > 0)
        throw new Exception(erros);
    } catch (e) {
      print(e);
    }
  }

  Future<String> recuperarUidUsuarioAtual() async {
    FirebaseUser user;
    try {
      user = await _auth.currentUser();
    } catch (e) {
      print(e);
    }
    return user.uid;
  }

  inserirCartao(CartaoModel model) async {
    try {
    String uid = await recuperarUidUsuarioAtual();
    await _firestore.collection("cartao").document(uid).setData(model.toMap());  
    } catch (e) {
      print(e);
    }
  }
}