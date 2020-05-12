import 'package:estacionamentodigital/pages/inserir_veiculo.dart';
import 'package:flutter/material.dart';

class CompraCartaoPage extends StatefulWidget {
  @override
  _CompraCartaoPageState createState() => _CompraCartaoPageState();
}

class _CompraCartaoPageState extends State<CompraCartaoPage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      onPageChanged: (value){
        print(value);
      },
      children: [
        InserirVeiculoPage(),
        Container(
          color: Colors.blue,
          child: RaisedButton(
            child: Text("Leon"),
            onPressed: (){
            setState(() {
              _controller.animateToPage(2, duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
            });
          }),
        ),
        Container(color: Colors.white),
      ],
    ));
  }
}
