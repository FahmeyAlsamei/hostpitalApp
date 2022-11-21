
// ignore_for_file: non_constant_identifier_names, must_be_immutable

//import 'dart:html';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:location/location.dart';
import 'package:project/config/data.dart';
import 'package:project/layout/display_hospital/Rat_widget.dart';
import 'package:project/layout/display_hospital/review_and_rating.dart';
import 'package:project/layout/map/map.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/add_product_information/hospital_information.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/shared/component/components.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api_hospital.dart';
import '../../shared/network/local/data_time.dart';
import '../add_product_information/add_doctors_departments/add_department_screen.dart';



class DisplayOnePharmacy extends StatefulWidget {
  bool is_clinic;
  bool is_laboratory;
  bool is_radiation;
  bool is_volunteer;
  bool is_needer_blood;
  Hospital hospital;
  DisplayOnePharmacy(this.hospital,{Key? key,



    this.is_clinic=false,
    this.is_laboratory=false,
    this.is_radiation=false,
    this.is_volunteer=false,
    this.is_needer_blood=false

  }) : super(key: key);
  @override
  State<DisplayOnePharmacy> createState() => _DisplayOnePharmacyState();
}

class _DisplayOnePharmacyState extends State<DisplayOnePharmacy> {
  bool isSmall = true;
  bool isSmallActiveTime = false;
  bool isReadmore= false;
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool isPressRatingUpdate = false;

  bool isShowMap=false;


