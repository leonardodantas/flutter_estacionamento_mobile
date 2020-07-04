import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/views/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SucessoComprarCartaoPage extends StatefulWidget {
  @override
  _SucessoComprarCartaoPageState createState() => _SucessoComprarCartaoPageState();
}

class _SucessoComprarCartaoPageState extends State<SucessoComprarCartaoPage> {
  
  final _languageController = GetIt.I<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 190,),
          Image.asset("assets/sucesso.png"),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: 
             Padding(
               padding: EdgeInsets.all(15),
               child:  RaisedButton(
                        color: Colors.green,
                        child: Container(
                          
                            height: 60,
                            child: Center(
                              child: Text(_languageController.idioma["botao_voltar_inicio"],
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> InicioPage()));
                        },
                        shape: StadiumBorder(),
                      ),),)
          )
        ],
      ),
    );
  }
}