import 'dart:async';

import '../../layout/home/home_screen.dart';

import 'package:flutter/material.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  void secondPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
      (Route<dynamic> route) => false,
    );
  }

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), secondPage);
  }

  @override
  Widget build(BuildContext context) {
    return MySpashScreen();
  }
}

class MySpashScreen extends StatefulWidget {
  State<MySpashScreen> createState() => _MySpashScreenState();
}

class _MySpashScreenState extends State<MySpashScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromRGBO(170,234,201,0.7),
                  Color.fromRGBO(138,215,228,0.6),

                ])

           ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
        height: MediaQuery.of(context).size.height/4.3,

          child: const Image(
            height: 80,
            fit: BoxFit.contain,
            image:AssetImage('images/spulsh.png') ,
          ),

        ),
            const SizedBox(height: 10,),

            const Text("For you   لِأجــلـكـ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600,fontFamily: 'Anton'),),
            const SizedBox(height: 20,),

             Center(

                child:  CircularProgressIndicator(
                  backgroundColor:  Color.fromRGBO(78,162,152,1),
                  color: Colors.white,
                  strokeWidth: 4,
                  semanticsLabel: 'Loading...',
                  semanticsValue: 'Loading...',
                ),
              ),
          ],
        ),
        )

    );
  }
}
