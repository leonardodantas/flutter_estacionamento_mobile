import 'package:estacionamentodigital/models/cartao.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/cartaoService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'cartao.g.dart';

class CartaoController = CartaoControllerBase with _$CartaoController;

abstract class CartaoControllerBase with Store {

  CartaoModel cartaoModel = CartaoModel();
  CartaoService _cartaoService = CartaoService();
  LogService _logService = LogService();

  Future inserirNovoCartao() async {
    FirebaseUser auth = await FirebaseAuth.instance.currentUser();

    try {
      await _cartaoService.inserirNovoCartao(cartaoModel);
      await _cartaoService.inserirCartao(cartaoModel);
      await _logService.criarLogSucesso("log_inserir_cartao_sucesso", auth.uid, {"date": new DateTime.now()} );  
    } catch (e) {
      _logService.criarLogErro(e, auth.uid, "log_error_inserir_cartao");
    }
  }  

}