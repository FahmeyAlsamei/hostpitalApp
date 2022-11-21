// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/add_job/add_job.dart';
import 'package:project/modules/drawer_menu/LogOut.dart';
import 'package:project/shared/component/components.dart';

import '../../../models/product_type.dart';
import '../../add_product_information/add_doctors_departments/add_department_screen.dart';
import '../../add_product_information/add_doctors_departments/add_doctor_screen.dart';
import '../../add_product_information/hospital_information.dart';
import '../../boold/blood.dart';
import '../../users/activ_time.dart';
import '../../users/hospital_model.dart';

class AddProducts extends StatelessWidget {
  static const routeName = '/AddProducts';
  bool isFromHospital;
  ActivTime ? worktime;
  Hospital ? hospital;
  // add_doctor({});
  AddProducts({ this.isFromHospital=false,this.worktime,this.hospital});

 var distanceBetween=const SizedBox(height: 20,);
 bool isEngish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: isEngish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: Color.fromRGBO(244,245, 250, 1),
        appBar: AppBar(
          elevation: 5,
         //Color.fromRGBO(158, 225, 218, 0.8),
          //Theme.of(context).primaryColor,

          title:  Text(isEngish?"Add Service":" إضـافة خـدمـة ",textAlign: TextAlign.center,),
        ),
        body: Container(

          decoration: defualtBoxDecoration(),
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 15, right: 15,),
          child: SingleChildScrollView(
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),

                  CardList(
                    title: isFromHospital?isEngish?"ADD DOCTORS ":"إضـافة دكـتـور":isEngish?'Add Hospital':"إضـافة مـسـتـشـفي",
                    icon: isFromHospital?Icons.person_add_alt_1_outlined:Icons.maps_home_work_outlined,
                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return isFromHospital? add_doctor(
                                worktime:worktime,hospital: hospital


                              ,):HospitalInfo(isClinic: false,isPharmacy: false);
                          })
                      );


                    },
                  ),
                    isFromHospital?
                  CardList(
                    title:isEngish?'ADD DEPARTMENT':"إضـافة قـسـم",
                    icon: Icons.house_outlined,
                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  AddDepartment(

                              hospital: hospital,

                            );
                          })
                      );


                    },
                  ):distanceBetween,
                  isFromHospital?distanceBetween:SizedBox(),

                  CardList(
                    title:isEngish?'ADD CLINIC':"إضـافة عـيـادة",
                    icon: Icons.house_outlined,
                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  HospitalInfo(isClinic: true,isPharmacy: false,);
                          })
                      );


                    },
                  ),
                  distanceBetween,

                  CardList(
                    title: isEngish?'Add Pharmacy':"اضافة صيدلية",
                    icon: Icons.local_pharmacy_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return   HospitalInfo(isClinic: false,isPharmacy: true,);
                          })
                      );


                    },
                  ),
                  distanceBetween,
                  CardList(
                    title :(Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?"Add Laboratory":"اضافة مـخـتبر"),
                    icon: Icons.filter_vintage_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  HospitalInfo(isLabortory: true,);
                          })
                      );


                    },
                  ),
                  distanceBetween,
                  CardList(
                    title: isEngish?'Add Radiation':" إضـافة أشــعــة",
                    icon: Icons.data_array_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  HospitalInfo(isRediation: true,);
                          })
                      );


                    },
                  ),
                  distanceBetween,
                  CardList(
                    title: isFromHospital?isEngish?'Add Medical Job Advertising ':" إضـافة إعـلان وطـيـفـة طـبيـة":isEngish?'Offer For Medical Job':" تقديـم علي وطـيـفـة طـبيـة",
                    icon: Icons.medical_services_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                           return AddJob(isJob:isFromHospital?true:false,hospital:hospital ,);

                          })
                      );


                    },
                  ),
                  distanceBetween,
                  CardList(
                    title: isFromHospital?isEngish?'Need Blood':"تـقـديم علي دم":isEngish?'Add Blood Donate':" إضـافة مـتبـرع بالـدم",
                    icon: Icons.volunteer_activism_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  BloodLogin(isDoner: true,);
                          })
                      );


                    },
                  ),
                  distanceBetween,
                  isFromHospital?const SizedBox():
                  CardList(
                    title: isEngish?'Need Blood':"بـحـاجة دم",
                    icon:Icons.bloodtype_outlined,

                    function: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context){

                            return  BloodLogin(isDoner: false,);
                          })
                      );


                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  String title;
  IconData icon;
  Function() function;

  CardList({
    required this.title,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;

    return Card(
      elevation: 7,
      child: Container(
        height: 70,

        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
              primary:  const Color.fromRGBO(240, 239, 241, 1),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Icon(icon,color:color,),),
              const SizedBox(
                width: 10,
              ),
              Expanded(child:Text("$title",style: const TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.black),),
                flex: 3,

              ),

            ],
          ),
        ),
      ),
    );
  }
}
