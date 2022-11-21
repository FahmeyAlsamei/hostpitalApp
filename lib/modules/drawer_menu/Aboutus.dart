
import 'package:flutter/material.dart';



class AboubtUs extends StatelessWidget {


  void selectionPage(BuildContext ctx,int n){

    Navigator.of(ctx).pushNamed(

        '/'
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" About Us"),

      ),

      body:null,
    );
  }
}