
import 'dart:math';

import 'package:flutter/material.dart';



class Help extends StatefulWidget {

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
void selectionPage(BuildContext ctx,int n){

  Navigator.of(ctx).pushNamed(

    '/'
  );
}

double _vlaue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Help"),

      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: _vlaue *(pi/180),
         child: Container(
            color: Colors.deepPurpleAccent,
            width: _vlaue,
            height: _vlaue,
          )
          ),
          Text("value :${_vlaue}",style: TextStyle(fontSize: 20),),
          Slider(value: _vlaue,
              onChanged: (double value){

            setState(() {
              _vlaue=value;
            });
              },
            min: 0,
              max: 500,
            divisions: 10,
            inactiveColor: Colors.deepOrangeAccent,

          )
        ],
      ),
    );
  }
}