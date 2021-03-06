import 'package:estacionamentodigital/controllers/configMapController.dart';
import 'package:estacionamentodigital/controllers/language.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfigMapsPage extends StatefulWidget {
  @override
  _ConfigMapsPageState createState() => _ConfigMapsPageState();
}

class _ConfigMapsPageState extends State<ConfigMapsPage> {

  final _languageController = GetIt.I<LanguageController>();
  final ConfigMapController _configMapController = GetIt.I<ConfigMapController>();
  int value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = _configMapController.getValueType;
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_languageController.idioma["configuracoes"]), centerTitle: true),
      bottomSheet: InkWell(
        onTap: (){
          _configMapController.alterarConfigMaps(value)
            .then((value) => Navigator.pop(context));
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
                title: Text(_languageController.idioma["normal"], style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
                subtitle: Text(_languageController.idioma["mapa_normal"], style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
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
              title: Text(_languageController.idioma["hibrido"], style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
              subtitle: Text(_languageController.idioma["mapa_hibrido"], style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
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
              title: Text(_languageController.idioma["satelite"], style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
              subtitle: Text(_languageController.idioma["mapa_satelite"], style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
            ),
          )),
          InkWell(
              onTap: (){
                 setState(() {
                  value = 4;
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
                border: Border.all(color: value == 4 ? Colors.black:Colors.black26),
              ),
              child: ListTile(
                title: Text(_languageController.idioma["terreno"], style: TextStyle(color: value == 4 ? Colors.black:Colors.grey),),
                subtitle: Text(_languageController.idioma["mapa_terreno"], style: TextStyle(color: value == 4 ? Colors.black:Colors.grey),),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}