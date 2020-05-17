import 'package:estacionamentodigital/controllers/map.dart';
import 'package:estacionamentodigital/views/pages/map.dart';
import 'package:estacionamentodigital/views/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class InicioPage extends StatefulWidget {
  final Key _mapKey = UniqueKey();
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {

  final _mapController = GetIt.I<MapController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _mapController.localizacaoAtual();
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(body: Observer(builder: (_) {
      switch (_mapController.estadoCarregamento) {
        case CARREGAMENTOINICIAL.CARREGANDO:
          return LoadingWidget();
          break;
        case CARREGAMENTOINICIAL.FALHA:
          return Container();
          break;
        case CARREGAMENTOINICIAL.SUCESSO:
          return MapPage(key: widget._mapKey);
          break;
          default: return Container();
      }
    }));
  }
}


/**MapPage(key: widget._mapKey), */
