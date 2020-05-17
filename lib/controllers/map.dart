
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart'; 

part 'map.g.dart';

class MapController = MapControllerBase with _$MapController;

enum CARREGAMENTOINICIAL { CARREGANDO, SUCESSO, FALHA }

abstract class MapControllerBase with Store {
  @observable
  double longitude;
  @action
  setLongitude(double novaLongitude) => longitude = novaLongitude;

  @observable
  double latitude;
  @action
  setLatitude(double novaLatitude) => latitude = novaLatitude;

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
      setLatitude(position.latitude);
      setLongitude(position.longitude);
      setCarregamentoInicial(CARREGAMENTOINICIAL.SUCESSO);
    } catch (e) {
      setCarregamentoInicial(CARREGAMENTOINICIAL.FALHA);
    }
  }
}