  initState(){
    super.initState();
    int noRiting = 0;
    Widget _ButtonAddRiiting(BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.center,
        height:
        isPressRatingUpdate ? 200 : 150,
        decoration: BoxDecoration(
          // color: AppLightColor.white,
          boxShadow: [
            BoxShadow(
              color: Theme
                  .of(context)
                  .primaryColor,
              blurRadius: 15,

            ),
          ],
          borderRadius: BorderRadius.all(
              Radius.circular(25)),
        ),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            color: Colors.white,
            shadowColor:  Theme
                .of(context)
                .primaryColor,
            child: Column(
              children: [
                SizedBox(height: 10,),
                const Text(
                  "قيم هذا النشاط التجاري",),
                SizedBox(height: 5,),
                Center(
                  child: AddRateWidget(
                      dataNoRiting: noRiting.toDouble(),
                      onRatingUpdate: (value) {
                        setState(() {
                          noRiting = value.toInt();
                          widget.hospital.is_riting!.first.no_rating =
                              value.round();
                          isPressRatingUpdate = true;
                        });
                      },
                      isRiting: widget.hospital.is_riting != null &&
                          widget.hospital.is_riting!.length > 0 &&
                          widget.hospital.is_riting!.first.isriting !=
                              null &&
                          widget.hospital.is_riting!.first.isriting!
                          ? widget.hospital.is_riting!.first.isriting
                          : false),
                ),
                isPressRatingUpdate?SizedBox(height: 10,):SizedBox(),
                isPressRatingUpdate
                    ? Container(
                  child: Wrap(
                    children: [
                      defualtElevatedButton(title:isEnglish?'نشر التقييم':
                      "نشر التقييم",
                        function: () async {
                          // Navigator.of(context,rootNavigator: true,).pop(true);

                          if (noRiting.toDouble() > 0) {
                            setState(() {
                              noRiting = noRiting.toInt();
                              isPressRatingUpdate = false;

                              // widget.hospital.ratingdata.first.
                              widget.hospital
                                  .is_riting!.first.isriting = true;
                              widget.hospital.is_riting!.first
                                  .no_rating = noRiting.round();
                              //    widget.hospital.isBasket=!widget.hospital.isBasket;
                            });
                            // await _onPressedAddNewRating(noRiting.toDouble());

                            if (mounted)
                              setState(() {
                                noRiting = noRiting.toInt();
                                // widget.hospitalDetialData
                                // widget.hospitalList=widget.hospital;
                                widget.hospital =
                                    widget.hospital;
                                isPressRatingUpdate = isPressRatingUpdate;
                                // widget.hospital=widget.hospital.;
                                // widget.hospital.ratingdata.add(Ratingdatum(
                                //
                                // ))
                              });

                            if (mounted)
                              setState(() {
                                widget.hospital =
                                    widget.hospital;

                                // widget.hospital=widget.hospital.;
                                // widget.hospital.ratingdata.add(Ratingdatum(
                                //
                                // ))
                              });

                            if (mounted)
                              setState(() {
                                widget.hospital
                                    .is_riting!.first.isriting = true;
                                widget.hospital.is_riting!.first
                                    .no_rating = noRiting.round();
                                //    widget.hospital.isBasket=!widget.hospital.isBasket;
                              });
                            //_showSortOptions(context);
                          }
//
                          // widget.onPressedAddNewRating(
                          // widget.dataNoRiting.toDouble());

                          else {

                          }
                        },
                        // title: "نشر التقييم",
                        // backgroundColor: Theme
                        //     .of(context)
                        //     .primaryColor,
                        // textColor: Theme
                        //     .of(context)
                        //     .backgroundColor,
                        // width: MediaQuery.of(context).size.width,
                        // icon: Icons.done, function: () {  },
                      ),

                      // OpenFlutterButton(onPressed: (){
                      //   // Navigator.of(context,rootNavigator: true,).pop(false);
                      //
                      // },title: "اللغاء",)

                      //   ,
                    ],
                  ),
                )
                    : Container(),
              ],
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height / 4.round();
    double mapHeight = MediaQuery.of(context).size.height / 4.round();
    Color color=Theme.of(context).primaryColor;

    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
          body: Container(
            decoration: defualtBoxDecoration(),
            child:  ListView(padding: const EdgeInsets.symmetric(horizontal: 15), children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  elevation: 1,

                  child: Container(
                      height: 45,

                      decoration: BoxDecoration(
                          color:color,
                          borderRadius: BorderRadius.circular(5)
                      ),
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
                            width: 75,
                          ),
                          Text(widget.hospital.Name!,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white,)),
                        ],
                      )),

                ),
              ),
              const SizedBox(
                height: 1,
              ),


              SizedBox(
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
                          //TODO: back image code start here
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              widget.hospital.images_back!=null&&
                                  widget.hospital.images_back!.isNotEmpty?

                              NetworkImage(widget.hospital.images_back!)  as ImageProvider:
                              const AssetImage('images/fahmey.jpg'))),
                    ),
                    // TODO:front image code start here
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 3),
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
                                      image:  widget.hospital.images_main!=null&&
                                          widget.hospital.images_main!.isNotEmpty?

                                      NetworkImage(widget.hospital.images_main!)  as ImageProvider:const AssetImage('images/hospital1.jpg'))),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 5, color: Colors.white),
                                    color:Theme.of(context).primaryColor
                                  ),
                                  child: const Icon(
                                    Icons.monitor_heart_sharp,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        )),
                    // TODO:add button code start here
                    Visibility(
                      visible: AppData.UserAccountData!=null &&
                          AppData.UserAccountData!.id!=null &&
                          AppData.UserAccountData!.id!=0 &&
                          AppData.UserAccountData!.id==widget.hospital!.created_by!.id!,
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
                                          return AddDepartment(isFromPharmacy: true,
                                          hospital: widget.hospital,

                                          );
                                        })
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      const Icon(
                                        Icons.person_add_alt,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        isEnglish?"ADD":"إضــافـة",
                                        style:
                                        const TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                    ),
                    // TODO:edite button code start here
                    Visibility(
                      visible: AppData.UserAccountData!=null &&
                          AppData.UserAccountData!.id!=null &&
                          AppData.UserAccountData!.id!=0 &&
                          AppData.UserAccountData!.id==widget.hospital!.created_by!.id,
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
                                    color:color),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context){
                                          return  HospitalInfo(isPharmacy: true,);
                                        })
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children:  [
                                      const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        isEnglish?"Edit":"تـعـديـل",
                                        style:
                                        const TextStyle(color: Colors.white, fontSize: 16),
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
                  widget.hospital.Name!,

                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  "Specialized",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:const Color.fromRGBO(235, 236, 243, 1),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),

                ),

                child: Column(
                  children: [
                    if (widget.is_laboratory||widget.is_radiation) Card(
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
                                      child:Text(
                                        isEnglish?'MORE ABOUT US':"الكـثـيـر عـنـا",
                                        style:  TextStyle(
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
                    ) else const SizedBox(),



                    SizedBox(
                      height: (widget.is_laboratory||widget.is_radiation)? 10:0,
                    ),

                    ///// Work time
                    //TODO: work time code start here
                    if (widget.is_volunteer) const SizedBox() else InkWell(
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
                                    flex: 4,
                                    child: Text(
                                      isEnglish?'WORK TIME':"أوقــات الــدوام",
                                      style:  TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Anton',
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: isEnglish? 2:0),
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

                              widget.hospital.Activ_Time!.Table_Activ_Time!=null?
                              Table(
                                  columnWidths: const {2:FractionColumnWidth(0.13)},

                                  children: [


                                    widget.hospital.Activ_Time!.Sat_Activ_From!=null&&
                                        widget.hospital.Activ_Time!.Sat_Activ_From!.isNotEmpty&&
                                        widget.hospital.Activ_Time!.Sat_Activ_To!=null&&
                                        widget.hospital.Activ_Time!.Sat_Activ_To!.isNotEmpty



                                        ? TableRow(children: [
                                      defualtContianerForTableRow(
                                          isEnglish?"Saturday":"الـسـبـت"),
                                      defualtContianerForTableRow2(
                                          widget.hospital.Activ_Time!
                                              .Sat_Activ_From!),
                                      defualtContianerForTableRow(
                                          isEnglish?"to ":"الـي"),
                                      defualtContianerForTableRow2(
                                          widget.hospital.Activ_Time!
                                              .Sat_Activ_To!),
                                    ])
                                        : TableRow(children: [
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
                                              widget.hospital.Activ_Time!.Sat_Activ_From_Scond !=null? widget.hospital.Activ_Time!.Sat_Activ_From_Scond!:""
                                          ),
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
                                              widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null? widget.hospital.Activ_Time!.Sat_Activ_To_Scond!:""
                                          ),
                                          visible: widget.hospital.Activ_Time!.Sat_Activ_From_Scond!=null&&
                                              widget.hospital.Activ_Time!.Sat_Activ_From_Scond!.isNotEmpty&&
                                              widget.hospital.Activ_Time!.Sat_Activ_To_Scond!=null&&
                                              widget.hospital.Activ_Time!.Sat_Activ_To_Scond!.isNotEmpty?true:false
                                      )
                                    ]),

                                  ]


                              ):Text( widget.hospital.Activ_Time!.Table_Activ_Time!.Tables_Type_Activ_From!),

                              displayDataWorkTime(isSmallActiveTime:isSmallActiveTime, hospital: widget.hospital)
                            ],
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(height: widget.is_volunteer?7:0,),
              Container(
                padding: const EdgeInsets.all(3),
                decoration:defualtBoxDecoration1(),
                child: defualtElevatedButtonIcon(
                    title: isEnglish?"DOCTOR":"الـدكـتـور",
                    function: (){

                      showDialog(context: context,
                          builder: (context){

                            return AlertDialog(
                              title:  Center(child: Text(isEnglish?"DOCTOR":"الـدكـتـور",style: const TextStyle(fontSize:16,fontWeight: FontWeight.w500 ),)),
                              content: Container(
                                height: MediaQuery.of(context).size.height/6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle
                                ),
                                child: Column(
                                  children: [
                                    const Text("Khaled Haizbr",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                                    const SizedBox(height: 20,),
                                    SizedBox(
                                        width: double.infinity,

                                        child: defualtElevatedButtonIcon(
                                            title: isEnglish?"MESSAGE WHAT'UP ":"مـراسـلـة علي الـوتـسـاب",
                                            function: () {
                                              openWhatsapp(context: context, text: "Hi", number: "730003501");



                                            },
                                            icon: Icons.whatsapp,
                                            border: 8,
                                            paddingHorizatal: 0,
                                            paddingVerical: 13,
                                            background: color
                                        )
                                    )
                                  ],
                                ),
                              ),
                            );
                          }


                      );


                    },
                    icon: Icons.person,
                    border: 8,
                    paddingHorizatal: 10,
                    paddingVerical: 15,
                    background: color

                ),
              ),

              const SizedBox(
                height: 13,
              ),

              Container(
                padding: const EdgeInsets.all(3),
                decoration:defualtBoxDecoration1(),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: defualtElevatedButtonIcon(
                          title:  isEnglish?'WHATS UP MESSAGE':"رســالـه علي الـوتـسـاب",
                          function: (){
                                     openWhatsapp(context: context, text:isEnglish?"I come from For_You application for ...":"اتـتيت لك من تطبيق لأجلك لغرض ", number:widget.hospital!.Phone_Number!);
                          },
                          icon:Icons.whatsapp_outlined,
                          paddingHorizatal:0,
                          paddingVerical: 18,
                          border: 8

                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),

                    Expanded(
                      child: defualtElevatedButtonIcon(
                          title:  isEnglish?'CALL':"إتـصـال",
                          function: ()async{
                                    var url=Uri.parse("tel:${widget.hospital.Phone_Number}");
                                    if(await canLaunchUrl(url)){
                                    await launchUrl(url);
                                    }else{
                                    throw "could not lunch $url";
                                    }

                          },
                          icon:Icons.phone,
                          paddingHorizatal: 14,
                          paddingVerical: 18,
                          border: 8

                      ),
                    ),

                  ],
                ),
              ),



              const SizedBox(
                height: 13,
              ),

              Container(
                  decoration: defualtBoxDecoration1(),
                  padding: const EdgeInsets.all(1),
                  child:Column(
                    children: [
                      Card(
                          elevation: 2,
                          child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: defualtBoxDecoration1(),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:5,),
                                     Text(
                                      isEnglish?'LOCATION':"الـعـنـوان",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Anton',
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 2),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: Theme.of(context).primaryColor,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text("University Street")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ]))),
                      const SizedBox(
                        height: 7,
                      ),
                      widget.hospital
                          .ratingdata!=null&& widget.hospital
                          .ratingdata!.isNotEmpty?
                      Card(
                        child: Column(
                          children: [
                            Text(
                              " التقييم والتفاعل",),

                            ReviewRatingDetialComercialCard(
                              dataRating: widget.hospital
                                  .ratingdata!.first
                              ,),

                          ],
                        ),
                      ):Container(),




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
                  )
              ),
              const SizedBox(height: 10,),

            ]),
          )
      ),
    );
  }

}

