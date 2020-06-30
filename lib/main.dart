import 'package:animated_splash/animated_splash.dart';
import 'package:estacionamentodigital/controllers/cartao.dart';
import 'package:estacionamentodigital/controllers/configMapController.dart';
import 'package:estacionamentodigital/controllers/map.dart';
import 'package:estacionamentodigital/controllers/user.dart';
import 'package:estacionamentodigital/views/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main(){

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<MapController>(MapController());
  getIt.registerSingleton<UserController>(UserController());
  getIt.registerSingleton<CartaoController>(CartaoController());
  getIt.registerSingleton<ConfigMapController>(ConfigMapController());
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Function duringSplash = () {
    int a = 123 + 23;

    if (a > 100)
      return 1;
    else
      return 2;
  };

   Map<int, Widget> op = {1: LoginScreen(), 2: LoginScreen()};

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplash(
            customFunction: duringSplash,
              imagePath: 'assets/home.png',
              home: LoginScreen(),
              duration: 3000,
              type: AnimatedSplashType.BackgroundProcess,
              outputAndHome: op,
            )  
    );
  }
}

