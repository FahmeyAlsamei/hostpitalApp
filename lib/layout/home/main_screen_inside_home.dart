

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/layout/MyDrawer.dart';
import 'package:project/layout/display_hospital/display_hospital_list.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/add_product_information/hospital_information.dart';

import '../../modules/boold/blood.dart';


class MainScreen extends StatelessWidget {

  Widget ShapeFormat(String title , IconData icon,Color color ,Function() function,bool isEnglish){
  return  Container(

        decoration: BoxDecoration(
         color: Colors.white,
          borderRadius: BorderRadius.circular(15),


        ),


               child:TextButton(
                 onPressed: function,
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(icon,color: color ,size: 30,),
                       Text(
                         title,
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             fontSize: 13,
                             height: 1.5,
                             fontWeight: isEnglish?FontWeight.w500:FontWeight.w600,color:Colors.black ),
                       )
                     ]),
               )
    );
  }
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  List imageList=["images/hospital1.jpg","images/hospital4.jpg","images/hospital2.jpg","images/hospital3.jpg","images/hospital5.jpg"];


  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return  Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
             appBar: AppBar(
               title: Text(isEnglish?"For You":"   لِأجـلـكـ",style: TextStyle(fontWeight: isEnglish?FontWeight.w600:FontWeight.w800,fontSize:  isEnglish?20:25,),),
               centerTitle: true,
               leading: Builder(
                 builder: (context){
                   return IconButton(
                     icon: Icon(Icons.menu),
                     iconSize: 49,
                     onPressed: (){
                       Scaffold.of(context).openDrawer();
                     },
                     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                   );
                 },
               )

             ),
        body: Container(
          color: Color.fromRGBO(235, 236, 241, 1),
          padding: EdgeInsets.symmetric( horizontal: 10,vertical: 10),

          child: ListView(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 185,
                width:double.infinity,
                child: CarouselSlider.builder(

                //TODO: CarouselSlider
                 //  items:
                  //
                  //   //1st Image of Slider
                  //   Container(
                  //   margin: EdgeInsets.all(6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       image: DecorationImage(
                  //         image:AssetImage("images/hospital1.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   //2nd Image of Slider
                  //   Container(
                  //     margin: EdgeInsets.all(6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       image: DecorationImage(
                  //         image:AssetImage("images/hospital4.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   //3rd Image of Slider
                  //   Container(
                  //     margin: EdgeInsets.all(6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       image: DecorationImage(
                  //         image:AssetImage("images/hospital2.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   //4th Image of Slider
                  //   Container(
                  //     margin: EdgeInsets.all(6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       image: DecorationImage(
                  //         image:AssetImage("images/hospital3.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   //5th Image of Slider
                  //   Container(
                  //     margin: EdgeInsets.all(6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       image: DecorationImage(
                  //         image:AssetImage("images/hospital5.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),

                  //],

                  //Slider Container properties


                //TODO:CarouselSlider.builder

                itemCount: imageList.length,
                 itemBuilder:(
                     BuildContext context, int index, int realIndex){
                  return  Container(
                         // margin: EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image:AssetImage(imageList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                 },
                  options: CarouselOptions(
                    height: 170.0,
                    enlargeCenterPage: true,
                    initialPage: 0,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 600),
                    viewportFraction: 0.8,
                  ),
                ),
              ),

              SizedBox(height: 0,),

              Text(isEnglish?" Services":"الخدمات",textAlign: TextAlign.center,style: TextStyle(fontFamily:'Racing_Sans_One',fontSize:20,fontWeight: isEnglish?FontWeight.w600:FontWeight.w800,color: Colors.black),
              ),

              GridView(
                physics: ScrollPhysics(

                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 120,
                ),
                children: [

                  ShapeFormat(
                      isEnglish?"Hospitals":"المستشفيات",
                      Icons.apartment_outlined,
                      color,
                          (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>DisplayHospitalList())
                        );
                      },
                      isEnglish
                  ),

                  ShapeFormat(isEnglish?"Clinics":"العيادات", Icons.medical_services_outlined,color,(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){

                        return DisplayHospitalList(isPrssedCilnicButton: true,);
                      })

                  );
                  },
                      isEnglish

                  ),

                  ShapeFormat(isEnglish?"Pharmacy":"الصيدليات", Icons.local_pharmacy_outlined,color,(){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){

                          return DisplayHospitalList(isPrssedPharmacyButton: true,);
                        })

                    );
                  },
                      isEnglish

                  ),
                  ShapeFormat(isEnglish?"Find Doctor":"الأطباء", Icons.person_outline_outlined,color,(){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){

                          return DisplayHospitalList(isPrssedDoctorButton: true,);
                        })

                    );
                  },
                      isEnglish

                  ),

                  ShapeFormat(isEnglish?"Medical Radiation":"الأشعات", Icons.data_array_outlined,color,(){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=>DisplayHospitalList(isPrssedRadiationButton: true,))
                    );

                  },
                      isEnglish

                  ),
                  ShapeFormat(isEnglish?"Medical Laboratory":"مختبرات طبية", Icons.filter_vintage_outlined,color,(){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=>DisplayHospitalList(isPrssedLaboratryButton: true,))
                    );

                  },
                      isEnglish

                  ),
                  ShapeFormat(isEnglish?"Medical Centers":"مراكز طبية", Icons.home_work_outlined,color,(){},
                      isEnglish),
                  ShapeFormat(isEnglish?"Blood Volunteer":"متبرعين بدم", Icons.volunteer_activism_outlined,color,(){

                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=>DisplayHospitalList(isPrssedBloodVolunteertButton: true,))
                    );
                  },
                      isEnglish

                  ),




                  ShapeFormat(isEnglish?"Detention":"وظائف", Icons.work_outline,color,(){

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return DisplayHospitalList(isPressedJobButton: true,);
                      })

                    );

                  },
                      isEnglish
                  ),

                ],
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
              ),

              Container(
                margin: EdgeInsets.all(10),
                height: 240,
              )
            ],
          ),
        ),
        drawer: MyDrawer(),
      ),
    );

  }
}
