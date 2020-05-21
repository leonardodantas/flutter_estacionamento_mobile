import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:estacionamentodigital/controllers/user.dart';
import 'package:estacionamentodigital/views/pages/compra.dart';
import 'package:estacionamentodigital/views/pages/login.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FloatingActionWidget extends StatelessWidget {

  final userController = GetIt.I<UserController>();

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(fabColor: Colors.white, children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.exit_to_app,
            size: 45,
            color: Colors.white,
          ),
          onPressed: (){
            userController.logout()
              .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen())));
          }),
      IconButton(
          icon: Icon(
            Icons.dock,
            size: 45,
            color: Colors.white,
          ),
          onPressed: () {
            print('Documentos');
          }),
      IconButton(
          icon: Icon(
            Icons.monetization_on,
            size: 45,
            color: Colors.white,
          ),
          onPressed: () {
            print('Home');
          }),
      IconButton(
          icon: Icon(
            Icons.credit_card,
            size: 45,
            color: Colors.white,
          ),
          onPressed: () {
            _showDialogInserirCartao(context);
          })
    ]);
  }

  void _showDialogInserirCartao(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            headerAnimationLoop: false,
            animType: AnimType.TOPSLIDE,
            tittle: 'Atenção',
            desc:
                'Um cartão ao ser comprado é automaticamente ativado, certifique-se tambem de estar no local correto de estacionamento do',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> CompraCartaoPage()));
            })
        .show();
  }
}
