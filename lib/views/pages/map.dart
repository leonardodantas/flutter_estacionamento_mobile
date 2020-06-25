import 'dart:async';

import 'package:estacionamentodigital/controllers/map.dart';
import 'package:estacionamentodigital/views/widgets/floating_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({@required Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _mapController = GetIt.I<MapController>();

  @override
  void initState() {
    super.initState();
    _mapController.localizacaoAtual();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionWidget(),
      body: Observer(builder: (_) {
      return GoogleMap(
        markers: _mapController.mapModel.getLocations,
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
