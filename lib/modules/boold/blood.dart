

// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:project/api/api_blood.dart';
import 'package:project/config/data.dart';
import 'package:project/layout/home/home_screen.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/users/blood.dart';
import 'dart:io';
import '../../shared/component/components.dart';

// ignore: must_be_immutable
class BloodLogin extends StatefulWidget {
  bool isDoner;
  BloodLogin(
      {Key? key, this.isDoner = false, }) : super(key: key);

  @override
  State<BloodLogin> createState() => _BloodLoginState();
}

class _BloodLoginState extends State<BloodLogin> {
  final keyform = GlobalKey<FormState>();

  int is_Male =1;


  int mydata_For_All=1;

  int donated_befor=1;

  TextEditingController donerName = TextEditingController();
  TextEditingController donerPhone1 = TextEditingController();
  TextEditingController donerPhone2 = TextEditingController();
  TextEditingController BloodType = TextEditingController();
  TextEditingController donerAge = TextEditingController();
  TextEditingController donerCity = TextEditingController();
  TextEditingController donerDirectorate = TextEditingController();
  TextEditingController AddtionalInformationAboutDoner = TextEditingController();
  TextEditingController volunteerDate=TextEditingController();

  double sizeBetween1=20;
  double sizeBetween2=27;  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;



    // String? bloodtype ;
   bool  isSave=false;

  var _selectedValue;

  String ?err;
  String ?emptyDate;

  String ?emptyDirectorate;

  String textEmptyError="can't be empty";



  List<String> listOfValue =['O-', 'O+', 'A-', 'A+', 'B-','B+','AB-', 'AB+'];



