import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
            child: LoadingFlipping.circle(
          borderColor: Colors.blue,
          borderSize: 3.0,
          size: 50.0,
          backgroundColor: Colors.blue
        ));
  }
}