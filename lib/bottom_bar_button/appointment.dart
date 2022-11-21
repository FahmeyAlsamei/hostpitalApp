import 'package:flutter/material.dart';

import '../api/api_apointment.dart';
import '../api/api_rating_hospital.dart';
import '../config/data.dart';
import '../layout/display_hospital/Rat_widget.dart';
import '../layout/display_hospital/animtion.dart';
import '../models/language.dart';
import '../modules/users/rating_hospital_model.dart';
import '../shared/component/components.dart';

class MyAppointment extends StatefulWidget {
  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  TextStyle style1=TextStyle(color: Colors.black,fontWeight: FontWeight.w500);
  final ApointmentsProvider _apointmentsProvider = new ApointmentsProvider();
  bool isReadmore=false;
  int numWord=3;
  bool isEngilsh=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!;
  int noRiting = 0;
  bool isPressRatingUpdate = false;
  bool isPressFinish = false;
  RatingHospitalModel? ratingHospitalModel;
  String name='';
  int userId=0;
  int hospitalId=0;
  Widget _ButtonAddRiiting(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      height:
      isPressFinish ? isPressRatingUpdate ? 200 : 150:0,
      decoration: BoxDecoration(
        // color: AppLightColor.white,
        boxShadow: [
          BoxShadow(
              color: Theme
                  .of(context)
                  .primaryColorLight,
              blurRadius: 15),
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
          shadowColor: const Color(0xFFD2D2D2),
          child: Column(
            children: [
              const Text(
                    "تقييم",),
              Text(name
              ),
              Center(
                child: AddRateWidget(
                    dataNoRiting: noRiting.toDouble(),
                    onRatingUpdate: (value) {
                      setState(() {
                        noRiting = value.toInt();

                        isPressRatingUpdate = true;
                      });
                    },
                    isRiting:  false),
              ),
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

                            //    widget.hospital.isBasket=!widget.hospital.isBasket;
                          });
                          // await _onPressedAddNewRating(noRiting.toDouble());

                          RatingHospitalProvider _dgd=RatingHospitalProvider();
                          ratingHospitalModel?.no_rating=noRiting;

                          RatingHospitalModel? ddd=        await    _dgd.addNewRatingHospitalModel(ratingHospitalModel!);

    setState(() {
                            if (ddd != null) {
                              ratingHospitalModel=null;
                              isPressFinish=false;
                            }
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
  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;
    TextStyle style=TextStyle(color:color,fontWeight:FontWeight.w800,fontSize: 16  );
    TextStyle style2=TextStyle(color: color,fontWeight: FontWeight.w500);

    return Directionality(
      textDirection: isEngilsh?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
          bottomNavigationBar:_ButtonAddRiiting(context),

          appBar: AppBar(
            title: Text(isEngilsh?'Appointment':"المواعيد"),
          ),
          body:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: ListView(
              children: [
                FutureBuilder(
                    future: _apointmentsProvider.fetchAllApointments(),
                    builder: (_, snapshot) {
                      // Displaying LoadingSpinner to indicate waiting state
                      // print(snapshot.data);
                      // if(snapshot.hasData)
                      // AppData.MyHospital=snapshot.data as  List<Hospital>;
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return  Center(
                          child: CircularProgressIndicator(
                            color: color,
                          ),
                        );
                      }
                      // if (snapshot.stackTrace != null) {
                      //   return  Center(
                      //     child: Text(snapshot.stackTrace.toString()),
                      //   );
                      // }
                      else {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: AppData.ListApointments.length,
                          itemBuilder: (context, index) {
                            int? Day=int.tryParse(
                                AppData.ListApointments[index].apointment_date!.split('-').last
                            );
                            int? year=int.tryParse(AppData.ListApointments[index].apointment_date!.split('-').first);
                            int? month=int.tryParse(AppData.ListApointments[index].apointment_date!.split('-')[1]);
                            int? hour=int.tryParse(
                                AppData.ListApointments[index].apointment_time!.split(':').first
                            );
                            int? minut=int.tryParse(AppData.ListApointments[index].apointment_time!.split(':')[1]);
                            int? scond=int.tryParse(AppData.ListApointments[index].apointment_time!.split(':').last);
                            return
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                // padding:EdgeInsets.symmetric(vertical: 15,horizontal:0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppData.ListApointments[index].category!=null&&  AppData.ListApointments[index].category!.hospital!=null&& AppData.ListApointments[index].category!.hospital!.Name!=null
                                            && AppData.ListApointments[index].category!.Name!=null&&  AppData.ListApointments[index].apointment_time!=null
                                            && AppData.ListApointments[index].apointment_time!=null?
                                        Container(
                                          width: MediaQuery.of(context).size.width-(
                                              MediaQuery.of(context).size.width/3
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,


                                            children: [
                                              Container(
                                                // width: MediaQuery.of(context).size.width-(
                                                //     MediaQuery.of(context).size.width/3-20
                                                // ),
                                                child: Row(
                                                  children: [

                                                    Icon(Icons.maps_home_work_outlined,size: 20,color: color,),
                                                    Container(
                                                        width: MediaQuery.of(context).size.width-(
                                                            MediaQuery.of(context).size.width/3
                                                        )-20,
                                                      child: Text("${
                                                          AppData.ListApointments[index].category!.hospital!.Name

                                                      }",
                                                        maxLines: 1,
                                                        overflow:  TextOverflow.ellipsis,
                                                        softWrap: true,

                                                        style: TextStyle(
                                                        fontSize: 14
                                                        ,color: Colors.black,fontWeight: FontWeight.w600,

                                                      ),

                                                      ),
                                                    ),

                                                    // SizedBox(width: 10,),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [

                                                  Icon(Icons.account_tree_outlined,size: 20,color: color,),
                                                  SizedBox(width: 10,),
                                                  Text("${

                                                      AppData.ListApointments[index].category!.Name
                                                  }",style: TextStyle(
                                                      fontSize: 16
                                                      ,color: Colors.black,fontWeight: FontWeight.w500
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [

                                                  Icon(Icons.date_range_outlined,size: 20,color: color,),
                                                  // SizedBox(width: 10,),
                                                  Text("${
                                                      AppData.ListApointments[index].apointment_date
                                                  }",style: const TextStyle(
                                                      fontSize: 16
                                                      ,color: Colors.black,fontWeight: FontWeight.w500
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [

                                                  Icon(Icons.access_time_outlined,size: 20,color: color,),
                                                  SizedBox(width: 10,),
                                                  Text("${
                                                      AppData.ListApointments[index].apointment_time
                                                  }",style: TextStyle(
                                                      fontSize: 16
                                                      ,color: Colors.black,fontWeight: FontWeight.w500
                                                  ),),
                                                ],
                                              )

                                            ],),
                                        ):SizedBox(),


                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width/3
                                          ,
                                          child: Column(
                                            children: [

                                              Day!
                                                  >=DateTime.now().day&&
                                                  year!
                                                      >=DateTime.now().year&&
                                                  month!
                                                      >=DateTime.now().month&&
                                                  // AppData.ListApointments[index].isCancel!=null&&
                                                  (AppData.ListApointments[index]!.isCancel==false ||
                                                      AppData.ListApointments[index]!.isCancel== null
                                                  )&&
                                                  AppData.ListApointments[index].isConform==null
                                              //
                                              // hour!
                                              //     <=DateTime.now().hour
                                              // minut!
                                              //     >=DateTime.now().minute&&
                                              // scond!
                                              //     =DateTime.now().second
                                                  ?
                                              Container(




                                                child:

                                                defualtElevatedButton(title: "CANCEL", function: (){
                                                  setState(() {
                                                    AppData.ListApointments[index].isCancel=true;

                                                  });
                                                  _apointmentsProvider.addIsEventApointments(AppData.ListApointments[index],
                                                      AppData.ListApointments[index].toJsonIsCansel()
                                                  );
                                                },paddingHorizatal: 19,
                                                    paddingVerical: 40,
                                                    border: 8,
                                                    color: Colors.red.withOpacity(0.7)

                                                ) ,
                                              ):  Container(




                                                child:
                                                AppData.ListApointments[index].isCancel!=null&&
                                                    AppData.ListApointments[index]!.isCancel==true?
                                                Text(
                                                  "IS Canceled",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                    letterSpacing:isEngilsh?2:0,),
                                                ):
                                                AppData.ListApointments[index].isConform!=null&&
                                                    AppData.ListApointments[index]!.isConform==true?
                                                Text(
                                                  "تم الموافقة",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                    letterSpacing:isEngilsh?2:0,
                                                  ),
                                                ):
                                                AppData.ListApointments[index].isConform!=null&&
                                                    AppData.ListApointments[index]!.isConform==false?
                                                Text(
                                                  "تم رفض الطلب",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.red,
                                                      letterSpacing:isEngilsh? 2:0),
                                                ):Container(
                                                  child: Column(
                                                    children: [

                                                      SizedBox(height: 20,),
                                                      defualtElevatedButton(title:"قـيـم", function: userId==AppData.UserAccountData!.id&&hospitalId==AppData.ListApointments[index].category!.hospital!.id!?null: (){


                                                        // function:AppData.ListApointments[index].hospital!.is_riting![index].isriting!=null&&
                                                        //     AppData.ListApointments[index].hospital!=null&&
                                                        //     AppData.ListApointments[index].hospital!.is_riting!=null&&
                                                        //     AppData.ListApointments[index].hospital!.is_riting![index].isriting! ?null

                                                        AppData.ListApointments[index].isFinish=true;
                                                        _apointmentsProvider.addIsEventApointments(AppData.ListApointments[index],
                                                            AppData.ListApointments[index].toJsonIsFinish()


                                                        );
                                                        setState(() {
                                                          AppData.ListApointments[index].isFinish=true;
                                                          ratingHospitalModel=RatingHospitalModel(
                                                            hospital: AppData.ListApointments[index].category!.hospital!.id,
                                                            users: AppData.UserAccountData!.id,
                                                            // no_rating:


                                                          );


                                                          isPressFinish=true;
                                                          name=AppData.ListApointments[index].category!.hospital!.Name!;

                                                          // }
                                                          userId=ratingHospitalModel!.users!;
                                                          hospitalId=ratingHospitalModel!.hospital!;


                                                        });

                                                        AppData.ListApointments=[];
                                                      },

                                                        paddingHorizatal: 29,
                                                        paddingVerical: 20,
                                                        border: 8,
                                                        color:Colors.amber,



                                                      ) ,
                                                      SizedBox(height: 20,),

                                                      Container(
                                                        height: 60,
                                                        width: 86,
                                                        decoration: BoxDecoration(
                                                            color:  Colors.grey,
                                                            borderRadius: BorderRadius.circular(10)

                                                        ),
                                                        child: Center(child: Text("Finished",style: TextStyle(color: Colors.white,
                                                            fontWeight: FontWeight.w600
                                                        ),)),
                                                      ),

                                                    ],
                                                  ),
                                                )
                                              )

                                            ],
                                          ),
                                        )

                                      ],
                                    ),

                                    SizedBox(height: 20,),
                                    Container(
                                      width: double.infinity,
                                      color: Color.fromRGBO(234, 235, 243, 1) ,
                                      height: 12,
                                    ),
                                  ],

                                ),

                              );
                          },
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        );
                      }
                    }),


                AppData.ListHospitalApointments.isNotEmpty?
                const Text("طلبات المستشفيات",style: TextStyle(
                    fontSize: 16
                    ,color: Colors.black,fontWeight: FontWeight.w800
                ),


                ):const Divider(
                    height: 20,
                    color: Colors.black
                ),
                FutureBuilder(
                    future: _apointmentsProvider.fetchAllApointmentsInHospital(),
                    builder: (_, snapshot) {
                      // Displaying LoadingSpinner to indicate waiting state
                      // print(snapshot.data);
                      // if(snapshot.hasData)
                      // AppData.MyHospital=snapshot.data as  List<Hospital>;
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return  Center(
                          child: CircularProgressIndicator(
                            color: color,
                          ),
                        );
                      }
                      // if (snapshot.stackTrace != null) {
                      //   return  Center(
                      //     child: Text(snapshot.stackTrace.toString()),
                      //   );
                      // }
                      else {
                        return ListView.builder(
                          shrinkWrap: true,

                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppData.ListHospitalApointments.length,
                          itemBuilder: (context, index) {
                            int? Day=int.tryParse(
                                AppData.ListHospitalApointments[index].apointment_date!.split('-').last
                            );
                            int? year=int.tryParse(AppData.ListHospitalApointments[index].apointment_date!.split('-').first);
                            int? month=int.tryParse(AppData.ListHospitalApointments[index].apointment_date!.split('-')[1]);
                            int? hour=int.tryParse(
                                AppData.ListHospitalApointments[index].apointment_time!.split(':').first
                            );
                            int? minut=int.tryParse(AppData.ListHospitalApointments[index].apointment_time!.split(':')[1]);
                            int? scond=int.tryParse(AppData.ListHospitalApointments[index].apointment_time!.split(':').last);
                            return
                              Expanded(
                                // padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  // padding:EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Container(
                                            width: MediaQuery.of(context).size.width-(
                                                MediaQuery.of(context).size.width/3
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 7,top: 7),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,


                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [

                                                        Icon(Icons.maps_home_work_outlined,size: 20,color: color,),
                                                        // const SizedBox(width: 10,),
                                                        Container(
                                                          width: MediaQuery.of(context).size.width-(
                                                              MediaQuery.of(context).size.width/3
                                                          )-20,
                                                          child: Text("${
                                                              AppData.ListHospitalApointments[index].Name
                                                          }",

                                                            maxLines: 1,
                                                            overflow:  TextOverflow.ellipsis,
                                                            softWrap: true,

                                                            style: const TextStyle(
                                                              fontSize: 16
                                                              ,color: Colors.black,fontWeight: FontWeight.w800
                                                          ),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              //     const SizedBox(height: 5,),
                                              // Row(
                                              //       children: [
                                              //
                                              //         Icon(Icons.phone,size: 20,color: color,),
                                              //         const  SizedBox(width: 10,),
                                              //         Text("${
                                              //             AppData.ListHospitalApointments[index].Phone_Number
                                              //         }",style: const TextStyle(
                                              //             fontSize: 16
                                              //             ,color: Colors.black,fontWeight: FontWeight.w500
                                              //         ),),
                                              //       ],
                                              //     ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    children: [

                                                      Icon(Icons.account_tree_outlined,size: 20,color: color,),
                                                      const  SizedBox(width: 10,),
                                                      Text("${
                                                          AppData.ListHospitalApointments[index].category!.Name
                                                      }",style: const TextStyle(
                                                          fontSize: 16
                                                          ,color: Colors.black,fontWeight: FontWeight.w500
                                                      ),),
                                                    ],
                                                  ),
                                                  const  SizedBox(height: 5,),
                                                  Row(
                                                    children: [

                                                      Icon(Icons.date_range_outlined,size: 20,color: color,),
                                                      const  SizedBox(width: 10,),
                                                      Text("${
                                                          AppData.ListHospitalApointments[index].apointment_date
                                                      }",style: const TextStyle(
                                                          fontSize: 16
                                                          ,color: Colors.black,fontWeight: FontWeight.w500
                                                      ),),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    children: [

                                                      Icon(Icons.access_time_outlined,size: 20,color: color,),
                                                      const SizedBox(width: 10,),
                                                      Text("${
                                                          AppData.ListHospitalApointments[index].apointment_time
                                                      }",style:const TextStyle(
                                                          fontSize: 16
                                                          ,color: Colors.black,fontWeight: FontWeight.w500
                                                      ),),
                                                    ],
                                                  ),


                                                ],),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width/3,
                                            child: Column(
                                              children: [

                                                Day!
                                                    >=DateTime.now().day&&
                                                    year!
                                                        >=DateTime.now().year&&
                                                    month!
                                                        >=DateTime.now().month&&
                                                    (AppData.ListHospitalApointments[index]!.isConform==false ||
                                                        AppData.ListHospitalApointments[index]!.isConform== null||
                                                        AppData.ListHospitalApointments[index]!.isConform== true

                                                    )&&
                                                    // AppData.ListHospitalApointments[index].isCancel==null&&
                                                    (AppData.ListHospitalApointments[index]!.isCancel==false ||
                                                        AppData.ListHospitalApointments[index]!.isCancel== null
                                                    )
                                                //
                                                // hour!
                                                //     <=DateTime.now().hour
                                                // minut!
                                                //     >=DateTime.now().minute&&
                                                // scond!
                                                //     =DateTime.now().second
                                                    ?
                                                Container(




                                                  child:
                                                  AppData.ListHospitalApointments[index]!.isConform== null?
                                                  Column(
                                                    children: [
                                                      defualtElevatedButton(title: " CONFIRM ", function: (){
                                                        setState(() {
                                                          AppData.ListHospitalApointments[index].isConform=true;

                                                        });
                                                        _apointmentsProvider.addIsEventApointments(AppData.ListHospitalApointments[index],
                                                            AppData.ListHospitalApointments[index].toJsonIsConfirm()

                                                        );
                                                      },paddingHorizatal: 19/2,
                                                        paddingVerical: 40/2,
                                                        border: 8,


                                                      ) ,

                                                      const SizedBox(height: 5,),
                                                      defualtElevatedButton(title: "    DENY    ", function: (){
                                                        setState(() {
                                                          AppData.ListHospitalApointments[index].isConform=false;

                                                        });
                                                        _apointmentsProvider.addIsEventApointments(AppData.ListHospitalApointments[index],
                                                            AppData.ListHospitalApointments[index].toJsonIsConfirm()

                                                        );
                                                      },paddingHorizatal: 19/2,
                                                          paddingVerical: 40/2,
                                                          border: 8,
                                                          color: Colors.red.withOpacity(0.7)
                                                      ) ,


                                                    ],
                                                  ):Container(),
                                                ):  Container(




                                                  child:
                                                  AppData.ListHospitalApointments[index].isCancel!=null&&
                                                      AppData.ListHospitalApointments[index]!.isCancel==true?
                                                  const Text(
                                                    "IS Canseld",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.red,
                                                        letterSpacing: 2),
                                                  ):
                                                  AppData.ListHospitalApointments[index].isConform!=null&&
                                                      AppData.ListHospitalApointments[index]!.isConform==true?
                                                  Text(
                                                    "تم الموافقة",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.red,
                                                        letterSpacing:isEngilsh? 2:0),
                                                  ):
                                                  AppData.ListHospitalApointments[index].isConform!=null&&
                                                      AppData.ListHospitalApointments[index]!.isConform==false?
                                                  Text(
                                                    "تم رفض الطلب",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.red,
                                                        letterSpacing:isEngilsh? 2:0),
                                                  ):
                                                  defualtElevatedButton(title: "FINISH", function: (){

                                                  },paddingHorizatal: 19,
                                                    paddingVerical: 40,
                                                    border: 8,


                                                  ) ,
                                                )

                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: Color.fromRGBO(234, 235, 243, 1) ,
                                        height: 12,
                                      ),
                                    ],
                                  ),

                                ),
                              );
                          },
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        );
                      }
                    })
              ],
            ),
          )
      ),
    );
  }
}