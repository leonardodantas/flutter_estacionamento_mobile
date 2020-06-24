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

  @override
  void initState() {
    super.initState();
    //_mapController.localizacaoAtual();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localização"), centerTitle: true),
      body: Observer(builder: (_) {
      return GoogleMap(
        markers: _mapController.mapModel.getMarcacaoUsuario,
        mapType: MapType.normal,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _mapController.googleMapController.complete(controller);
          },
          buildingsEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(_mapController.mapModel.latitude, _mapController.mapModel.longitude),
              zoom: 18.0));
    }));
  }
}
