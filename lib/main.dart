import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project/config/data.dart';
import 'package:project/modules/apointment.dart';
import 'package:project/splash_screen.dart';


import 'layout/home/home_screen.dart';
import 'modules/add_product_information/hospital_information.dart';
import 'layout/display_hospital/display_hospital_list.dart';
import 'modules/drawer_menu/Aboutus.dart';
import 'modules/drawer_menu/Appointment.dart';
import 'modules/drawer_menu/ConnectUs.dart';
import 'modules/drawer_menu/Help.dart';
import 'modules/drawer_menu/LogOut.dart';
import 'modules/drawer_menu/add_product/add_products.dart';
import 'modules/edite_information/edit_profile/Editprofile.dart';
import 'modules/login/login.dart';
import 'modules/work_time/work_time.dart';

void main() {
  AccountConfig.checkHaveAndVeryAccount();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {

  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //
       initialRoute: '/',
      routes: {
        '/':(context)=>SpashScreen(),
        'home': (context) => MyHomePage(),
        '/edit': (context) => EditProfile(),
        '/help': (context) => Help(),
        '/abotus': (context) => AboubtUs(),
        '/connectus': (context) => ConnectUs(),
        '/logout': (context) => LogOut(),
        '/login':(context)=>LogIn(),
        AddProducts.routeName:(context)=>AddProducts(),
        HospitalInfo.routeName:(context)=> HospitalInfo(),
        WorkTime.routeName:(context)=>WorkTime(),
        DisplayHospitalList.routeName:(context)=>DisplayHospitalList(),

      },
      theme: ThemeData(


        primaryColor: const Color.fromRGBO(78,162,152,1),
        scaffoldBackgroundColor:const  Color.fromRGBO(234, 235, 243, 1) ,
         appBarTheme: const AppBarTheme(
           backwardsCompatibility: true,


           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Color.fromRGBO(235, 236, 243, 1),
             statusBarIconBrightness: Brightness.dark
           ),
           titleTextStyle:  TextStyle(
               fontSize:18,
               fontFamily: 'Anton',
               fontWeight: FontWeight.w300,
               letterSpacing: 2),
           backgroundColor:const          Color.fromRGBO(78,162,152,1),
             elevation: 1
         ),
        dialogBackgroundColor:Color.fromRGBO(234, 235, 243,1),

      ),
        darkTheme: ThemeData(
          iconTheme: IconThemeData(color: Colors.red),
        )
    );
  }
}
