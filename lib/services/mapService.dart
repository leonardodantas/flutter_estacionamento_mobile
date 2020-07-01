import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamentodigital/models/dto/cartao.dto.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/cartaoService.dart';
import 'package:estacionamentodigital/services/dateTimeService.dart';
import 'package:estacionamentodigital/services/languageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {

  Firestore _firestore;
  FirebaseAuth _auth;
  LogService _logService = LogService();
  CartaoService _cartaoService = CartaoService();
  LanguageService _languageService = LanguageService();
  
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

  Future<List<CartaoDto>> recuperarTodasMarcacoesUsuario() async {
    String uid = await recuperarUidUsuarioAtual();
    List<CartaoDto> cartoesMap = new List<CartaoDto>();
    try {
      _firestore = Firestore.instance;
      
      QuerySnapshot documents = await _firestore.collection("usuarios").document(uid).collection("cartoes_usuario").orderBy("dataInicioCompleta").getDocuments();
      
      cartoesMap = await popularCartaoDto(documents.documents);
      cartoesMap = await converterLatitudeLongitudeParaEndereco(cartoesMap);

       _logService.criarLogSucesso("log_sucesso_recuperar_marcacoes_usuario", uid, {"data": new DateTime.now()});
    } catch (e) {
      _logService.criarLogErro(e, uid, "log_erro_recuperar_marcacoes_usuario");
    }
    return cartoesMap;
  }

  Future<List<CartaoDto>> popularCartaoDto(List<DocumentSnapshot> documents) async {
    List<CartaoDto> cartoesMap = new List<CartaoDto>();
    documents.forEach((element) {
        CartaoDto cartao = new CartaoDto(element.data, element.documentID);
        cartoesMap.add(cartao);
      });
    cartoesMap = await converterLatitudeLongitudeParaEndereco(cartoesMap);  
    return cartoesMap;
  }

  Future<List<CartaoDto>> converterLatitudeLongitudeParaEndereco(List<CartaoDto> cartoes) async {
     List<CartaoDto> novoCartoes = new List<CartaoDto>();
     for(CartaoDto cartaoDto in cartoes) {
      List<Placemark> placemarkets = new List<Placemark>();

      placemarkets = await Geolocator().placemarkFromCoordinates(cartaoDto.latitude, cartaoDto.longitude);
     
      for(Placemark p in placemarkets) {
        cartaoDto.endereco = p.thoroughfare + " " + p.administrativeArea + " " + p.postalCode;
      }
      novoCartoes.add(cartaoDto);
     }
     return novoCartoes;
     }

  Future<Set<Marker>> recuperarMarcacaoDesejadaUsuario(double latitude, double longitude) async {
    Set<Marker> markers = {}; 
    String uid;
    try {
      uid = await recuperarUidUsuarioAtual();
      Marker marker = new Marker(markerId: MarkerId(uid), position:LatLng(latitude, longitude) );     
      markers.add(marker);
    } catch (e) {
      _logService.criarLogErro(e, uid, "log_erro_recuperar_marcacao_desejada_usuario");
    }
    return markers;
  }

  //CHAMAR ESSA FUNÇÃO NO CONTROLLER E DEPOIS NO MAPA HISTORICO
  Future<Set<Marker>> recuperarMarcacoesHistoricoUsuario(uid) async {
    Set<Marker> markers = {};
    try {
      QuerySnapshot querySnapshot = await _cartaoService.getTodosCartoesUsuario();
      print("AQQUIIIIIIIIIIIIIIIIIIII");
      await _languageService.carregarIdioma(uid);
      print(querySnapshot.documents.length);
      querySnapshot.documents.forEach((d) {
        Marker marker = new Marker(markerId: MarkerId(uid), position:LatLng(d.data["latitude"], d.data["longitude"]));     
        markers.add(marker);
      });
    } catch (e) {
      print(e);
    }
    return markers;
  }  
  
}