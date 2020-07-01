import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/views/pages/config/config.language.dart';
import 'package:estacionamentodigital/views/pages/config/config.maps.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  final _languageController = GetIt.I<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_languageController.idioma["configuracoes"]), centerTitle: true),
      body: ListView(
        children: <Widget>[
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ConfigMapsPage()));
              },
              child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26),
              ),
              child: ListTile(
                leading: Icon(Icons.map, size: 50,),
                title: Text(_languageController.idioma["mapas"], style: TextStyle(color: Colors.grey),),
                subtitle: Text(_languageController.idioma["altere_config_google_maps"], style: TextStyle(color: Colors.grey),),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ConfigLanguagePage()));
            },
            child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
            ),
            child: ListTile(
              leading: Icon(Icons.language, size: 50,),
              title: Text(_languageController.idioma["idioma"], style: TextStyle(color: Colors.grey),),
              subtitle: Text(_languageController.idioma["altere_idioma"], style: TextStyle(color: Colors.grey),),
            ),
          ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
            ),
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50,),
              title: Text(_languageController.idioma["conta"], style: TextStyle(color: Colors.grey),),
              subtitle: Text(_languageController.idioma["apagar_conta"], style: TextStyle(color: Colors.grey),),
            ),
          )
 
 
 
        ],
      ),
    );
  }
}