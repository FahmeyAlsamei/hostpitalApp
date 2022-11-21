
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/data.dart';
import 'package:project/models/language.dart';

import '../bottom_bar_button/appointment.dart';
import '../bottom_bar_button/settings.dart';
import '../modules/drawer_menu/add_product/add_products.dart';
import '../modules/login/login.dart';



class MyDrawer extends StatelessWidget {


  // void selectScreen(BuildContext ctx, int n) {
  //   Navigator.of(ctx).pushNamed(
  //       n==1? '/':(n==2)?'/appo':(n==3)? '/edit':(n==4)?AddProducts.routeName :
  //       (n==5)?'/help':(n==6)?'/aboutus':(n==7)?'/connectus':(n==8)? '/login':'/logout',
  //
  //
  //
  //       arguments: {
  //         "id":10,
  //         'title':"fahmey"
  //
  //       }
  //   );
  // }

Widget shapeFormat( String title, IconData icon ,Function() function){

  return Container(
       height: 45,
      child:ListTile(

    title: Text(title, style:const TextStyle(fontSize:14)),
    leading:Icon(icon, color:  Colors.black),
    onTap: function,

  ));
}

bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;


    return Drawer(
      child:Container(

        width: 30,
        child:ListView(

        children: [

           UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topLeft,
                 end: Alignment.bottomCenter,
              stops: const [
                1,0.5
              ],
              colors:[
               color,
                color.withOpacity(0.6),

              ]),



              borderRadius: const BorderRadius.only(bottomRight:const Radius.circular(30),bottomLeft:const Radius.circular(30)),

            ),

             accountName: Text(AppData.UserAccountData!=null&&AppData.UserAccountData!.id!=0?AppData.UserAccountData!.Full_Name!:"مرحباً بك !",style: const TextStyle(fontSize:20,color: Colors.white),),
             accountEmail: Text(AppData.UserAccountData!=null&&AppData.UserAccountData!.id!=0?AppData.UserAccountData!.PhoneNo!:"",style: const TextStyle(fontSize: 18,color: Colors.white),),
             currentAccountPicture: GestureDetector(

               child: const CircleAvatar(

                 backgroundImage:AssetImage("images/hospital3.jpg"),
               ),
               onTap:(){ print("this your account");},
             ),


           ),



          Column(
            children: [

              shapeFormat(isEnglish?"Home":"الرائسية", Icons.home_outlined,
                  (){
                    Navigator.of(context).pushReplacementNamed('home');
                  }
              ),
              shapeFormat(isEnglish?"Appointment":"المواعيد", Icons.list_alt_outlined, (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return MyAppointment();
                  })
                );

              }),

              shapeFormat(isEnglish?"Setting":"الإعدادات", Icons.settings_outlined, (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return Settings();
                  })
                );
              }),
              // shapeFormat("Help", Icons.help_outline, context, 5),
              //
              //
              shapeFormat(isEnglish?"About Us":"من نحن", Icons.info_outlined, (){

              }),
              // shapeFormat("Connect Us", Icons.message_outlined, context, 7),
               shapeFormat(isEnglish?"Share the App":"مشاركة التطبيق", Icons.share_outlined, (){}),
              AppData.UserAccountData!=null&&
                  AppData.UserAccountData!.id!=null&&
                  AppData.UserAccountData!.id!=0? SizedBox():shapeFormat(isEnglish?"Log In":"تسجيل دخول", Icons.login_outlined,
                  (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                     return LogIn();
                    }));
                  }
              ),


              AppData.UserAccountData!=null&&
                  AppData.UserAccountData!.id!=null&&
                  AppData.UserAccountData!.id==0?SizedBox():shapeFormat(isEnglish?"Log Out":"تسجيل خروج", Icons.logout_outlined,
                  (){
                    AccountConfig.Logout();
                    Navigator.of(context).pushReplacementNamed('home');


                  }
              ),






            ],
          ),
          ]
      )
      )
    );







  }
}
