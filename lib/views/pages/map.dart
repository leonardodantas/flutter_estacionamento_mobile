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

  GoogleMapController googleMapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController.localizacaoAtual();
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionWidget(),
      body: Observer(builder: (_) {
      return GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(_mapController.latitude, _mapController.longitude),
              zoom: 60.0));
    }));
  }
}
