import 'package:estacionamentodigital/controllers/configMapController.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfigMapsPage extends StatefulWidget {
  @override
  _ConfigMapsPageState createState() => _ConfigMapsPageState();
}

class _ConfigMapsPageState extends State<ConfigMapsPage> {

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
      appBar: AppBar(title: Text("Configurações"), centerTitle: true),
      bottomSheet: Container(
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
                'Salvar e Continuar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
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
                border: Border.all(color: value == 1 ? Colors.black : Colors.black26),
              ),
              child: ListTile(
                title: Text("Normal", style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
                subtitle: Text("Ladrilhos normais (tráfego e etiquetas, informações sutis do terreno)", style: TextStyle(color: value == 1 ? Colors.black:Colors.grey),),
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
              border: Border.all(color: value == 2 ? Colors.black:Colors.black26),
            ),
            child: ListTile(
              title: Text("Híbrido", style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
              subtitle: Text("Ladrilhos híbridos (imagens de satélite com alguns rótulos / sobreposições)", style: TextStyle(color: value == 2 ? Colors.black:Colors.grey),),
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
              border: Border.all(color: value == 3 ? Colors.black:Colors.black26),
            ),
            child: ListTile(
              title: Text("Satelite", style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
              subtitle: Text("Ladrilhos de imagens de satélite (fotos aéreas)", style: TextStyle(color: value == 3 ? Colors.black:Colors.grey),),
            ),
          ),
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
                border: Border.all(color: value == 4 ? Colors.black:Colors.black26),
              ),
              child: ListTile(
                title: Text("Terreno", style: TextStyle(color: value == 4 ? Colors.black:Colors.grey),),
                subtitle: Text("Ladrilhos de terreno (indica tipo e altura do terreno)", style: TextStyle(color: value == 4 ? Colors.black:Colors.grey),),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}