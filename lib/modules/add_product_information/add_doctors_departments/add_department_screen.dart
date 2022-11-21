// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:project/models/language.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/modules/work_time/work_time.dart';

import '../../../api/api_category.dart';
import '../../../shared/component/components.dart';
import '../../users/type_comercial_model.dart';


class AddDepartment extends StatefulWidget {
  bool isFromPharmacy;
  Hospital ? hospital;
  // add_doctor(ظthis.this,work_timorktimethis.hospital});
  AddDepartment({Key? key, this.isFromPharmacy=false,this.hospital}) : super(key: key);
  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {

  TextEditingController  Doctor_Name = TextEditingController();
  TextEditingController  level = TextEditingController();
  TextEditingController  price = TextEditingController();
  // TextEditingController Work_Address  = TextEditingController();
  TextEditingController Addtional_Information_about_dectors  = TextEditingController();
  final formKey = GlobalKey<FormState>();


  TapGestureRecognizer _isWorkTime=TapGestureRecognizer();

  @override
  initState(){
    _isWorkTime=TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(WorkTime.routeName);
      };
    super.initState();

  }
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: Color.fromRGBO(244,245, 250, 1),

          body:  Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            decoration: defualtBoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 40,

                      decoration: BoxDecoration(
                          color: const  Color.fromRGBO(78,162,152,1),
                          borderRadius:BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon:  Icon(
                                isEnglish?Icons.arrow_back_ios_new_outlined:Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              )),
                          SizedBox(
                              width:wid/5.4
                          ),
                          Text(widget.isFromPharmacy?isEnglish?"DOCTOR  INFORMATION":"معلومات الدكتور":isEnglish?"DEPARTMENT  INFORMATION":"معلومات القسم",textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                        ],
                      )),

                  Padding(padding: const EdgeInsets.only(top: 30),

                    child: Column(

                      children: [


                        Center(
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
                                        color:  Color.fromRGBO(78,162,152,1),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('images/fahmey.jpg'))),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                      Border.all(width: 5, color: Colors.white),
                                      color:  const Color.fromRGBO(138, 215, 228, 1),
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),


                        Form(
                            key: formKey,
                            child: Column(

                              children: [
                                defualtTextField(
                                    icon: widget.isFromPharmacy?Icons.person_outline:Icons.holiday_village_outlined,
                                    hinText: widget.isFromPharmacy?isEnglish?"Doctor Name":"أسـم الـدكتـور" :isEnglish?"Department Name ":"أسـم الـقـسـم",
                                    myController:Doctor_Name,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return widget.isFromPharmacy?isEnglish?"Doctor name can't be empty":"أسـم الـدكتـوران يظل فارغ" :isEnglish?"Department name can't be empty ":"أسـم الـقـسـم لايمكن ان يظل فارغ";
                                      }

                                    }
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                defualtTextField(
                                    icon: widget.isFromPharmacy?Icons.book_outlined:Icons.price_check_outlined,
                                    hinText: widget.isFromPharmacy?isEnglish?"Doctor Degree":"الـدرجة الـعلـمية":isEnglish?"Preview Price":"سعر الـمعاينة",
                                    myController:price,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return widget.isFromPharmacy?isEnglish?"Doctor degree can't be empty":"الـدرجة الـعلـمية ان يظل فارغ" :isEnglish?"Preview Price can't be empty ":"سعر الـمعاينة لايمكن ان يظل فارغ";
                                      }

                                    },

                                    inputType:  widget.isFromPharmacy?

                                    TextInputType.text:const TextInputType.numberWithOptions(
                                      decimal: true,signed: true,


                                    )
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),









                        const SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: defualtElevatedButton(title: 'SAVE',
                              // function: (){
                              //
                              //
                              //   // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                              //   // Navigator.of(context).pop();
                              // },


                              function: () async {
                                // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                                // Navigator.of(context).pop();
                                // Navigator.of(context).pop();

                                // String? path;
                                // if(imgFile!=null&&imgFile!.path !=null){
                                //   path=imgFile!.path;
                                // }else{
                                //   path=widget.hospital!.images_main;
                                //
                                // }
                                CategoryProvider  _doctors_api=  CategoryProvider();
                                Category _hospital=Category(
                                  hospital: widget.hospital,

                                  price: price.text!=null&&
                                      price.text.isNotEmpty?
                                  double.parse(price.text.replaceAll(' ', '')):
                                  null
                                  ,
                                  // is_laboratry: widget.isLabortory,
                                  // is_radiation: widget.isRediation,
                                  // longitude: 0.0000,
                                  // latitude: 0.0000,
                                  // category: ,
                                  // id: [],

                                  // is_hospital: widget.isHospital,
                                  // created_by: AppData.UserAccountData,



                                  Name: Doctor_Name.text,
                                  Level:level.text,


                                  // id: ,

                                  // location_Name:product_Address.text,
                                  // Detial_AR:Addtional_Information_about_dectors.text,
                                  // images_main:imgFile!=null?imgFile!.path.toString():null,
                                  //
                                  //
                                  // activTime:widget.worktime,



                                ) ;
                                if (formKey.currentState!.validate()) {


                                  Category ?_DoctorsNew= await _doctors_api.addNewCategory(_hospital);
                                  // print(_DoctorsNew!.Name);
                                  if(_DoctorsNew!=null&&_DoctorsNew.id!=null){
                                    // var nav= Navigator.of(context);
                                    // nav.pop();
                                    // nav.pop();

                                    Navigator.of(context).pop();
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) =>
                                    //     widget.isClinic
                                    //         ? DisplayOnePharmacy(_DoctorsNew,is_clinic: true,)
                                    //         : widget.isPharmacy
                                    //         ? DisplayOnePharmacy(_DoctorsNew,)
                                    //         : widget.isLabortory
                                    //         ? DisplayOnePharmacy(_DoctorsNew,is_laboratory: true,)
                                    //         : widget.isRediation
                                    //         ? DisplayOnePharmacy(_DoctorsNew,is_radiation: true,)
                                    //     // : widget.isPrssedBloodVolunteertButton
                                    //     // ? DisplayOnePharmacy(_DoctorsNew,is_volunteer: true,)
                                    //         : DisplayOneDoctors(_DoctorsNew,)));
                                    //
                                    // print(_DoctorsNew.is_hospital);

// snackBar.
                                  }
                                }




                                // CategoryProvider.addHospital()


                                // Navigator.of(context).pop();


                              },
                              border: 8
                            //Color.fromRGBO(138, 215, 228, 0.7)
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/14,),

                      ],
                    ),
                  )

                ],
              ),
            ),
          )


      ),
    );
  }
}


