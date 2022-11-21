import 'package:flutter/material.dart';
import 'package:project/bottom_bar_button/appointment.dart';
import 'package:project/bottom_bar_button/profile.dart';
import 'package:project/bottom_bar_button/settings.dart';
import 'package:project/models/language.dart';
import '../../modules/drawer_menu/add_product/add_products.dart';
import 'main_screen_inside_home.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {


  int currentTab = 0;



  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainScreen();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: color,


            onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>AddProducts())
          );
            },
            child: Icon(Icons.add),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MainScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? color : Colors.grey,
                        ),
                        Text(
                          isEnglish?'Home':"الرائسية",
                          style: TextStyle(
                            color: currentTab == 0 ? color : Colors.grey,
                              fontWeight: isEnglish?FontWeight.w500:FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyAppointment(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart_rounded,
                          color: currentTab == 1 ? color : Colors.grey,
                        ),
                        Text(
                          isEnglish?'Appointment':"مواعيدي",
                          style: TextStyle(
                            color: currentTab == 1 ? color : Colors.grey,
                              fontWeight: isEnglish?FontWeight.w500:FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 2 ? color : Colors.grey,

                        ),
                        Text(
                          isEnglish?'Profile':"ملفي",
                          style: TextStyle(
                            color: currentTab == 2 ? color : Colors.grey,
                              fontWeight: isEnglish?FontWeight.w500:FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? color : Colors.grey,
                        ),
                        Text(
                          isEnglish?'Settings':"الإعدادات",
                          style: TextStyle(
                            color: currentTab == 3 ? color : Colors.grey,
                              fontWeight: isEnglish?FontWeight.w500:FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
