import 'package:estacionamentodigital/controllers/language.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfigLanguagePage extends StatefulWidget {
  @override
  _ConfigLanguagePageState createState() => _ConfigLanguagePageState();
}

class _ConfigLanguagePageState extends State<ConfigLanguagePage> {

  final _languageController = GetIt.I<LanguageController>();
  int value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = int.parse(_languageController.idioma["value_language"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_languageController.idioma["configuracoes"]), centerTitle: true),
      bottomSheet: InkWell(
        onTap: (){
          _languageController.alterarIdiomaUsuario(value);
          _languageController.recuperarIdiomaUsuario()
            .then((value){
              Navigator.pop(context);
            });
        
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
                _languageController.idioma["salvar_continuar"],
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
          InkWell(
              onTap: (){
                setState(() {
                  value = 1;
                });
              },
              child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: value == 1 ? Colors.black : Colors.black26),
              ),
              child: ListTile(
                title: Text(_languageController.idioma["portuguesa"], style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
                subtitle: Text(_languageController.idioma["lingua_portuguesa"], style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
              ),
            ),
          ),
          InkWell(
            onTap: (){
               setState(() {
                  value = 2;
                });
            },
            child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: value == 2 ? Colors.black:Colors.black26),
            ),
            child: ListTile(
              title: Text(_languageController.idioma["ingles"], style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
              subtitle: Text(_languageController.idioma["lingua_ingles"], style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
            ),
          )),
          InkWell(
          onTap: (){
             setState(() {
                  value = 3;
                });
          },  
          child: 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: value == 3 ? Colors.black:Colors.black26),
            ),
            child: ListTile(
              title: Text(_languageController.idioma["espanhol"], style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
              subtitle: Text(_languageController.idioma["lingua_espanhola"], style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
            ),
          )),
             ],
      ),
    );
  }
}