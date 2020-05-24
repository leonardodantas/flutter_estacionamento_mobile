import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:estacionamentodigital/controllers/cartao.dart';
import 'package:estacionamentodigital/views/pages/finalizar.dart';
import 'package:estacionamentodigital/views/pages/inserir_veiculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class InserirCartao extends StatefulWidget {
  @override
  _InserirCartaoState createState() => _InserirCartaoState();
}

class _InserirCartaoState extends State<InserirCartao> {
  
  final _cartaoController = GetIt.I<CartaoController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inserir Cartão"),
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
                'assets/card.png',
              ),
              SizedBox(
                height: 30,
              ),
              Observer(builder: (_){
                return Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    errorText: _cartaoController.cartaoModel.validarNumeroCartao() ? "Minimo de 16" : null,
                    labelText: "Numero",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.number,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: _cartaoController.cartaoModel.setNumeroCartao,
                ),
              );
              }),
              Observer(builder: (_){
                return 
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Validade",
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
                  onChanged: _cartaoController.cartaoModel.setDataValidadeCartao,
                ),
              );
              }),
              Observer(builder: (_){
                return Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    errorText: _cartaoController.cartaoModel.validarNomeCartao() ? "Minimo de 8" : null,
                    labelText: "Nome no Cartão",
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
                  onChanged: _cartaoController.cartaoModel.setNomeCartao,
                  
                ),
              );  
              }),
              Observer(builder: (_){
                return Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    errorText: _cartaoController.cartaoModel.validarCVCartao() ? "Minimo de 3" : null,
                    labelText: "CV",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.number,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: _cartaoController.cartaoModel.setCV,
                ),
              );
              },),
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
                              child: Text("Cancelar",
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
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
                              child: Text("Proximo",
                                  style: TextStyle(color: Colors.white)),
                            )),
                        onPressed: () {
                          _cartaoController.validarInformacoesParaFinalizar()
                            .then((value){
                              if(value) 
                               Navigator.push(context, MaterialPageRoute(builder: (_)=> FinalizarCompra()));
                              else {
                                return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                headerAnimationLoop: false,
                                animType: AnimType.TOPSLIDE,
                                tittle: 'Atenção',
                                desc: 'Informações Incompletas, volte para completá-las',
                                btnOkOnPress: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=> InserirVeiculoPage()));
                                })
                                  .show();  
                              }
                            })
                            .catchError((e){
                              return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                headerAnimationLoop: false,
                                animType: AnimType.TOPSLIDE,
                                tittle: 'Atenção',
                                desc: 'Informações Incompletas, volte para completá-las',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=> InserirVeiculoPage()));
                                })
                                  .show();
                            });
                            
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
