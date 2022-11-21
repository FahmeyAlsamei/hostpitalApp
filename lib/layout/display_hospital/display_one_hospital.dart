
import 'package:flutter/material.dart';


import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:location/location.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../api/api_hospital.dart';
import '../../config/data.dart';
import '../../models/language.dart';
import '../../modules/add_product_information/hospital_information.dart';
import '../../modules/apointment.dart';
import '../../modules/drawer_menu/add_product/add_products.dart';
import '../../modules/users/hospital_model.dart';
import '../../shared/component/components.dart';
import '../../shared/network/local/data_time.dart';
import '../map/map.dart';
import 'Rat_widget.dart';
import 'display_departement_hospital_list.dart';
import 'display_doctors_hospital_list.dart';
import 'display_hospital_list.dart';
import 'review_and_rating.dart';


class DisplayOneHospital extends StatefulWidget {

  Hospital hospital;
  DisplayOneHospital(this.hospital);
  @override
  State<DisplayOneHospital> createState() => _DisplayOneHospitalState();
}

class _DisplayOneHospitalState extends State<DisplayOneHospital> {
  bool isSmall = true;
  bool isSmallActiveTime = false;
  bool isReadmore= false;
  //Color color= const color;
  bool is_favorite=false;
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  bool isShowMap=false;
  Color color=const Color.fromRGBO(78,162,152,1);//Color.fromRGBO(41, 149, 150, 0.9);

  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
          context: context,
           builder: (BuildContext context){

            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                  side: const BorderSide(
                      color: Colors.grey
                  )

              ),
              backgroundColor:  Colors.white,
              child: Container(

                height:isEnglish? MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/2.5,

                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),

                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              const AssetImage('images/stop_ar.jpg',))),
                    ),
                    const SizedBox(height: 10,),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(isEnglish? ''' We try as much as as possible to add correct information. if there is wrong information ,please report it by clicking on Report and writing a comment'''
                          : ''' نحن نحاول قدر الامكان اضافة معلومات صحيحة. في حالة وجود معلومات خاطئة يرجى التبلغ عنها بالضغط على ابلاغ وكتابة تعليق''',style: TextStyle(fontSize:isEnglish? 14:18,fontWeight: isEnglish?FontWeight.w500:FontWeight.w500),textAlign: TextAlign.center,),
                   ),

                    const SizedBox(height: 8,),
                   Row(
                     children: [

                       const SizedBox(width: 10,),
                       Expanded(child:   defualtElevatedButton(
                           title: isEnglish? "Agree": " موافق ",
                           function: (){},

                           border: 8,
                           paddingHorizatal: 2,
                           paddingVerical: 10,

                       ),),

                       const SizedBox(width: 10,),
                       Expanded(child:   defualtElevatedButtonWithColor(
                           title: isEnglish?" Later ": "لاحقا",
                           function: (){},

                           border: 8,
                           paddingHorizatal: 2,
                           paddingVerical: 10,
                           background:Colors.grey

                       ),),

                     ],
                   ),
                    const SizedBox(height: 15,),

                  ],
                ),
              ),
            );

          });
    });
  }

  double? wid;
  double? mapHeight;
  @override
  Widget build(BuildContext context) {
    wid= MediaQuery.of(context).size.width ;
    mapHeight= MediaQuery.of(context).size.height / 4.round();

    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Almotawakel",
        //       style:
        //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        // ),


          body: Scaffold(

              body: Container(
              decoration:defualtBoxDecoration(),
              child:  SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 13),
                  child: Column( children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5 ),
                        child: Card(
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color:  color,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context)..pop();
                                      },
                                      icon:  Icon(
                                        isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(isEnglish?"HOSPITAL":"مـــسـتـشـفـى",
                                      style:  TextStyle(
                                          fontWeight: FontWeight.bold,letterSpacing: isEnglish?2:0,
                                          fontSize: 20,
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        )),
                    const SizedBox(
                      height: 7,
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
                                boxShadow:  [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    color: color,
                                  )
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: widget.hospital.images_back!=null&&
                                        widget.hospital.images_back!.isNotEmpty?

                                    NetworkImage(widget.hospital.images_back!)  as ImageProvider:
                                    const AssetImage('images/10.JPG'))),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 3),
                                        boxShadow:  [
                                          BoxShadow(
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            color: color,
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:widget.hospital.images_main!=null&&
                                                widget.hospital.images_main!.isNotEmpty?

                                            NetworkImage(widget.hospital.images_main!)  as ImageProvider:
                                            const AssetImage('images/foryou.png'))),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(width: 5, color: Colors.white),
                                          color: Theme.of(context).primaryColor
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
                                    color: Colors.pinkAccent,
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
                                AppData.UserAccountData!.id==widget.hospital.created_by!.id,


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
                                          border: Border.all(color: Colors.white, width: 3),
                                          borderRadius: BorderRadius.circular(5),
                                          color:color

                                      ),
                                      child: InkWell(
                                        onTap: () {

                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context){
                                                return AddProducts(isFromHospital: true,
                                                  hospital: widget.hospital,
                                                  worktime: widget.hospital.Activ_Time,




                                                );
                                              })
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children:  [
                                            Icon(
                                              Icons.person_add_alt,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              isEnglish?"ADD":"إضــافـة",
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 16),
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
                                AppData.UserAccountData!.id==widget.hospital.created_by!.id,
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
                                      width: MediaQuery.of(context).size.width / 4.1,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white, width: 3),
                                          borderRadius: BorderRadius.circular(5),
                                          color:  color),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context){
                                                return  HospitalInfo(modifyButtonPressed: true,hospital: widget.hospital,);
                                              })
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
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
                                              isEnglish?"Edit":"تـعـديـل",
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 16),
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
                      height: 13,
                    ),
                  Center(
                    child: Text(widget.hospital.Name!,
                        textAlign: TextAlign.center,
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,fontFamily:'Racing_Sans_One' ,)) ,
                  ),
                    const SizedBox(
                      height: 13,
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
                                    widget.hospital.Detial_AR!,
                                    // "Almotawakel  Hospital  is  tertiary  care hospital with all specialities and super specialities under one roof performing entire range of diagnostic, therapeutic and interventional procedures.",
                                    'Slabo27px',
                                    FontWeight.w700,
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
                                    padding: const EdgeInsets.only(left: 5,right: 7),
                                    child:  Row(
                                      children: [
                                       Expanded(
                                          flex: 6,
                                          child: Text(
                                            isEnglish?'WHO WE ARE':"مـن نـحـن",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Anton',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: isEnglish?2:0),
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
                          height: 7,
                        ),

                        //TODO: work time code start here
                        widget.hospital.Activ_Time!=null?
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
                              height: isSmallActiveTime ? 294 : 120,
                              padding: const EdgeInsets.only(top: 1,left: 7,right: 7,bottom: 7),
                              decoration: defualtBoxDecoration1(),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(

                                      children: [

                                       Expanded(
                                          flex: 4,
                                          child: Text(
                                            isEnglish?'WORK TIME':"أوقــات الــدوام",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Anton',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: isEnglish?2:0),
                                          ),

                                        ),


                                        if (widget.hospital.Activ_Time!.Table_Activ_Time!=null) Expanded(flex:5,child: Text(widget.hospital.Activ_Time!.Table_Activ_Time!.Tables_Type_Activ_From!)) else Container(),
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


                                          if (widget.hospital.Activ_Time!.Sat_Activ_From!=null&&
                                              widget.hospital.Activ_Time!.Sat_Activ_From!.isNotEmpty&&
                                              widget.hospital.Activ_Time!.Sat_Activ_To!=null&&
                                              widget.hospital.Activ_Time!.Sat_Activ_To!.isNotEmpty) TableRow(children: [
                                            defualtContianerForTableRow(
                                                isEnglish?"Saturday":"الـسـبـت"),
                                            defualtContianerForTableRow2(
                                                widget.hospital.Activ_Time!.Sat_Activ_From !=null? widget.hospital.Activ_Time!.Sat_Activ_From!:""
                                            ),
                                            defualtContianerForTableRow(
                                                isEnglish?"to ":"الـي"),

                                            defualtContianerForTableRow2(
                                                widget.hospital.Activ_Time!.Sat_Activ_To !=null?  widget.hospital.Activ_Time!.Sat_Activ_To!:""),
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
                                                visible:  widget.hospital.Activ_Time!.Sat_Activ_From_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                            ),
                                            Visibility(
                                                child: defualtContianerForTableRow2(
                                                    widget.hospital.Activ_Time!.Sat_Activ_From_Scond !=null &&widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty ?  widget.hospital.Activ_Time!.Sat_Activ_From_Scond!:"" ),
                                                visible:  widget.hospital.Activ_Time!.Sat_Activ_From_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                            ),
                                            Visibility(
                                                child:
                                                defualtContianerForTableRow(
                                                    isEnglish?"to ":"الـي"),
                                                visible:  widget.hospital.Activ_Time!.Sat_Activ_From_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                            ),
                                            Visibility(
                                                child: defualtContianerForTableRow2(
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond !=null&&widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?   widget.hospital.Activ_Time!.Sat_Activ_To_Scond!:""),
                                                visible: widget.hospital.Activ_Time!.Sat_Activ_From_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null&&
                                                    widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                            )
                                          ]),

                                        ]


                                    ),
                                    displayDataWorkTime(isSmallActiveTime:isSmallActiveTime, hospital: widget.hospital)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ):Container(),



                      ],
                    ),
                  ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(

                      decoration:defualtBoxDecoration1(),
                      child: Row
                        (


                          children: [
                             //TODO:doctor button code start here
                            Expanded(child: Card(
                              elevation: 1,
                              color:  const Color.fromRGBO(240, 239, 241, 1),
                              child: defualtElevatedButtonIcon(
                                  title:  isEnglish?"DOCTORS":"الأطـبـاء",
                                  function:  () {

                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context){

                                          return displayDoctorsInHospitalList(widget.hospital);
                                        })

                                    );

                                  },
                                  background:   color,
                                  paddingHorizatal: 10,
                                  border: 8,
                                  paddingVerical: 13,
                                  icon:Icons.person
                              ),




                            ),),
                            //TODO:departments button code start here
                            Expanded(
                              // Department Button
                              child: Card(
                                elevation: 0,

                                child:  defualtElevatedButtonIcon(
                                    title: isEnglish?"DEPARTMENTS":"الأقـسـام",
                                    function:  () {

                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context){

                                            return displayDepartementHospitalList(
                                              widget.hospital);
                                          })

                                      );

                                    },
                                    paddingVerical: 13,
                                    background:   color,
                                    paddingHorizatal: 0,
                                    border: 8,
                                    icon:Icons.holiday_village
                                )
                              ),

                            ),



                          ]),
                    ),
                    const SizedBox(height: 13,),

                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration:defualtBoxDecoration1(),
                      child: Row(
                        children: [
                          //TODO:appointment now button code start here
                          Expanded(
                            flex: 2,
                            child: defualtElevatedButton(
                                title:  isEnglish?'APPOINTMENT NOW':"احــجــز الان",
                                function: () {
                                  // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>ApointmentScrean(hospitals: widget.hospital,))
                                  );
                                },
                                paddingHorizatal: 15,
                                paddingVerical: 18,
                                border: 8),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          //TODO:call  button code start here
                         Expanded(child: defualtElevatedButton(
                             title: isEnglish?'CALL':"إتـصـال",
                             function: () async{
                                 var url=Uri.parse("tel:${widget.hospital.Phone_Number}");
                                 if(await canLaunchUrl(url)){
                                   await launchUrl(url);
                                 }else{
                                   throw "could not lunch $url";
                                 }
                             },
                             paddingHorizatal: 14,
                             paddingVerical: 18,
                             border: 8),




                        )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 13,
                    ),


                //TODO:Location code start here
                    Container(
                      decoration: defualtBoxDecoration1(),
                     padding: const EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Card(
                              elevation: 1,
                             //Color.fromRGBO(240, 239, 241, 1),
                              child: Container(
                                decoration: defualtBoxDecoration1(),
                                  padding: const EdgeInsets.all(7),

                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height:5,),
                                        Text(
                                          isEnglish?'LOCATION':"الـعـنـوان",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Anton',
                                              fontWeight: isEnglish?FontWeight.w300:FontWeight.w800,
                                              letterSpacing: isEnglish?2:0),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              color: color,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(  widget.hospital.location_Name!,)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ]))),
                          const SizedBox(
                            height: 7,
                          ),
                          //TODO:Raiting and reation code start here
                          widget.hospital
                              .ratingdata!=null&& widget.hospital
                              .ratingdata!.isNotEmpty?
                          Card(
                            child: Column(

                              children: [
                                SizedBox(height: 4,),
                                Text(
                                  isEnglish?"Rating and Reaction" :" التقييم والتفاعل", style:TextStyle(
                                fontSize: 15,
                                fontFamily: 'Anton',
                                fontWeight: isEnglish?FontWeight.w300:FontWeight.w800,
                                letterSpacing: isEnglish?2:0),),
                                SizedBox(height: 2,),
                                Card(
                                  child: ReviewRatingDetialComercialCard(
                                    dataRating:  widget.hospital
                                        .ratingdata!.first
                                   ,),
                                ),

                              ],
                            ),
                          ):Container(),


                          const SizedBox(
                            height: 7,
                          ),

                          Card(
                            color:Colors.white,
                            child: Container(
                              height:  widget.hospital!.latitude !=null &&widget.hospital!.latitude!=0  && widget.hospital!.longitude!=null && widget.hospital!.longitude!=0?mapHeight!+85:80,
                              padding: const EdgeInsets.only(top: 5,left: 15,right: 15,),
                              decoration: defualtBoxDecoration1(),
                              child: Column(
                                children: [

                                  const SizedBox(height: 10,),
                                  widget.hospital!.latitude !=null &&widget.hospital!.latitude!=0  && widget.hospital!.longitude!=null && widget.hospital!.longitude!=0?
                                  Container(

                                    height:  mapHeight!=null?mapHeight!+10:null,


                                    child: MapSample(LatLng(widget.hospital!.latitude!, widget.hospital!.longitude!)),

                                    // decoration: BoxDecoration(
                                    //     //color: Colors.amberAccent,
                                    //     image: DecorationImage(
                                    //
                                    //         image:
                                    //
                                    //         const AssetImage('images/us.JPG',)
                                    //     ),
                                    //     borderRadius: BorderRadius.circular(8)
                                    // ),
                                  )


                                  //
                                  // const SizedBox(height: 10,),
                                  // Container(
                                  //
                                  //   height:  mapHeight+10,
                                  //   padding:const EdgeInsets.all(10) ,
                                  //
                                  //   child: MapWidget(LatLng(widget.hospital!.latitude!, widget.hospital!.longitude!)),
                                  //
                                  //   // decoration: BoxDecoration(
                                  //   //     //color: Colors.amberAccent,
                                  //   //     image: DecorationImage(
                                  //   //
                                  //   //         image:
                                  //   //
                                  //   //         const AssetImage('images/us.JPG',)
                                  //   //     ),
                                  //   //     borderRadius: BorderRadius.circular(8)
                                  //   // ),
                                  // ),


:  SizedBox(
                                    width: double.infinity,
  child:   defualtElevatedButtonIcon(
                                        title:  isEnglish?"Add locations":"اضافة الموقع من الخريطه",
                                        function:  () async{
                                          _permissionGranted = await location.hasPermission();
                                          if (_permissionGranted == PermissionStatus.denied) {
                                            _permissionGranted = await location.requestPermission();

                                          }
                                          if (_permissionGranted == PermissionStatus.granted) {

                                            _serviceEnabled = await location.serviceEnabled();
                                            if (!_serviceEnabled)
                                              _serviceEnabled = await location.requestService();
                                            if (!_serviceEnabled) {

                                              return;

                                            }else{

                                              // return;

                                              _locationData = await location.getLocation();
                                              print(_permissionGranted.toString());
                                              print(_locationData.longitude);
                                              print(_locationData.latitude);
                                              setState(() {
                                                widget.hospital.longitude=_locationData.longitude;
                                                widget.hospital.latitude=_locationData.latitude;
                                                isShowMap=true;
                                              });
                                              HospitalApiProvider _hospitalProvider=new HospitalApiProvider();



                                              Hospital ?_newHospital=await _hospitalProvider.addLocation(_locationData.latitude!, _locationData.longitude!,widget.hospital!.id!);


                                              setState(() {
                                                widget.hospital=_newHospital!;
                                                isShowMap=true;
                                              });
                                              // return;
                                            }
                                          }




                                        },
                                        background:   color,
                                        paddingHorizatal: 0,
                                        border: 8,
                                        paddingVerical: 0,
                                        icon:Icons.maps_ugc_rounded
                                    ),
),
                                  widget.hospital!.latitude !=null &&widget.hospital!.latitude!=0  && widget.hospital!.longitude!=null && widget.hospital!.longitude!=0?
                                  const SizedBox(height: 15):const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      widget.hospital!.latitude !=null &&widget.hospital!.latitude!=0  && widget.hospital!.longitude!=null && widget.hospital!.longitude!=0?
                                        Icon(Icons.map_outlined,color:color):SizedBox(),
                                      widget.hospital!.latitude !=null &&widget.hospital!.latitude!=0  && widget.hospital!.longitude!=null && widget.hospital!.longitude!=0?
                                      Text(isEnglish?'LOCATION IN MAP':"الـعنـوان علي الـخـريـطة",style: TextStyle( fontFamily: 'Anton',
                                            fontWeight:isEnglish?FontWeight.w300:FontWeight.w800,letterSpacing: 0,),):
                                          Container()




                                    ],
                                  ),

    SizedBox(height: 5,),
                                    ],
                                  ),

                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 17,),
                  ]),
                ),
              ),


            ),
          )
             ),
    );
  }

}

