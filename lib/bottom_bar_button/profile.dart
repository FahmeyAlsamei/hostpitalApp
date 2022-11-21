import 'package:flutter/material.dart';
import 'package:project/bottom_bar_button/appointment.dart';
import 'package:project/config/data.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/edite_information/edit_profile/Editprofile.dart';
import 'package:project/shared/component/components.dart';
import 'package:project/shared/network/local/data_time.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEngilsh=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  Widget build(BuildContext context) {
    Color color =Theme.of(context).primaryColor;
    return Directionality(
      textDirection: isEngilsh?TextDirection.ltr:TextDirection.rtl ,
      child: Scaffold(
        appBar: AppBar(
         elevation:0,
        ),
        body:Container(
          decoration: defualtBoxDecoration(),
          width: double.infinity,
          child:ListView(

              children: [

          Stack(
            children: [

              Align(
                alignment: Alignment.bottomCenter
                ,
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/2.5),
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/3.2),
                  decoration:BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width/1.1,
                  height:MediaQuery.of(context).size.height/2,

                  child: Column(
                    children: [

                      Center(
                        child: defualtElevatedButtonIcon(
                            title: isEngilsh ? "Update my profile":"تعديل ملفي الشخصي",
                            function:(){

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context){
                                  return EditProfile();
                                })
                              );
                            },
                            icon:Icons.update,
                            paddingHorizatal: 13,
                            border: 25),
                      ),
                      const SizedBox(height:10,),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,


                          ),
                          child: ElevatedButton(
                            onPressed:() {

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder:(context)=>MyAppointment())
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(234, 235, 243, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Row(

                                  children: [
                                Expanded(
                                  child:Icon(Icons.edit_calendar_outlined,color: color,size: 30,),
                                ),
          const SizedBox(width: 10,),
                                Expanded(
                                  flex:10,
                                  child: Text(isEngilsh? "My Appointment":"مواعيدي",style: TextStyle(color: Colors.black,fontWeight: isEngilsh? null:FontWeight.w700),),
                                ),
                                const Expanded(child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,))
                              ]),
                            ),
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,


                          ),
                          child: ElevatedButton(
                            onPressed:() {},
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(234, 235, 243, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Row(

                                  children: [
                                    Expanded(
                                      child:Icon(Icons.favorite,color: color,size: 30,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      flex:10,
                                      child: Text(isEngilsh? "My Favorite":"مفضلاتي",style: TextStyle(color: Colors.black,fontWeight: isEngilsh? null:FontWeight.w700),),
                                    ),
                                    const Expanded(child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,))
                                  ]),
                            ),
                          )
                      ),
                    ],
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(

                    gradient:LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        stops: [
                          1.9,8.5
                        ],
                        colors:[

                          color.withOpacity(0.9),
                          color,
                        ]),



                    borderRadius: const BorderRadius.only(bottomRight:Radius.circular(30),bottomLeft:const Radius.circular(30)),

                  ),
                ),),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(AppData.UserAccountData!=null?AppData.UserAccountData!.Full_Name!:"مرحياً بك !",style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 10),
                      child: Text(AppData.UserAccountData!=null?AppData.UserAccountData!.Email!:"",style: const TextStyle(fontSize: 18,color: Colors.white)),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 5, color: Colors.white),
                            image:DecorationImage(
                              fit: BoxFit.cover,
                              image:AppData.UserAccountData!=null&&AppData.UserAccountData!.images_user!=null&&
                              AppData.UserAccountData!.images_user!.isNotEmpty?
                              NetworkImage(AppData.UserAccountData!.images_user!,) as ImageProvider:
                              const AssetImage("images/hospital3.jpg",),
                            )
                        ),

                      ),
                    )


                  ],
                ),
              ),

            ],
          ),


   ] )
      )),
    );
  }
}
