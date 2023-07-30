import 'package:flutter/material.dart';
import 'package:CFC/src/constants/image_strings.dart';
import 'package:CFC/src/constants/sizes.dart';
import 'package:CFC/src/constants/text_strings.dart';
import 'package:CFC/src/features/authentication/screens/welcome/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0.0 : -100.0,
              //0.0 is true & -100.0 is false
              left: animate ? -500.0 : -580.0,
              //-500.0 is true & -580.0 is false
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Image(
                  image: AssetImage(SplashTopIcon),
                ),
              ),),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 230.0,
            left: animate ? DefaultSize : -80.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTagLine,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? -135.0 : -10.0,
              left: animate ? -900.0 : 100,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Image(
                  image: AssetImage(SplashImage),
                ),
              )),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 3000));
    setState(() => animate = false);
    await Future.delayed(const Duration(milliseconds: 1550));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Welcome()));
  }
}
