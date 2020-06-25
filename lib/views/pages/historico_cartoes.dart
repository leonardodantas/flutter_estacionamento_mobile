import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:estacionamentodigital/controllers/cartao.dart';
import 'package:estacionamentodigital/controllers/map.dart';
import 'package:estacionamentodigital/views/widgets/expanded_tile.dart';
import 'package:estacionamentodigital/views/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toast/toast.dart';

class HistoricoCartoes extends StatefulWidget {
  @override
  _HistoricoCartoesState createState() => _HistoricoCartoesState();
}

class _HistoricoCartoesState extends State<HistoricoCartoes> {

  CartaoController _cartaoController = GetIt.I<CartaoController>();
  MapController _mapController = GetIt.I<MapController>();

  @override
  void initState(){
    super.initState();
    _mapController.recuperarTodasMarcacoesUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Historico"), 
        centerTitle: true,
        actions: <Widget>[
           PopupMenuButton<int>(
             onSelected: (value) {
               if(_mapController.getCartoesUsuario.length > 0){
                 if(value == 2) {
                   _showDialodDeleteHistorico(context);
                 }
                 if(value == 1) {
                   _showDialodDeleteHistorico(context);
                 }
                } else {
                   Toast.show("Historico Vazio", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                }
               
             },
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Visualizar Todos no Mapa"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Limpar Historico"),
                ),
              ],
        ),
        ], 
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),),
        body: Observer(builder: (_){
          if(_mapController.getMarcacoesUsuarioCarregada) {
            if(_mapController.getCartoesUsuario.length > 0){
              return ListView.builder(
              itemCount: _mapController.getCartoesUsuario.length,
              itemBuilder: (context, index) {
              return  ExpandedTile(placaVeiculo: _mapController.getCartoesUsuario[index].placaVeiculo, 
              nomeProprietario: _mapController.getCartoesUsuario[index].nomeProprietario, 
              dataInicioCompleta: _mapController.getCartoesUsuario[index].dataInicioCompleta,
              cpf: _mapController.getCartoesUsuario[index].cpf,
              endereco: _mapController.getCartoesUsuario[index].endereco,
              horaInicio: _mapController.getCartoesUsuario[index].horaInicio,
              horaTermino: _mapController.getCartoesUsuario[index].horaTermino,
              longitude: _mapController.getCartoesUsuario[index].longitude,
              latitude: _mapController.getCartoesUsuario[index].latitude,
              index: index,
              documentId: _mapController.getCartoesUsuario[index].documentID
              );
            },
            );
            } else {
              return Center(child: Text("Historico Vazio", style: TextStyle(fontSize: 32),));
            }
            }
            else {
              return LoadingWidget();
            }
         }),
    );
  }

  void _showDialodDeleteHistorico(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            headerAnimationLoop: true,
            animType: AnimType.TOPSLIDE,
            tittle: 'Excluir Historico',
            desc:
                'Atenção, todo seu historico será excluido! Deseja continuar?',
             btnCancelOnPress: () {
              //Navigator.of(context).pop();
            },
            btnOkOnPress: () {
              _cartaoController.deletarCartoes(_mapController.getCartoesUsuario)
                .then((value){
                  _mapController.recuperarTodasMarcacoesUsuario();
                }).catchError((e){
                  Toast.show("Erro ao deletar cartões", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                });
            })
        .show();
  }
}