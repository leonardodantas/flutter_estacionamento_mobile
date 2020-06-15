import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/cartao.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/userService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class CartaoService {

  UserService _userService = UserService();
  LogService _logService = new LogService();
  Firestore _firestore;
  FirebaseAuth _auth;
  Map<String, dynamic> erros = {};

  validaCampo(String campo, int length){
    Map<String, dynamic> e;
    try {
      if(campo !=null) {
        if(campo.length < length) {
          e = {campo : 'Erro ' + campo};
          erros.addAll(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> validarNovoCartao(CartaoModel cartaoModel) async {

    String uid = await recuperarUidUsuarioAtual();
    try {
      erros.clear();
      validaCampo(cartaoModel.placaVeiculo,5);
      validaCampo(cartaoModel.cpf, 11);
      validaCampo(cartaoModel.cv, 3);
      validaCampo(cartaoModel.nomeCartao, 8);
      validaCampo(cartaoModel.nomeProprietario, 8);
      validaCampo(cartaoModel.numeroCartao, 16);
   
      if(erros.length > 0){
        await _logService.criarLogErro(PlatformException(code: '0001', message: 'Campos Invalidos', details: erros), uid, 'log_service_erro_validar_todos_campos');
        return false;
      }

      if(validarCPFPlacaNome(cartaoModel)){
        await _logService.criarLogErro(PlatformException(code: '0002', message: 'Campos Invalidos', details: 'CPF, NOME, PLACA'), uid, 'log_service_erro_validar_esp_campos');
        return false;
      }
      
      await _logService.criarLogSucesso("log_sucesso_valiar_form_cartao", uid, cartaoModel.toMap());
      return true;
    } catch (e) {
      await _logService.criarLogErro(e, uid, 'log_service_erro_validar_');
      return false;
    }
  }

  bool validarCPFPlacaNome(CartaoModel model) {
    print(model.cpf.length < 11 && model.placaVeiculo.length < 6 && model.nomeProprietario.length < 8);
    return model.cpf.length < 11 && model.placaVeiculo.length < 6 && model.nomeProprietario.length < 8;
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
    model = await inserirLatitudeLongitude(model);
    await _firestore.collection("cartao").document(uid).setData(model.toMap());
    await _firestore.collection("usuarios").document(uid).collection("cartoes_usuario").document().setData(model.toMap());
    model.zerarVariaveis();
    } catch (e) {
      print(e);
    }
  }

  Future<CartaoModel> inserirLatitudeLongitude(CartaoModel model) async {
    Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    model.setLatitude(position.latitude);
    model.setLongitude(position.longitude);
    return model;
  }

  Future<Map<String, dynamic>> getCartaAtual() async {
    Map<String, dynamic> documentSnapshotToMap = {};
    CartaoModel cartaoModel = CartaoModel();
    try {
      DocumentSnapshot documentSnapshot;
      _firestore = Firestore.instance;
      String uid = await _userService.retornarUsuarioAtualUID();
      documentSnapshot = await _firestore.collection("cartao").document(uid).get();
      documentSnapshotToMap = cartaoModel.documentSnapshotToMap(documentSnapshot);
    } catch (e) {
      print(e);
    }
    return documentSnapshotToMap;
    
  }

  Future<QuerySnapshot> getTodosCartoesUsuario() async {
    QuerySnapshot querySnapshot;
    try {
       _firestore = Firestore.instance;
      String uid = await _userService.retornarUsuarioAtualUID();
      querySnapshot = await _firestore.collection("usuario").document(uid).collection("cartoes_usuario").getDocuments();    
      } catch (e) {
        print(e);
    }
    return querySnapshot;
  }

  
}