  @override
  Widget build(BuildContext context) {
      Color color =Theme.of(context).primaryColor;
      TextStyle style= TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20,color: color);
      return Directionality(
        textDirection:  isEnglish?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
          //backgroundColor: Color.fromRGBO(244,245, 250, 1),

            body: Container(
                decoration: defualtBoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:SingleChildScrollView(

                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40,),

                      const SizedBox(height: 30,),
                     Form(
                          key:keyform ,
                         child:Column(
                           children: [


                             defualtTextField(
                                 hinText: isEnglish?widget.isDoner?"doner name ":"The name of the needy blood"
                                     : widget.isDoner?"اسم المتبرع ":"اسم المحتاج للدم",                                 icon: Icons.person,
                                 myController: donerName,
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return isEnglish?"Name can't be empty"
                                         : "الرجاء ادخال الاسم";
                                   }
                                   return null;
                                 }
                             ),
                             SizedBox(
                               height: widget.isDoner?sizeBetween1:25,
                             ),
                             defualtTextField(
                                 hinText: isEnglish? "Phone Number 1"
                                     : "رقم الجوال ",
                                 icon: Icons.phone,
                                 myController: donerPhone1,
                                 inputType: TextInputType.number,
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return isEnglish?"Phone number can't be empty"
                                         : "الرجاء ادخال رقم الجوال";
                                   }
                                   return null;
                                 }

                             ),

                             SizedBox(
                               height: widget.isDoner?sizeBetween1: 25,
                             ),

                             defualtTextField(
                                 hinText: isEnglish?"Phone Number 2"
                                     : "رقم جوال آخر او رقم الهاتف الثابت  ",
                                 icon: Icons.phone_rounded,
                                 myController: donerPhone2,
                                 inputType: TextInputType.number),

                             SizedBox(
                                 height: widget.isDoner?sizeBetween1: sizeBetween2
                             ),




                             defualtTextField(
                                 hinText:isEnglish? "City"
                                     : "المدينة",
                                 icon: Icons.location_on_rounded,
                                 myController: donerCity,
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return "الرجاء ادخل اسم المدينة";
                                   }
                                   return null;
                                 }
                             ),

                             SizedBox(
                                 height: widget.isDoner?sizeBetween1: sizeBetween2
                             ),
                             defualtTextField(
                                 hinText: isEnglish?"Directorate"
                                     : "المديرية",
                                 icon: Icons.location_on_rounded,
                                 myController: donerDirectorate,
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return isEnglish?"Directorate can't be empty"
                                         : "الرداء ادخل  اسم المديرية";
                                   }
                                   return null;
                                 }
                             ),
                             SizedBox(
                                 height: widget.isDoner?sizeBetween1: sizeBetween2
                             ),
                             DropdownButtonFormField(
                               value: _selectedValue,
                               autovalidateMode: AutovalidateMode.onUserInteraction,
                               hint: Text(

                                 isEnglish?'Choose Blood Type':"اختار نـوع فصـيلة الدم",
                                 style:TextStyle(
                                   color:  err!=null&&err!.isNotEmpty?Colors.red:Colors.black,
                                 ) ,

                               ),


                               onChanged: (value) {
                                 // setState(() {
                                 //   _selectedValue = value;
                                 // });
                               },
                               onSaved: (value) {
                                 // setState(() {
                                 //   _selectedValue = value;
                                 // });
                               },
                               isDense: false,
                               icon: const Icon(Icons.arrow_drop_down_circle),
                               iconDisabledColor: Colors.red,
                               iconEnabledColor:color,
                               isExpanded: true,
                               decoration:InputDecoration(

                                   filled: true,
                                   fillColor: Colors.white,
                                   errorText: err,
                                   focusedBorder:OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(8),
                                     borderSide: const BorderSide(
                                       width: 2,
                                       style: BorderStyle.solid,
                                       color:  Color.fromRGBO(119, 205, 188, 0.6),),

                                   ) ,
                                   enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(8),
                                       borderSide: BorderSide(
                                         color: Colors.grey.withOpacity(0.4),



                                       )
                                   ),

                                   contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5)


                               ) ,



                               items: listOfValue
                                   .map((String val) {
                                 return DropdownMenuItem(
                                     value: val,

                                     onTap: (){
                                      setState((){
                                        _selectedValue=val;
                                        print(_selectedValue);
                                      });
                                     },
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                         children: [
                                           Icon(Icons.bloodtype,color: color,),
                                           const SizedBox(width: 30,),
                                           Text(
                                               val
                                           ),
                                         ],
                                       ),
                                     )
                                 );
                               }).toList(),
                             ),

                           ],
                         )

                     ),

                      //SizedBox(height:6,),

                      SizedBox(
                          height: widget.isDoner?sizeBetween1: sizeBetween2
                      ),

                      widget.isDoner? Text(
                          isEnglish? " Sex":"الجنس",
                          style:style
                      ):const SizedBox(),
                      SizedBox(height: sizeBetween1-20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Row(

                          children: [

                            Expanded(
                              child: RadioListTile(
                                  title:  Text( isEnglish? " Male":"ذكر",),
                                  value: 1,
                                  groupValue: is_Male,
                                  activeColor: color,
                                  onChanged:(value){
                                    setState(() {
                                      is_Male= value as int;
                                    });
                                    print(is_Male);
                                  }

                              ),
                            ),
                            Expanded(child: RadioListTile(
                                title: isEnglish?const Text("Female")
                                    : const Text("انـثى"),
                                value: 2,
                                activeColor: color,

                                groupValue: is_Male,
                                onChanged:(value){
                                  setState(() {
                                    is_Male= value as int;
                                  });
                                }

                            ))
                          ],
                        ),
                      ) ,
                      SizedBox(
                          height: widget.isDoner?sizeBetween1: sizeBetween2-20
                      ),
                      widget.isDoner?Text(
                          isEnglish?" Show my data    ":"اعرض بياناتي",
                          style:style
                      ):const SizedBox(),
                      SizedBox(height: sizeBetween1-20,),
                      if (widget.isDoner) Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Row(

                          children: [

                            Expanded(
                              child: RadioListTile(
                                  title: isEnglish?const Text("For all")
                                      : const Text("العرض للكل"),
                                  value: 1,
                                  activeColor: color,
                                  groupValue: mydata_For_All,
                                  onChanged:(value){
                                    setState((){
                                      mydata_For_All=value as int;
                                    });
                                  }

                              ),
                            ),
                            Expanded(child: RadioListTile(
                                title: isEnglish?const Text("For hospital")
                                    : const Text("للمستشفيات"),
                                value: 2,
                                groupValue: mydata_For_All,
                                activeColor: color,
                                onChanged:(value){
                                  setState((){
                                    mydata_For_All=value as int;
                                  });
                                }

                            ))
                          ],
                        ),
                      ) else const SizedBox(),
                      SizedBox(
                          height: widget.isDoner?sizeBetween1: sizeBetween2-20
                      ),
                      widget.isDoner?Text(
                          isEnglish?" Have you ever donated blood":"هل قد تبرعت بالدم سابقا",
                          style:style
                      ):const SizedBox(),
                      SizedBox(height: sizeBetween1-15,),
                      widget.isDoner?  Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Row(

                          children: [

                            Expanded(
                              child: RadioListTile(
                                  title: isEnglish?const Text("Yes")
                                      : const Text("نعـم"),
                                  value: 1,
                                  groupValue:donated_befor,
                                  activeColor: color,
                                  onChanged:(value){

                                    setState((){
                                      donated_befor=value as int;


                                    });
                                  }

                              ),
                            ),
                            Expanded(child: RadioListTile(
                                title: isEnglish?const Text("No")
                                    : const Text("لا"),
                                value: 2,
                                groupValue:donated_befor,
                                activeColor: color,
                                onChanged:(value){
                                  setState((){
                                    donated_befor=value as int;
                                  });
                                }

                            ))
                          ],
                        ),
                      ) :const SizedBox(),
                      SizedBox(
                          height: widget.isDoner?sizeBetween1+20: sizeBetween2-15
                      ),

                      donated_befor==1?widget.isDoner?defualtTextField(
                          hinText: isEnglish?'Enter Last Date You Donate'
                              : 'ادخل تاريخ آخر  تبرع ',
                          myController: volunteerDate,
                          icon: Icons.calendar_month_outlined,
                          inputType: TextInputType.datetime,


                          readonly: true,
                          onTap: () async{
                            DateTime? pickedDate=  await   showDatePicker(
                                context: context,
                                firstDate: DateTime(2022, 1, 1),
                                initialDate:  DateTime.now(),
                                lastDate: DateTime(2025, 12, 31),
                                builder: defualtTheme

                            );
                            if(pickedDate!=null){
                              String formatPickedDate= intl.DateFormat("yyyy-MM-dd").format(pickedDate);

                              setState((){
                                volunteerDate.text=formatPickedDate;
                              });
                            }
                            else{
                              return;
                            }
                          }):SizedBox():const SizedBox(),
                      donated_befor==2?const SizedBox(height: 15,):SizedBox(
                          height: widget.isDoner?sizeBetween1+20: sizeBetween2-15
                      ),


                      defualtTextField(
                          hinText: isEnglish?widget.isDoner?"More Information About Volunteer ":"More Information About Who request the blood  "
                              : widget.isDoner?"اضافة معلومات عن المتبرع بالدم ":"اضافة معلمات عن المحتاج للدم  ",                          icon: Icons.add,
                          myController: AddtionalInformationAboutDoner,
                          numberOfline: 6),
                      SizedBox(
                          height: widget.isDoner?sizeBetween1+30: sizeBetween2
                      ),
                      isSave?
                      Center(
                        child: CircularProgressIndicator(
                          color: color,
                        ),
                      )


                          :SizedBox(
                        width: double.infinity,
                        child: defualtElevatedButton(
                            title: 'SAVE',
                            function: ()async {



                              if(keyform.currentState!.validate()  )
                              {
                                if(volunteerDate!=null){
                                  setState((){
                                    isSave=true;
                                  });

                                  BloodProvider _bloodProvider=BloodProvider();
                                  Blood _blood=Blood(
                                    Name:donerName.text,
                                    Phone_Number1: donerPhone1.text,
                                    phone_Number2: donerPhone2.text,
                                    city: donerCity.text,
                                    directorate: donerDirectorate.text,
                                    blood_Type: _selectedValue,
                                    gender: is_Male==1?true:false,
                                    is_data_aveilable: mydata_For_All==1?true:false,
                                    volunteer_data:donated_befor==1?true:false,
                                    status: widget.isDoner==true?true:false,
                                    created_by: AppData.UserAccountData,

                                  );

                                  Blood? _newBlood= await _bloodProvider.addNewBlood(_blood);

                                  if(_newBlood!=null&&_newBlood!.id!=null ){
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context){

                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),

                                                side: const BorderSide(
                                                    color: Colors.grey
                                                )

                                            ),
                                            backgroundColor:    const Color.fromRGBO(234, 235, 243,1),
                                            child: Container(

                                              height:isEnglish? MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/2.8,

                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10,),
                                                  Center(
                                                    child:  Icon(Icons.check_circle,color: color,size: 60,),
                                                  ),


                                                  const SizedBox(height: 10,),

                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(isEnglish? ''' Will try to add information to application as soon as possible after validation process of them. and Thanks'''
                                                        : '''   سوف نحاول قدر الامكان اضافة المعلومات في التطبيق في أقرب وقت ممكن  وشكراً لتبرعكم''',style: TextStyle(fontSize:isEnglish? 14:18,fontWeight: isEnglish?FontWeight.w500:FontWeight.w700),textAlign: TextAlign.center,),
                                                  ),


                                                  const SizedBox(width: 29,),
                                                  Center(
                                                    child: defualtElevatedButton(
                                                      title: isEnglish? "Agree": " موافق ",
                                                      function: (){
                                                        Navigator.of(context).pushAndRemoveUntil(
                                                            MaterialPageRoute(builder: (context){
                                                              return  MyHomePage();
                                                            })
                                                            , (route) => false);
                                                      },

                                                      border: 8,
                                                      paddingHorizatal: 35,
                                                      paddingVerical: 10,

                                                    ),
                                                  ),



                                                ],
                                              ),
                                            ),
                                          );

                                        });

                                  }



                                }

                              }


                            },
                            border: 8
                          //Color.fromRGBO(138, 215, 228, 0.7)
                        ),
                      ),
                      const SizedBox(
                          height: 30
                      ),
                    ],
                  ),
                )


            )),
      );
  }
}
