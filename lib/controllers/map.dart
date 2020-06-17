import 'dart:async';

import 'package:estacionamentodigital/models/dto/cartao.dto.dart';
import 'package:estacionamentodigital/models/map.dart';
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/mapService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart'; 

part 'map.g.dart';

class MapController = MapControllerBase with _$MapController;

enum CARREGAMENTOINICIAL { CARREGANDO, SUCESSO, FALHA }

abstract class MapControllerBase with Store {

  MapModel mapModel = MapModel();
  MapService mapService = MapService();
  LogService logService = LogService();

  @observable 
  CARREGAMENTOINICIAL _carregamentoinicial = CARREGAMENTOINICIAL.CARREGANDO;
  @action
  setCarregamentoInicial(CARREGAMENTOINICIAL state) => _carregamentoinicial = state;
  @computed 
  CARREGAMENTOINICIAL get estadoCarregamento {
    return _carregamentoinicial;
  }

  @observable 
  Completer<GoogleMapController> googleMapController = Completer();
  @action
  setGoogleMapController(Completer<GoogleMapController> gM) => googleMapController = gM;
  @computed 
  Completer<GoogleMapController> get getGoogleMapController {
    return googleMapController;
  }

  @observable 
  List<CartaoDto> cartoesUsuario;
  @action 
  setCartoesUsuario(List<CartaoDto> cartoes) => cartoesUsuario = cartoes;
  @computed 
  List<CartaoDto> get getCartoesUsuario {
    return cartoesUsuario;
  }

  @observable 
  bool marcacoesUsuarioCarregada;
  @action 
  setMarcacoesUsuarioCarregada(bool m) => marcacoesUsuarioCarregada = m;
  @computed 
  bool get getMarcacoesUsuarioCarregada {
    return marcacoesUsuarioCarregada;
  } 

  Future<void> goToTheLake(CameraPosition _kLake) async {
    final GoogleMapController controller = await googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void localizacaoAtual() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      mapModel.setLatitude(position.latitude);
      mapModel.setLongitude(position.longitude);
      await marcacoesMapa();
      setCarregamentoInicial(CARREGAMENTOINICIAL.SUCESSO);
    } catch (e) {
      setCarregamentoInicial(CARREGAMENTOINICIAL.FALHA);
    }
  }

  Future marcacoesMapa() async {
    String uid = await mapService.recuperarUidUsuarioAtual();
    try {
      Set<Marker> marcacoesMapa = await mapService.marcacoesMapa();
      mapModel.setMarket(marcacoesMapa);
      logService.criarLogSucesso("log_sucesso_marcacoes_map", uid, {"data": new DateTime.now()} );
    } catch (e) {
      logService.criarLogErro(e, uid, "log_erro_marcacoes_map");
    }
  }

  Future alterarLocalizacaoAtual(double latitude, double longitude) async {
    String uid = await mapService.recuperarUidUsuarioAtual();
    try {
      CameraPosition cameraPosition = CameraPosition(target: LatLng(latitude, longitude), zoom: 18.0);
      goToTheLake(cameraPosition);
      logService.criarLogSucesso("log_sucesso_marcacao_localizacao_cartao", uid, cameraPosition.toMap());
      return cameraPosition;
    } catch (e) {
      logService.criarLogErro(e, uid, "log_erro_marcacao_localizacao_cartao");
    }
  }
   

   recuperarTodasMarcacoesUsuario() async {
    List<CartaoDto> cartaoDto;
    setMarcacoesUsuarioCarregada(false);
    try {
      cartaoDto = await mapService.recuperarTodasMarcacoesUsuario();
      cartaoDto = await mapService.converterLatitudeLongitudeParaEndereco(cartaoDto);
      setCartoesUsuario(cartaoDto);
      setMarcacoesUsuarioCarregada(true);
    } catch (e) {
    }
  }

  getHistoricoEspecifico(double latitude, double longitude)async {
    String uid;
    try {
      uid = await mapService.recuperarUidUsuarioAtual();
      Set<Marker> m = await mapService.recuperarMarcacaoDesejadaUsuario(latitude, longitude);
      mapModel.setMarcacaoUsuarioAtual(m);
    } catch (e) {
      logService.criarLogErro(e, uid, "log_erro_historico_especifico");
    }
  }
}
