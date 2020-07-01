import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/configMapService.dart';
import 'package:estacionamentodigital/services/userService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'configMapController.g.dart';

class ConfigMapController = ConfigMapControllerBase with _$ConfigMapController;

abstract class ConfigMapControllerBase with Store {

  LogService _logService = LogService();
  UserService userService = UserService();
  ConfigMapService _configMapService = ConfigMapService();

  @observable 
  MapType mapType;
  @action 
  setMapType(MapType m) => mapType = m;
  @computed 
  MapType get getMapType {
    return mapType;
  }

  @observable 
  int valueType;
  @action
  setValueType(int newV) => valueType = newV; 
  @computed
  int get getValueType {
    return valueType;
  }

  recuperarConfigMaps() async {
    String uid;
    try {
      uid = await userService.retornarUsuarioAtualUID();
      int valueType = await _configMapService.recuperarTipoDoMapa(uid);
      switch (valueType) {
        case 1:
          setMapType(MapType.normal);    
        break;
        case 2:
          setMapType(MapType.hybrid);    
        break;
        case 3:
          setMapType(MapType.satellite);    
        break;
        case 4:
          setMapType(MapType.terrain);    
        break;
        default:
      }
      setValueType(valueType);
    } catch (e) {
      _logService.criarLogErro(e, uid, "recuperar_config_maps");
    }
  }

  Future alterarConfigMaps(int valueType) async {
    String uid;
    try {
      uid = await userService.retornarUsuarioAtualUID();
      _configMapService.alterarTipoDoMapa(uid, valueType);
      recuperarConfigMaps();
    } catch (e) {
      _logService.criarLogErro(e, uid, "alterar_config_maps");
    }
  }
}