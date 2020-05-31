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
}
