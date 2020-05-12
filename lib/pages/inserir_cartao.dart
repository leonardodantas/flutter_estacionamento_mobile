import 'package:estacionamentodigital/pages/finalizar.dart';
import 'package:flutter/material.dart';

class InserirCartao extends StatefulWidget {
  @override
  _InserirCartaoState createState() => _InserirCartaoState();
}

class _InserirCartaoState extends State<InserirCartao> {
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
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Numero",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
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
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Nome no Cartão",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "CV",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
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
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> FinalizarCompra()));
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
