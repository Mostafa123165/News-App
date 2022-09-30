import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/lay-out/home-screen/home-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer ;
  void _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext) ;
  }

  void _goNext(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>const HomeScreen()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _startDelay() ;
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image(
          image: AssetImage(
            'assets/image/good.png'
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel() ;
    super.dispose();
  }
}
