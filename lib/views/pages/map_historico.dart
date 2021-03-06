import 'package:estacionamentodigital/controllers/configMapController.dart';
import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/controllers/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHistorico extends StatefulWidget {
  MapHistorico({@required double latitude, @required double longitude}) : super();

  @override
  _MapHistoricoState createState() => _MapHistoricoState();
}

class _MapHistoricoState extends State<MapHistorico> {

  final _mapController = GetIt.I<MapController>();
  final _configMapController = GetIt.I<ConfigMapController>();
  final _languageController = GetIt.I<LanguageController>();
  
  @override
  void initState() {
    super.initState();
    _configMapController.recuperarConfigMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_languageController.idioma["localizacao"]), centerTitle: true),
      body: Observer(builder: (_) {
      return GoogleMap(
        markers: _mapController.mapModel.getMarcacaoUsuario,
        mapType: _configMapController.mapType,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _mapController.googleMapController.complete(controller);
          },
          buildingsEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(_mapController.mapModel.latitude, _mapController.mapModel.longitude),
              zoom: _mapController.mapModel.getMarcacaoUsuario.length <= 1 ? 18.0 : 15.5));
    }));
  }
}
