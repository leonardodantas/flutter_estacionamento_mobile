import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map.g.dart';

class MapModel = MapModelBase with _$MapModel;

abstract class MapModelBase with Store {

  @observable
  double longitude;
  @action
  setLongitude(double novaLongitude) => longitude = novaLongitude;

  @observable
  double latitude;
  @action
  setLatitude(double novaLatitude) => latitude = novaLatitude;

  @observable 
  Set<Marker> _markers = {};
  @action
  setMarket(Set<Marker> marker) => _markers = marker;
  @computed
  Set<Marker> get getLocations {
    return _markers;
  }

  @observable 
  Set<Marker> marcacaoUsuario;
  @action 
  setMarcacaoUsuarioAtual(Set<Marker> m) => marcacaoUsuario = m; 
  @computed 
  Set<Marker> get getMarcacaoUsuario {
    return marcacaoUsuario;
  }
}