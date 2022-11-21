import 'package:flutter/material.dart';

class MyApointment extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;
    return Container(

      child:Center(
        child: Text("My apointment",style: TextStyle(fontWeight: FontWeight.bold),),

      ),
    );
  }
}