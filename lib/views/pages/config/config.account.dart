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
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController.userModel.senha = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_languageController.idioma["apagar_contar"]), centerTitle: true),
      bottomSheet: InkWell(
        onTap: (){
          String pass = _userController.userModel.senha.trim();
          if(pass.isNotEmpty){
            _showDialodDeleteAccount(context, pass);
          } else {
            Toast.show(_languageController.idioma["toast_campo_senha"], context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
          }
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
                _languageController.idioma["apagar_sair"],
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
                Text(_languageController.idioma["mensagem_excluir_contar"], 
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: "Poppins",),
                )
              ],
            ),
          ),
           Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: _languageController.idioma["sua_senha_aqui"],
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
            tittle: _languageController.idioma["apagar_contar"],
            desc:
                _languageController.idioma["mensagem_excluir_contar"],
             btnCancelOnPress: () {
              //Navigator.of(context).pop();
            },
            btnOkOnPress: () {
              _userController.deletarUsuario(pass)
                .then((value){
                  print("VALUE VASDASDSDAD");
                  print(value);
                  if(value){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));  
                  }else { 
                    Toast.show(_languageController.idioma["falha_excluir_conta"], context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                  }
                })
              ;
            })
        .show();
  }
}