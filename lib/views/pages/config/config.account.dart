import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/controllers/user.dart';
import 'package:estacionamentodigital/views/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:toast/toast.dart';

class ConfigAccountPage extends StatefulWidget {
  @override
  _ConfigAccountPageState createState() => _ConfigAccountPageState();
}

class _ConfigAccountPageState extends State<ConfigAccountPage> {

  final _languageController = GetIt.I<LanguageController>();
  final _userController = GetIt.I<UserController>();

  @override
  Widget build(BuildContext context) {
    _userController.userModel.senha = "";
    return Scaffold(
      appBar: AppBar(title: Text("Apagar Conta"), centerTitle: true),
      bottomSheet: InkWell(
        onTap: (){
          String pass = _userController.userModel.senha.trim();
          if(pass.isNotEmpty){
            _showDialodDeleteAccount(context, pass);
          }
          Toast.show("Campo senha está vazio", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
        },
        child: Container(
        width: double.infinity,
        height: 80.0,
        color: Color(0xFFF3F3F3),
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Apagar e sair",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Icon(Icons.sms_failed, color: Colors.grey, size: 80,),
                Text("Ao excluir sua conta todos os seus dados serão permanentemente apagados!", 
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: "Poppins",),
                )
              ],
            ),
          ),
           Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Sua senha aqui",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: _userController.userModel.setSenha,
                ),
              )
        ],
      ),
    );
  }

   void _showDialodDeleteAccount(BuildContext context, String pass) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            headerAnimationLoop: true,
            animType: AnimType.TOPSLIDE,
            tittle: _languageController.idioma["excluir_historico"],
            desc:
                _languageController.idioma["mensagem_excluir_historico"],
             btnCancelOnPress: () {
              //Navigator.of(context).pop();
            },
            btnOkOnPress: () {
              _userController.deletarUsuario(pass)
                .then((value){
                  if(value){
                    _userController.logout()
                      .then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                      });
                  }else { 
                    Toast.show("Falha ao excluir usuario", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                  }
                })
              ;
            })
        .show();
  }
}