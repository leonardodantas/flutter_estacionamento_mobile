import 'dart:ui';
import 'package:estacionamentodigital/controllers/cartao.dart';
import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/views/pages/dono_veiculo.dart';
import 'package:estacionamentodigital/views/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class InserirVeiculoPage extends StatefulWidget {
  @override
  _InserirVeiculoPageState createState() => _InserirVeiculoPageState();
}

class _InserirVeiculoPageState extends State<InserirVeiculoPage> {

  final _cartaoController = GetIt.I<CartaoController>();
  final _languageController = GetIt.I<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( _languageController.idioma["veiculo"]),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/car.png',
              ),
              SizedBox(
                height: 60,
              ),
              Observer(builder: (_){
                return Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: _languageController.idioma["placa_veiculo"],
                    errorText: _cartaoController.cartaoModel.validarPlacaVeiculo() ? _languageController.idioma["validacao_minimo_7"] : null,
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
                  onChanged: _cartaoController.cartaoModel.setPlacaVeiculo,
                ),
              );
              }),
              SizedBox(
                height: 150,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        child: Container(
                            height: 60,
                            child: Center(
                              child: Text(_languageController.idioma["botao_cancelar"],
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> InicioPage()));
                        },
                        shape: StadiumBorder(),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        child: Container(
                            height: 60,
                            child: Center(
                              child: Text(_languageController.idioma["botao_proximo"],
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> DonoVeiculoPage()));
                        },
                        shape: StadiumBorder(),
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
