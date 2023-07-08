//todo: Walkthrough screens must contain all the screens which will be visible only when the application starts for the first time after the fresh install.
import 'dart:async';

import 'package:alamy/modules/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          //TODO:check version
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/don.gif"),
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      )),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: const DecorationImage(
            image: AssetImage("assets/Alamy-1--unscreen.gif"),
            fit: BoxFit.fitWidth,
          )),
        ),
      ),
    );
  }
}
