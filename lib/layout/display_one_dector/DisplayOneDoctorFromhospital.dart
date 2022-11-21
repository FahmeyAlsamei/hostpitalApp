import 'package:flutter/material.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/users/doctors.dart';
import 'package:project/shared/network/local/data_time.dart';
import '../../config/data.dart';


import '../../modules/add_product_information/add_doctors_departments/add_doctor_screen.dart';
import '../../modules/apointment.dart';
import '../../shared/component/components.dart';

class DisplayOneDoctorFromhospital extends StatefulWidget {
  @override
  Doctors doctor;
  DisplayOneDoctorFromhospital(this.doctor);
  State<DisplayOneDoctorFromhospital> createState() => _DisplayOneDoctorState();
}

class _DisplayOneDoctorState extends State<DisplayOneDoctorFromhospital> {
  Color color = const Color.fromRGBO(119, 205, 188, 1);
  bool isSmallActiveTime = false;
  bool isReadmore = false;
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;
 bool is_favorite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: defualtBoxDecoration(),
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 1,
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(119, 205, 188, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon:  Icon(
                                  isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 85,
                            ),
                            Text(isEnglish?"DOCTOR":'الدكتور',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white)),
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: const [
                              BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 5,
                                color: Color.fromRGBO(119, 205, 188, 1),
                              )
                            ],
                            image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: widget.doctor.images_main !=null&&widget.doctor!.hospital!.images_back!=null && widget.doctor.images_main!.isNotEmpty?
                            NetworkImage(widget.doctor!.hospital!.images_back!) as ImageProvider
                                :const AssetImage('images/hospital3.jpg'))),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    boxShadow: const [
                                      BoxShadow(
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        color: Color.fromRGBO(119, 205, 188, 1),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:widget.doctor.images_main !=null && widget.doctor.images_main!.isNotEmpty?
                                        NetworkImage(widget.doctor.images_main!) as ImageProvider
                                            :const AssetImage('images/hospital3.jpg')
                                    )),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 5, color: Colors.white),
                                      color: const Color.fromRGBO(138, 215, 228, 1),
                                    ),
                                    child: const Icon(
                                      Icons.monitor_heart_sharp,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          )),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 8,
                                  left: 25
                              ),
                              height: (MediaQuery.of(context).size.height / 3) -
                                  (MediaQuery.of(context).size.height / 4),
                              child:IconButton(
                                color: color,
                                onPressed: (){
                                  setState((){
                                    is_favorite =!is_favorite;
                                  });
                                },

                                icon: Icon(is_favorite?Icons.favorite_border_outlined:Icons.favorite_outlined,size: 45,color:Theme.of(context).primaryColor,),

                              ) )),
                      Visibility(
                        visible: AppData.UserAccountData!=null&&
                            AppData.UserAccountData!.id!= null&&
                            AppData.UserAccountData!.id!=0&&
                            AppData.UserAccountData!.id==widget.doctor!.hospital!.id!,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 8,
                                ),
                                height: (MediaQuery.of(context).size.height / 3) -
                                    (MediaQuery.of(context).size.height / 4),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(5),
                                      color: color),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children:  [
                                        Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          isEnglish?"Delete":"حذف",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))),
                      ),
                      Visibility(
                        visible: AppData.UserAccountData!=null&&
                            AppData.UserAccountData!.id!= null&&
                            AppData.UserAccountData!.id!=0&&
                            AppData.UserAccountData!.id==widget.doctor!.hospital!.id!,
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                ),
                                height: (MediaQuery.of(context).size.height / 3) -
                                    (MediaQuery.of(context).size.height / 4),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width /4.1,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromRGBO(119, 205, 188, 1)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                            return add_doctor(
                                              // worktime: widget.doctor.activTime,

                                              // ,

                                            );
                                          }));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children:  [
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          isEnglish?"Edit":"تعديل",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    widget.doctor.Name!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    widget.doctor.specialization!,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: Text(
                    widget.doctor.specialization!,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: defualtBoxDecoration1(),

                  child: Column(
                    children: [
                      Card(
                        elevation:1,
                        child: Container(
                          height: isReadmore ? 194 : 90,
                          decoration: defualtBoxDecoration1(),
                          child: Stack(children: [
                            Container(
                              // height: height1,

                              height: isReadmore ? 194 : 90,
                              width: MediaQuery.of(context).size.width,

                              padding: const EdgeInsets.only(top: 35,left: 10,right: 10),

                              child: buildText(
                                  widget.doctor.Detial_AR!,
                                  'Crimson_Pro',
                                  FontWeight.w600,
                                  isReadmore),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  // height1=(height1 !=194)?;
                                  isReadmore = !isReadmore;
                                });
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child:  Row(
                                    children: [
                                       Expanded(
                                        flex: 5,
                                        child: Text(
                                            isEnglish? 'MORE ABOUT DOCTOR':"الكثير عن الدكتور",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Anton',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing:isEnglish? 2:0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          isReadmore
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down_circle,
                                          color: color,
                                          size: isReadmore? 40:30,
                                        ),
                                      )
                                    ],
                                  ),


                                ),
                              ),
                            ),


                          ]),
                        ),
                      ),



                      const SizedBox(
                        height: 10,
                      ),

                      ///// Work time
                      InkWell(
                        onTap:(){
                          setState((){
                            isSmallActiveTime=!isSmallActiveTime;
                          });
                        } ,
                        child: Card(
                          color:Colors.white,
                          elevation: 1,
                          child: Container(
                            padding: const EdgeInsets.only(top: 1,left: 7,right: 4,bottom: 7),
                            decoration: defualtBoxDecoration1(),
                            child: Column(
                              children: [
                                Row(

                                  children: [

                                     Expanded(
                                      flex:5,
                                      child: Text(
                                        isEnglish? 'WORK TIME':"اوقات الدوام",
                                        style:  TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Anton',
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: isEnglish?2:0),
                                      ),
                                    ),
                                    if (
                                    widget.doctor.activTime!=null&&
                                        widget.doctor.activTime!.Table_Activ_Time!=null)
                                      Expanded(flex:5,child:
                                      Text(widget.doctor.activTime!.Table_Activ_Time!.Tables_Type_Activ_From!))
                                    else Container(),



                                    // widget.doctor.activTime!.Table_activTime ==null?
                                    // const Expanded(flex: 4,child: Text( "Return null"),)//widget.doctor.activTime!.Table_activTime!.Tables_Type_Activ_From!
                                    //     :Container(),

                                    Expanded(child:  Icon(
                                      isSmallActiveTime ?  Icons.arrow_drop_up_outlined:Icons.arrow_drop_down_circle,
                                      color: color,
                                      size: isSmallActiveTime ?40:30,
                                    ),)
                                  ],
                                ),
                                const SizedBox(height: 20,),

                                Table(
                                    columnWidths: {2:const FractionColumnWidth(0.13)},

                                    children: [


                                      if (widget.doctor.activTime!.Sat_Activ_From!=null&&
                                          widget.doctor.activTime!.Sat_Activ_From!.isNotEmpty&&
                                          widget.doctor.activTime!.Sat_Activ_To!=null&&
                                          widget.doctor.activTime!.Sat_Activ_To!.isNotEmpty) TableRow(children: [
                                        defualtContianerForTableRow(
                                            isEnglish?"Saturday":"الـسـبـت"),
                                        defualtContianerForTableRow2(
                                            widget.doctor.activTime!.Sat_Activ_From !=null? widget.doctor.activTime!.Sat_Activ_From!:""
                                        ),
                                        defualtContianerForTableRow(
                                            isEnglish?"to ":"الـي"),

                                        defualtContianerForTableRow2(
                                            widget.doctor.activTime!.Sat_Activ_To !=null?  widget.doctor.activTime!.Sat_Activ_To!:""),
                                      ]) else TableRow(children: [
                                        defualtContianerForTableRow(
                                            isEnglish?"Saturday":"الـسـبـت"),
                                        defualtContianerForTableRow1(
                                            isEnglish?" Closed":"مـغـلـق"),
                                        defualtContianerForTableRow(
                                            " "),
                                        defualtContianerForTableRow(
                                            " "),
                                      ]),

                                      TableRow(children: [
                                        Visibility(
                                            child:
                                            defualtContianerForTableRow(
                                                ''),
                                            visible:  widget.doctor.activTime!.Sat_Activ_From_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                        ),
                                        Visibility(
                                            child: defualtContianerForTableRow2(
                                                widget.doctor.activTime!.Sat_Activ_From_Scond !=null?  widget.doctor.activTime!.Sat_Activ_From_Scond!:"" ),
                                            visible:  widget.doctor.activTime!.Sat_Activ_From_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                        ),
                                        Visibility(
                                            child:
                                            defualtContianerForTableRow(
                                                isEnglish?"to ":"الـي"),
                                            visible:  widget.doctor.activTime!.Sat_Activ_From_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                        ),
                                        Visibility(
                                            child: defualtContianerForTableRow2(
                                                widget.doctor.activTime!.Sat_Activ_To_Scond !=null?   widget.doctor.activTime!.Sat_Activ_To_Scond!:""),
                                            visible: widget.doctor.activTime!.Sat_Activ_From_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!=null&&
                                                widget.doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                        )
                                      ]),

                                    ]


                                ),

                                displayDataTimeInDoctorScreen(isSmallActiveTime:isSmallActiveTime, doctor: widget.doctor)
                              ],
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height/14-20,
                ),

                Container(
                    padding: const EdgeInsets.all(3),
                    decoration: defualtBoxDecoration1(),
                    child: defualtElevatedButton(
                        title: isEnglish?'APPOINTMENT NOW':"احجز الان",
                        function: () {
                          // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ApointmentScrean(
                                doctors: widget.doctor,
                                hospitals:widget.doctor.hospital!,
                                // hospitals: widget.doctor,


                              )));
                        },
                        paddingHorizatal:0,
                        border: 8)

                ),
                const SizedBox(
                  height: 13,
                ),



              ])),
    );
  }
}
