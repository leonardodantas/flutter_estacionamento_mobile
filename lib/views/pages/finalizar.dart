import 'package:estacionamentodigital/controllers/cartao.dart';
import 'package:estacionamentodigital/controllers/language.dart';
import 'package:estacionamentodigital/views/pages/inicio.dart';
import 'package:estacionamentodigital/views/pages/sucesso_comprar_cartao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FinalizarCompra extends StatefulWidget {
  @override
  _FinalizarCompraState createState() => _FinalizarCompraState();
}

class _FinalizarCompraState extends State<FinalizarCompra> {

  final _cartaoController = GetIt.I<CartaoController>();
  final _languageController = GetIt.I<LanguageController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( 
          title: Text(_languageController.idioma["finalizar_compra"]),
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
                'assets/cart.png',
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  enabled: false,
                  initialValue: _cartaoController.cartaoModel.placaVeiculo.toUpperCase(),
                  decoration: new InputDecoration(
                    labelText: _languageController.idioma["placa_veiculo"],
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  enabled: false,
                  initialValue: _cartaoController.cartaoModel.nomeCartao,
                  decoration: new InputDecoration(
                    labelText: _languageController.idioma["nome"],
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  enabled: false,
                  initialValue: _cartaoController.cartaoModel.cpf,
                  decoration: new InputDecoration(
                    labelText: "CPF",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(
                height: 60,
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
                          //Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> InicioPage()));
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
                              child: Text(_languageController.idioma["botao_finalizar"],
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          this._cartaoController.inserirNovoCartao()
                            .then((value){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> SucessoComprarCartaoPage()));
                            }).catchError((e){
                              print(e);
                            }) ;
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
