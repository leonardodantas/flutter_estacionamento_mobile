import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandedTile extends StatelessWidget {
  
  final String placaVeiculo;
  final String nomeProprietario;
  final String dataInicioCompleta;
  final String cpf;
  final String horaInicio;
  final String horaTermino;
  final String endereco;

  ExpandedTile({@required this.placaVeiculo,@required this.nomeProprietario,
     @required this.dataInicioCompleta, @required this.cpf, @required this.horaInicio,
     @required this.horaTermino, @required this.endereco
     });
  @override
  Widget build(BuildContext context) {
    print(dataInicioCompleta);
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
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.star),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('Save'),
                      ],
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.open_in_browser),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('Open'),
                      ],
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.share),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('Share'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}