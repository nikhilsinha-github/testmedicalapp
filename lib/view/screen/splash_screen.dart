import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/view/screen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //navigate
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Image.asset(
        splashImage,
        fit: BoxFit.cover,
        height: sh,
        width: sw,
      ),
    );
  }
}
