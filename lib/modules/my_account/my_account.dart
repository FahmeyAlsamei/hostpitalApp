import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;
    return Container(

      child:Center(
        child: Text("My account",style: TextStyle(fontWeight: FontWeight.bold),),

      ),
    );
  }
}
