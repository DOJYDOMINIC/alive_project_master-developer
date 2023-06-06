import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';



class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Center(child: Image(image: AssetImage('assets/logo.png'))),
      nextScreen: LoginScreen(),
      duration:1500,
      splashIconSize: 200,
    );
  }
}
