import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/cartao.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class CartaoService {

  LogService _logService;
  Firestore _firestore;
  FirebaseAuth _auth;
  Map<String, dynamic> erros;

  validaCampo(String campo, int length){
    Map<String, dynamic> e;
    if(campo !=null) {
      if(campo.length < length) {
        e = {campo : 'Erro ' + campo};
        erros.addAll(e);
      }
    }
  }

  Future<bool> validarNovoCartao(CartaoModel cartaoModel) async {
    erros.clear();
    String uid = await recuperarUidUsuarioAtual();
    
    try {
      validaCampo(cartaoModel.placaVeiculo,5);
      validaCampo(cartaoModel.cpf, 11);
      validaCampo(cartaoModel.cv, 3);
      validaCampo(cartaoModel.nomeCartao, 8);
      validaCampo(cartaoModel.nomeProprietario, 8);
      validaCampo(cartaoModel.numeroCartao, 16);
      
      if(erros.length > 0){

        _logService.criarLogErro(PlatformException(code: '0001', message: 'Campos Invalidos', details: erros), uid, 'log_service_erro_validar_todos_campos');
        return false;
      }
      if(!validarCPFPlacaNome(cartaoModel)){
        _logService.criarLogErro(PlatformException(code: '0002', message: 'Campos Invalidos', details: 'CPF, NOME, PLACA'), uid, 'log_service_erro_validar_esp_campos');
        return false;
      }
      
      _logService.criarLogSucesso("log_sucesso_valiar_form_cartao", uid, cartaoModel.toMap());
      return true;
    } catch (e) {
      _logService.criarLogErro(e, uid, 'log_service_erro_validar_');
      return false;
    }
  }

  bool validarCPFPlacaNome(CartaoModel model) {
    return model.cpf.length > 11 && model.placaVeiculo.length > 6 && model.nomeProprietario.length > 8;
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

  inserirCartao(CartaoModel model) async {
    try {
    _firestore = Firestore.instance;  
    String uid = await recuperarUidUsuarioAtual();
    await _firestore.collection("cartao").document(uid).setData(model.toMap());
    await _firestore.collection("usuarios").document(uid).collection("cartoes_usuario").document().setData(model.toMap());
    model.zerarVariaveis();
    } catch (e) {
      print(e);
    }
  }
}