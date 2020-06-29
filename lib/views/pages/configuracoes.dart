import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações"), centerTitle: true),
      body: ListView(
        children: <Widget>[
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
              leading: Icon(Icons.map, size: 50,),
              title: Text("Maps", style: TextStyle(color: Colors.grey),),
              subtitle: Text("Altere configurações do Google Maps", style: TextStyle(color: Colors.grey),),
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
              leading: Icon(Icons.language, size: 50,),
              title: Text("idioma", style: TextStyle(color: Colors.grey),),
              subtitle: Text("Altere o idioma", style: TextStyle(color: Colors.grey),),
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
              title: Text("Conta", style: TextStyle(color: Colors.grey),),
              subtitle: Text("Apagar a sua conta", style: TextStyle(color: Colors.grey),),
            ),
          )
 
 
 
        ],
      ),
    );
  }
}