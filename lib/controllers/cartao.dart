import 'package:estacionamentodigital/models/cartao.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/cartaoService.dart';
import 'package:mobx/mobx.dart';

part 'cartao.g.dart';

class CartaoController = CartaoControllerBase with _$CartaoController;

abstract class CartaoControllerBase with Store {

  CartaoModel cartaoModel = CartaoModel();
  CartaoService _cartaoService = CartaoService();
  LogService _logService = LogService();

  Future inserirNovoCartao() async {
    String uid = await _cartaoService.recuperarUidUsuarioAtual();
    
    try {
      await _cartaoService.inserirCartao(cartaoModel);
      await _logService.criarLogSucesso("log_inserir_cartao_sucesso", uid, {"date": new DateTime.now()} );  
    } catch (e) {
      _logService.criarLogErro(e, uid, "log_error_inserir_cartao");
    }
  }

  Future<bool> validarInformacoesParaFinalizar() async {
        String uid = await _cartaoService.recuperarUidUsuarioAtual();
      try {
        bool validacao = await _cartaoService.validarNovoCartao(cartaoModel);
        if(validacao) {
          await _logService.criarLogSucesso("log_form_cartao_validado_sucesso", uid, {"date": new DateTime.now()} );  
          return true;
        }
        return false;
      } catch (e) {
        await _logService.criarLogErro(e, uid, "log_form_cartao_validado_erro" );  
        return false;       
      }

  }  

}