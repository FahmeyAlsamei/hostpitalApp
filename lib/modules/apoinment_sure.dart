import 'package:flutter/material.dart';
import 'package:project/api/api_apointment.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/users/apointment.dart';
import 'package:project/modules/users/user_model.dart';

import '../bottom_bar_button/appointment.dart';
import '../config/data.dart';
import '../layout/display_hospital/display_one_hospital.dart';
import '../layout/home/home_screen.dart';
import '../shared/component/components.dart';
import 'login/login.dart';

class ApoinmentSure extends StatelessWidget {
  ApointmentsModel aboiment;

  ApoinmentSure(this.aboiment);

  bool isEnglish = Language.getData(key: "isDark") != null &&
      Language.getData(key: "isDark")!;
  bool isChecked = true;
  double height = 60;
  TextStyle? style = const TextStyle(
      fontWeight: FontWeight.w500, color: Color.fromRGBO(119, 205, 188, 1));

  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;

    return

      AppData.UserAccountData!=null&&
          AppData.UserAccountData!.id!=null&&
          AppData.UserAccountData!.id!=0?
        ////////////////////////Arabic
        Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Container(
              decoration: defualtBoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Card(
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color:color,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context)..pop();
                                            },
                                            icon: Icon(
                                              isEnglish
                                                  ? Icons
                                                      .arrow_forward_ios_outlined
                                                  : Icons
                                                      .arrow_back_ios_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            )),
                                        const SizedBox(
                                          width: 90,
                                        ),
                                        Text(
                                            isEnglish
                                                ? "Appointment "
                                                : "تأكـيد الـحـجـز ",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                              color: Colors.white,
                                            )),
                                      ],
                                    )),

                        )),

                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8 - 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: defualtBoxDecoration1(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10,),
                              padding: const EdgeInsets.only(top: 5,bottom:0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child: Icon(
                                          Icons.medical_services_outlined,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('المستشفى',style: style,),
                                    ),
                                  ]),
                                  Text(aboiment.hospital!.Name!,),
                                ],
                              )),


                          const SizedBox(height: 20,),
                          Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10,),
                              padding: const EdgeInsets.only(top: 1,bottom: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child: Icon(
                                          Icons.medical_services_outlined,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('القسم',style: style,),
                                    ),
                                  ]),
                                  Text(aboiment.category!.Name!,),
                                ],
                              )),
                          const SizedBox(height: 20,),
                          Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10,),
                              padding: const EdgeInsets.only(top: 2,bottom: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child:Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('اسـم العـميـل',style: style,),
                                    ),
                                  ]),
                                  Text(aboiment.Name!,),
                                ],
                              )),
                          const SizedBox(height: 20,),
                          Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10,),
                              padding: const EdgeInsets.only(top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height:height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child: Icon(
                                          Icons.phone,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('رقم التـلـيـفون',style: style,),
                                    ),
                                  ]),

                                  Text(aboiment.Phone_Number!),
                                ],
                              )),
                          SizedBox(height: 20,),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10,),

                              // padding: EdgeInsets.only(top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('تأريخ الحـجز ',style: style,),
                                    ),
                                  ]),
                                  Text(aboiment.apointment_date!),
                                ],
                              )),

                          SizedBox(height: 20,),
                          Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10,),
                              // height: height,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: height,
                              child: Column(
                                children: [

                                  Row(children: [
                                    const Expanded(
                                        child:  Icon(
                                          Icons.timer_sharp,
                                          color: Colors.black,
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Text('زمن الحـحز',style: style,),
                                    ),
                                  ]),
                                  Text(aboiment.apointment_time!),
                                ],
                              )),


                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8 - 30,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: height,
                        child: defualtElevatedButton(
                            title: 'تأكيد الحجز',
                            function: () async {
                              ApointmentsProvider _apointement =
                                  ApointmentsProvider();
                              // ApointmentsModel _apointments_model=new ApointmentsModel(
                              //    category:
                              // );
                              // _apointments_model
                              aboiment.created_by= AppData.UserAccountData;
                              print( AppData.UserAccountData!.id);

                              ApointmentsModel? _apointments =
                                  await _apointement
                                      .addNewApointments(aboiment);

                              // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                              if (_apointments != null &&
                                  _apointments!.id != null) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),

                                            side: const BorderSide(
                                                color: Colors.grey
                                            )

                                        ),
                                        backgroundColor:    const Color.fromRGBO(234, 235, 243,1),
                                        child: Container(

                                          height: MediaQuery.of(context).size.height/1.3,
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 20,),
                                                const Text("إنتظر تأكيد موعـد",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                                                const SizedBox(height: 10,),
                                                Text(aboiment.apointment_date!),
                                                const SizedBox(height: 20,),
                                                Text( aboiment.apointment_time!,),
                                                const SizedBox(height: 20,),
                                                // aboiment.hospital
                                                Text(aboiment.hospital!.Name!),
                                                const SizedBox(height: 20,),
                                                const Text('إذ تم تأكيد موعدك الرجاء الوصول الى المـستشـفى قبل'),
                                                const SizedBox(height: 10,),
                                                const Text(' د20  دقيقة من موعد الحـجز'),
                                                const SizedBox(height: 20,),
                                                SizedBox(
                                                    width: double.infinity,
                                                    child:  defualtElevatedButtonIcon(
                                                      title: 'موقع المـسشفى',
                                                      function: (){

                                                        Navigator.of(context).pushAndRemoveUntil(
                                                            MaterialPageRoute(builder: (context){
                                                              return            DisplayOneHospital(aboiment.hospital!);
                                                            })
                                                            , (route) => false);

                                                      },
                                                      icon: Icons.location_on_rounded,
                                                      border: 8,
                                                      paddingHorizatal: 10,
                                                      paddingVerical:20,
                                                      background:  color

                                                    )
                                                ),
                                                const SizedBox(height: 15,),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: defualtElevatedButtonIcon(
                                                      title: "شارك في الواتس اب",
                                                      function: (){},
                                                      icon: Icons.whatsapp,
                                                      border: 8,
                                                      paddingHorizatal: 47,
                                                      paddingVerical: 20,
                                                      background:color

                                                  ),
                                                ),
                                                const SizedBox(height: 15,),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: defualtOutLinedButton(title: "الرئيـسية",
                                                    paddingHorizatal:10,
                                                    paddingVerical: 20,
                                                    border: 8,
                                                    isEnglish:isEnglish ,
                                                    function: (){
                                                      Navigator.of(context).pushAndRemoveUntil(
                                                          MaterialPageRoute(builder: (context){
                                                            return  MyHomePage();
                                                          })
                                                          , (route) => false);

                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 15,),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: defualtOutLinedButton(title: "موعدك  ",
                                                    paddingHorizatal:5,
                                                    paddingVerical: 20,
                                                    border: 8,
                                                    isEnglish:isEnglish ,
                                                    function: (){
                                                      Navigator.of(context).pushAndRemoveUntil(
                                                          MaterialPageRoute(builder: (context){
                                                            return  MyAppointment();
                                                          })
                                                          , (route) => false);

                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 15,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.grey)),
                                        backgroundColor: const Color.fromRGBO(
                                            234, 235, 243, 1),
                                        child: Container(
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height /
                                          //     1.4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: const [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "فشل الحفظ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            paddingHorizatal: 15,
                            border: 8)),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ))),
    )
    :const LogIn();
  }
}
