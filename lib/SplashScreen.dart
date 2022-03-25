import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with
    SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation sizeAnimation;
  @override
  void initState() {
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 2));

    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);

    controller.addListener(() => setState(() {}));
    TickerFuture tickerFuture = controller.repeat();
    tickerFuture.timeout(Duration(milliseconds:  2 *1000), onTimeout:  () {
      controller.forward(from: 0);
      controller.stop(canceled: true);
    });
    // TODO: implement initState
    super.initState();
    _navigatetohome();

  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2600));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(115, 79, 150, 1),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Texty',style:GoogleFonts.dongle(fontSize: sizeAnimation.value,color:Colors.white)))
      ])
    );

  }
}
