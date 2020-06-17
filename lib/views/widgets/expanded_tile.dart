
import 'package:estacionamentodigital/controllers/map.dart';
import 'package:estacionamentodigital/views/pages/map_historico.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class ExpandedTile extends StatelessWidget {
  
  final String placaVeiculo;
  final String nomeProprietario;
  final String dataInicioCompleta;
  final String cpf;
  final String horaInicio;
  final String horaTermino;
  final String endereco;
  final double latitude;
  final double longitude;
  final int index;

  ExpandedTile({@required this.placaVeiculo,@required this.nomeProprietario,
     @required this.dataInicioCompleta, @required this.cpf, @required this.horaInicio,
     @required this.horaTermino, @required this.endereco, @required this.latitude,
     @required this.longitude, @required this.index
     });

  @override
  Widget build(BuildContext context) {
    final _mapController = GetIt.I<MapController>();
    return  ExpansionTileCard(
            leading: CircleAvatar(child: Icon(Icons.location_on)),
            title: Text('$placaVeiculo'),
            subtitle: Text('$dataInicioCompleta'),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
""" ${nomeProprietario}
   ${cpf}
   
   ${horaInicio} - ${horaTermino} 
   ${endereco}
   """,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 52.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    onPressed: () {
                      _mapController.getHistoricoEspecifico(latitude, longitude);
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> MapHistorico(latitude: latitude,longitude: longitude)));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.map),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('Google Maps'),
                      ],
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.delete),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('Deletar'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}