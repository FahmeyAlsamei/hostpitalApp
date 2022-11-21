import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/data.dart';
import 'package:project/modules/users/apointment.dart';
import 'package:project/modules/users/doctors.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/modules/users/type_comercial_model.dart';
import 'package:intl/intl.dart' as intl;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:project/models/language.dart';

import '../shared/component/components.dart';
import 'apoinment_sure.dart';
import 'login/login.dart';



class ApointmentScrean extends StatefulWidget {
  Category ?category;
  Doctors ?doctors;
  Hospital hospitals;
  bool isFromdoctor=false;

  ApointmentScrean({Key? key,required this.hospitals,this.doctors,this.category}) : super(key: key);
  @override
  _ApointmentState createState() => _ApointmentState();
}

class _ApointmentState extends State<ApointmentScrean> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateInputController = TextEditingController();
  final dateformat = intl.DateFormat("yyyy-MM-dd");
  final timeformat = intl.DateFormat("hh:mm a");
  bool isDate = false;
  bool isChecked = true;
  bool isPreview = false;
  DateTime? date;
  // var _selectedValue;
  Category ?_selectedValue;


  String ?err;
  String ?emptyDate;
  String ?emptyTime;
  String? errorInvalidText;

  String? selectedItem1;
  TextEditingController apointmentTime = new TextEditingController();
  TextEditingController? apointmentDate = new TextEditingController();

  TextEditingController user_Name = new TextEditingController();
  TextEditingController user_Phone = new TextEditingController();
  bool isEnglish =Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_Name.text=AppData.UserAccountData!.Full_Name!;
    user_Phone.text=AppData.UserAccountData!.PhoneNo!;



    if(widget.category!=null)
    _selectedValue=widget.category;
    if(widget.doctors!=null)
      if(widget.doctors!.category!=null)
        _selectedValue=widget.doctors!.category;

  }


  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).primaryColor;
    return
      AppData.UserAccountData!=null&&
          AppData.UserAccountData!.id!=null&&
          AppData.UserAccountData!.id!=0?
      Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Container(
              decoration: defualtBoxDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(

                    children: [
                      const SizedBox(
                        height: 25,
                      ),

                      Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 5, ),
                          child: Card(
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color:color,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          isEnglish=!isEnglish;
                                         // Navigator.of(context)..pop();
                                        },
                                        icon:  Icon(
                                          isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                   Text(isEnglish?"Appointment ":"حـجـز مـوعـد",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,color: Colors.white,)),
                                  ],
                                )),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 8 - 35,
                      ),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              decoration: defualtBoxDecoration1(),
                              child: Column(
                                children: [

                                  const SizedBox(height: 20,),
                                  widget.category!=null?
                                  Container(
                                    height: 60,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(0.4)
                                        )


                                    ),
                                    child: Center(
                                      child: Text(

                                        widget.category!.Name!,
                                        style:const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ) ,

                                      ),
                                    ),
                                  ):
                                  widget.doctors!=null&&
                                      widget.doctors!.category!=null

                                      ?

                                  Text(

                                    widget.doctors!.category!.Name!,
                                    style:const TextStyle(
                                      color:Colors.black,
                                    ) ,

                                  ):SizedBox(),

                                  Form(
                                    key: formKey,
                                    child:Column(

                                      children: [
                                        widget.doctors!=null&&
                                            widget.doctors!.category!=null|| widget.category!=null?SizedBox(): DropdownButtonFormField(
                                          value: _selectedValue,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          hint: Text(

                                            'اختـار القـسم',
                                            style:TextStyle(
                                              color:_selectedValue==null?Colors.red:Colors.black,
                                            ) ,

                                          ),



                                          onChanged: (value) {
                                            setState(() {
                                              _selectedValue = value as Category?;
                                            });
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              _selectedValue = value as Category?;
                                            });
                                          },

                                          icon: const Icon(Icons.arrow_drop_down_circle),
                                          iconDisabledColor: Colors.red,
                                          iconEnabledColor:const Color.fromRGBO(36, 164, 164, 1),
                                          isExpanded: true,
                                          decoration:InputDecoration(

                                              filled: true,
                                              fillColor: Colors.white,

                                              focusedBorder:OutlineInputBorder(

                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  style: BorderStyle.solid,
                                                  color: const Color.fromRGBO(119, 205, 188, 0.6),),

                                              ) ,
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.withOpacity(0.4),



                                                  )
                                              ),

                                              contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical:5)

                                          ) ,



                                          dropdownColor:const Color.fromRGBO(235, 236, 243, 1),
                                          items: widget.hospitals!.category!.map((e) {
                                            // .map((String val) {
                                            return DropdownMenuItem(
                                                value: e,

                                                alignment:isEnglish?AlignmentDirectional.centerEnd:AlignmentDirectional.centerStart,
                                                child: Text(
                                                    e.Name!
                                                )
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(height: 20,),
                                        defualtTextField(
                                            hinText: 'ادخـل تأريـخ الحـجز',
                                            myController: apointmentDate!,
                                            icon: Icons.calendar_month_outlined,
                                            inputType: TextInputType.datetime,
                                            readonly: true,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return isEnglish?"Date can't be empty"
                                                    : "الرجاء ادخل تاريخ الحجز";
                                              }
                                              return null;
                                            },

                                            onTap: () async{
                                              DateTime? pickedDate=  await   showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime(2022, 1, 1),
                                                  initialDate:  DateTime.now(),

                                                  lastDate: DateTime(2025, 12, 31),
                                                  builder: defualtTheme,



                                              );if(pickedDate!=null){
                                                String formatPickedDate= intl.DateFormat("yyyy-MM-dd").format(pickedDate);
                                                setState((){
                                                  apointmentDate!.text=formatPickedDate;
                                                });
                                              }
                                              else{
                                                if(apointmentDate==null)
                                                  print(apointmentDate!.text);
                                                return null;
                                              }
                                            }),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        defualtTextField(
                                            hinText: "أدخل زمن الحـجز",
                                            myController: apointmentTime,
                                            icon: Icons.watch_later_outlined,
                                            inputType: TextInputType.datetime,
                                            readonly: true,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return isEnglish?"Time can't be empty"
                                                    : "الرجاء ادخل  وقت الحجز";
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                  builder: defualtTheme1)
                                                  .then((value) {
                                                apointmentTime.text =
                                                    value!.format(context).toString();
                                              });

                                            }),
                                        const SizedBox(height: 20,),

                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    decoration: defualtBoxDecoration1(),
                                    padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CheckboxListTile(
                                            title: const Text('استـخدم معلوماتي'),
                                            value: isChecked,
                                            controlAffinity:
                                            ListTileControlAffinity.leading,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = !isChecked;
                                                if(isChecked){
                                                  user_Name..text=AppData.UserAccountData!.Full_Name!;
                                                  user_Phone..text=AppData.UserAccountData!.PhoneNo!;
                                                }else{
                                                  user_Name..text='';
                                                  user_Phone..text='';
                                                }

                                              });
                                            }),
                                        defualtTextField(
                                            hinText:
                                            isChecked ? "إسم المريض" : "ادخـل إسم المريض",
                                            myController: user_Name,
                                            readonly: isChecked ? true : false),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        defualtTextField(
                                            hinText: isChecked
                                                ? "رقم هاتف المريض"
                                                : "ادخـل رقم هاتف المريض ",
                                            myController: user_Phone,
                                            readonly: isChecked ? true : false),
                                        const SizedBox(height: 20,),
                                      ],
                                    ),
                                  ),
                                ],
                              ))   ,

                          const SizedBox(
                            height: 20,
                          ),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _selectedValue!=null?Colors.white:null,
                              border: Border.all(
                                color:  Colors.grey.withOpacity(0.3),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 1,
                                  child: Container(

                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color:  Colors.grey.withOpacity(0.3),
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                            "سعر المعاينة",
                                            style:  TextStyle(letterSpacing:isEnglish? 2:0),
                                          ))),
                                ),
                                const SizedBox(
                                    height:  4
                                ),
                                _selectedValue!=null?
                                Text(
                                  _selectedValue!.price!.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                )
                                    : const SizedBox(),

                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),


                          Container(
                            width: double.infinity,
                            child: defualtElevatedButton(
                                title: 'احـجزالان',
                                function: () {

    if (formKey.currentState!.validate()) {

    if(_selectedValue!=null&&apointmentDate!.text.isNotEmpty&&apointmentDate!=null&&apointmentTime.text.isNotEmpty) {
      if(_selectedValue!=null&&apointmentDate!.text.isNotEmpty&&apointmentTime.text.isNotEmpty){

        ApointmentsModel aboiment=   ApointmentsModel(
          apointment_date: apointmentDate!.text,
          apointment_time: apointmentTime!.text,
          category: _selectedValue,
          created_by: AppData.UserAccountData,
          doctor: widget.doctors,
          Name:user_Name.text,
          Phone_Number: user_Phone.text,
          hospital: widget.hospitals,
          isFinish: null,
          isConform: null,
          isCancel: false,

        );
        print(user_Phone.text,);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ApoinmentSure(aboiment)));



      }
    }
    }

                                // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);

                                },
                                paddingHorizatal: 15,
                                paddingVerical: 15,
                                border: 8),
                          ),
                          const SizedBox(
                            height:  20,
                          ),
                        ],
                      )
                    ]),
              ))),
    ):
      const LogIn()
    ;
  }
}

// class apointment extends StatelessWidget {
//   const apointment({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: Container(
//             decoration: defualtBoxDecoration(),
//             child: ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 children: [
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Card(
//                         child:Container(
//                             height: 40,
//
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_back_ios_new_outlined,
//                                       color: Color.fromRGBO(119, 205, 188, 1),
//                                     )),
//                                 SizedBox(
//                                   width: 85,
//                                 ),
//                                 Text("Almotawakel",
//                                     style:
//                                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                               ],
//                             )),
//
//
//                       )),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 8 -50,
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: defualtBoxDecoration1(),
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                       color: isDate
//                                           ? Color.fromRGBO(138, 215, 228, 1)
//                                           : Colors.grey.withOpacity(0.6))),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Icon(
//                                         Icons.calendar_month_outlined,
//                                         color: Colors.black,
//                                       )),
//                                   Expanded(
//                                     child:
//                                     isDate ? Text('') : Text(' department'),
//                                     flex: 2,
//                                   ),
//                                   Expanded(
//                                     flex: 3,
//                                     child: Container(
//                                         width: 200,
//                                         child: DropdownButton(
//                                           borderRadius:
//                                           BorderRadius.circular(20),
//                                           menuMaxHeight: 320,
//                                           hint: Text('DEPARTMENT'),
//                                           elevation: 0,
//                                           iconEnabledColor: Colors.purple,
//                                           icon: Icon(Icons.arrow_drop_down),
//                                           items: courses.map((course) {
//                                             return DropdownMenuItem(
//                                               value: course,
//                                               child: Text('$course'),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             setState(() {
//                                               selectedItem1 = value.toString();
//                                             });
//                                           },
//                                           value: selectedItem1,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                       color: isDate
//                                           ? Color.fromRGBO(138, 215, 228, 1)
//                                           : Colors.grey.withOpacity(0.6))),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Icon(
//                                         Icons.calendar_month_outlined,
//                                         color: Colors.black,
//                                       )),
//                                   Expanded(
//                                     flex: 2,
//                                     child:
//                                     isDate ? Text('') : Text('Enter Date'),
//                                   ),
//                                   Expanded(
//                                     flex: 3,
//                                     child: Container(
//                                       width: 200,
//                                       child: DateTimeField(
//                                           format: dateformat,
//                                           onChanged: (vbv) {
//                                             setState(() {
//                                               isDate = true;
//                                               date = vbv;
//                                             });
//                                           },
//                                           onShowPicker:
//                                               (context, currentValue) {
//                                             return showDatePicker(
//                                               context: context,
//                                               firstDate: DateTime(2022, 1, 1),
//                                               initialDate: currentValue ??
//                                                   DateTime.now(),
//                                               lastDate:
//                                               DateTime(2025, 12, 31),
//                                               builder: (context, child) {
//                                                 return Theme(
//                                                   data: Theme.of(context).copyWith(
//                                                     colorScheme: ColorScheme.light(
//                                                       primary:Color.fromRGBO(119, 205, 188, 1), // header background color
//                                                       onPrimary: Colors.black, // header text color
//                                                       onSurface: Colors.teal, // body text color
//                                                     ),
//                                                     textButtonTheme: TextButtonThemeData(
//                                                       style: TextButton.styleFrom(
//                                                         primary:Color.fromRGBO(119, 205, 188, 1), // button text color
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   child: child!,
//                                                 );
//                                               },
//
//                                             );
//                                           }),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8),
//                                     border: Border.all(
//                                         color: isDate
//                                             ? Color.fromRGBO(138, 215, 228, 1)
//                                             : Colors.grey.withOpacity(0.6))),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                         child: Icon(
//                                           Icons.access_time_rounded,
//                                           color: Colors.black,
//                                         )),
//                                     Expanded(
//                                       child: isDate
//                                           ? Text('')
//                                           : Text('Enter Time'),
//                                       flex: 2,
//                                     ),
//                                     Expanded(
//                                       flex: 3,
//                                       child: DateTimeField(
//                                         format: timeformat,
//                                         onShowPicker:
//                                             (context, currentValue) async {
//                                           final TimeOfDay? time =
//                                           await showTimePicker(
//                                             context: context,
//                                             initialTime: TimeOfDay.fromDateTime(
//                                                 currentValue ?? DateTime.now()),
//                                             builder: (context, child) {
//                                               return Theme(
//                                                 data: Theme.of(context).copyWith(
//                                                   colorScheme: ColorScheme.light(
//                                                     primary: Colors.teal, // header background color
//                                                     onPrimary: Colors.black, // header text color
//                                                     onSurface:Color.fromRGBO(119, 205, 188, 1), // body text color
//                                                   ),
//                                                   textButtonTheme: TextButtonThemeData(
//                                                     style: TextButton.styleFrom(
//                                                       primary:Color.fromRGBO(119, 205, 188, 1), // button text color
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 child: child!,
//                                               );
//                                             },
//                                           );
//                                           return time == null
//                                               ? null
//                                               : DateTimeField.convert(time);
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 )),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         decoration: defualtBoxDecoration1(),
//                         padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             CheckboxListTile(
//                                 title: Text('Use My Information'),
//                                 value: isChecked,
//                                 controlAffinity:
//                                 ListTileControlAffinity.leading,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isChecked = !isChecked;
//                                   });
//                                 }),
//                             defualtTextField(
//                                 hinText:
//                                 isChecked ? "Fahmey" : "Enter your name",
//                                 myController: user_Name,
//                                 readonly: isChecked ? true : false),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             defualtTextField(
//                                 hinText: isChecked
//                                     ? "26"
//                                     : "Enter your phone number",
//                                 myController: user_Name,
//                                 readonly: isChecked ? true : false)
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             isPreview = !isPreview;
//                           });
//                         },
//                         child: Container(
//                           height: isPreview ? 120 : 63,
//                           decoration: defualtBoxDecoration1(),
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Container(
//                                     height: 50,
//                                     width: double.infinity,
//                                     child: Center(
//                                         child: Text(
//                                           "PREVIEW",
//                                           style: TextStyle(letterSpacing: 2),
//                                         ))),
//                               ),
//                               SizedBox(
//                                 height: isPreview ? 9 : 0,
//                               ),
//                               isPreview
//                                   ? Text(
//                                 "3000 ",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 35),
//                               )
//                                   : SizedBox(
//                                 width: 0,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         child: defualtElevatedButton(
//                             title: 'APOINTMENT NOW',
//                             function: () {
//                               // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => ApoinmentSure()));
//                             },
//                             paddingHorizatal: 15,
//                             paddingVerical: 15,
//                             border: 8),
//                       )
//                     ],
//                   )
//                 ])));
//   }
// }

//
// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd");
//
//   @override
//   Widget build(BuildContext context) {
//     return  DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) {
//           return showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));
//         },
//       );
//
//   }
// }
//
// class BasicTimeField extends StatelessWidget {
//   final format = DateFormat("hh:mm a");
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//           );
//           return time == null ? null : DateTimeField.convert(time);
//         },
//       ),
//     ]);
//   }
// }
//
// class ComplexDateTimeField extends StatefulWidget {
//   @override
//   _ComplexDateTimeFieldState createState() => _ComplexDateTimeFieldState();
// }
//
// class _ComplexDateTimeFieldState extends State<ComplexDateTimeField> {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   final initialValue = DateTime.now();
//
//   AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
//   bool? readOnly = true;
//   bool? showResetIcon = true;
//   DateTime? value = DateTime.now();
//   int changedCount = 0;
//   int savedCount = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Complex date & time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//               context: context,
//               firstDate: DateTime(2020),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2024));
//           if (date != null) {
//             final time = await showTimePicker(
//               context: context,
//               initialTime:
//                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//             );
//             return DateTimeField.combine(date, time);
//           } else {
//             return currentValue;
//           }
//         },
//         autovalidateMode: autoValidateMode,
//         validator: (date) => date == null ? 'Invalid date' : null,
//         initialValue: initialValue,
//         onChanged: (date) => setState(() {
//           value = date;
//           changedCount++;
//         }),
//         onSaved: (date) => setState(() {
//           value = date;
//           savedCount++;
//         }),
//         resetIcon: showResetIcon! ? Icon(Icons.delete) : null,
//         readOnly: readOnly!,
//         decoration: InputDecoration(
//             helperText: 'Changed: $changedCount, Saved: $savedCount, $value'),
//       ),
//       CheckboxListTile(
//         title: Text('autoValidate'),
//         value: autoValidateMode != AutovalidateMode.disabled,
//         onChanged: (value) =>
//             setState(() => autoValidateMode = AutovalidateMode.always),
//       ),
//       CheckboxListTile(
//         title: Text('readOnly'),
//         value: readOnly,
//         onChanged: (value) => setState(() => readOnly = value),
//       ),
//       CheckboxListTile(
//         title: Text('showResetIcon'),
//         value: showResetIcon,
//         onChanged: (value) => setState(() => showResetIcon = value),
//       ),
//     ]);
//   }
// }
//
// class BasicDateTimeField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic date & time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));
//           if (date != null) {
//             final time = await showTimePicker(
//               context: context,
//               initialTime:
//                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//             );
//             return DateTimeField.combine(date, time);
//           } else {
//             return currentValue;
//           }
//         },
//       ),
//     ]);
//   }
// }
//
// class IosStylePickers extends StatefulWidget {
//   @override
//   _IosStylePickersState createState() => _IosStylePickersState();
// }
//
// class _IosStylePickersState extends State<IosStylePickers> {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   DateTime? value;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('iOS style pickers (${format.pattern})'),
//       DateTimeField(
//         initialValue: value,
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           await showCupertinoModalPopup(
//               context: context,
//               builder: (context) {
//                 return BottomSheet(
//                   builder: (context) => Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         constraints: BoxConstraints(maxHeight: 200),
//                         child: CupertinoDatePicker(
//                           onDateTimeChanged: (DateTime date) {
//                             value = date;
//                           },
//                         ),
//                       ),
//                       TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Ok')),
//                     ],
//                   ),
//                   onClosing: () {},
//                 );
//               });
//           setState(() {});
//           return value;
//         },
//       ),
//     ]);
//   }
// }
//
// // class ComplexDateTimeField extends StatefulWidget {
// //   @override
// //   _ComplexDateTimeFieldState createState() => _ComplexDateTimeFieldState();
// // }
// //
// // class _ComplexDateTimeFieldState extends State<ComplexDateTimeField> {
// //   final format = DateFormat("yyyy-MM-dd HH:mm");
// //   final initialValue = DateTime.now();
// //
// //   AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
// //   bool? readOnly = true;
// //   bool? showResetIcon = true;
// //   DateTime? value = DateTime.now();
// //   int changedCount = 0;
// //   int savedCount = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(children: <Widget>[
// //       Text('Complex date & time field (${format.pattern})'),
// //       DateTimeField(
// //         format: format,
// //         onShowPicker: (context, currentValue) async {
// //           final date = await showDatePicker(
// //               context: context,
// //               firstDate: DateTime(2020),
// //               initialDate: currentValue ?? DateTime.now(),
// //               lastDate: DateTime(2024));
// //           if (date != null) {
// //             final time = await showTimePicker(
// //               context: context,
// //               initialTime:
// //                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
// //             );
// //             return DateTimeField.combine(date, time);
// //           } else {
// //             return currentValue;
// //           }
// //         },
// //         autovalidateMode: autoValidateMode,
// //         validator: (date) => date == null ? 'Invalid date' : null,
// //         initialValue: initialValue,
// //         onChanged: (date) => setState(() {
// //           value = date;
// //           changedCount++;
// //         }),
// //         onSaved: (date) => setState(() {
// //           value = date;
// //           savedCount++;
// //         }),
// //         resetIcon: showResetIcon! ? Icon(Icons.delete) : null,
// //         readOnly: readOnly!,
// //         decoration: InputDecoration(
// //             helperText: 'Changed: $changedCount, Saved: $savedCount, $value'),
// //       ),
// //       CheckboxListTile(
// //         title: Text('autoValidate'),
// //         value: autoValidateMode != AutovalidateMode.disabled,
// //         onChanged: (value) =>
// //             setState(() => autoValidateMode = AutovalidateMode.always),
// //       ),
// //       CheckboxListTile(
// //         title: Text('readOnly'),
// //         value: readOnly,
// //         onChanged: (value) => setState(() => readOnly = value),
// //       ),
// //       CheckboxListTile(
// //         title: Text('showResetIcon'),
// //         value: showResetIcon,
// //         onChanged: (value) => setState(() => showResetIcon = value),
// //       ),
// //     ]);
// //   }
// // }
//
// class Clock24Example extends StatelessWidget {
//   final format = DateFormat("HH:mm");
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('24 hour clock'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//             builder: (context, child) => MediaQuery(
//                 data: MediaQuery.of(context)
//                     .copyWith(alwaysUse24HourFormat: true),
//                 child: child!),
//           );
//           return DateTimeField.convert(time);
//         },
//       ),
//     ]);
//   }
// }
//
// class LocaleExample extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Changing the pickers\' language'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//             context: context,
//             firstDate: DateTime(1900),
//             initialDate: DateTime.now(),
//             lastDate: DateTime(2100),
//             builder: (context, child) => Localizations.override(
//               context: context,
//               locale: Locale('zh'),
//               child: child,
//             ),
//           );
//           if (date != null) {
//             final time = await showTimePicker(
//               context: context,
//               initialTime:
//                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//               builder: (context, child) => Localizations.override(
//                 context: context,
//                 locale: Locale('zh'),
//                 child: child,
//               ),
//             );
//             return DateTimeField.combine(date, time);
//           } else {
//             return currentValue;
//           }
//         },
//       ),
//     ]);
//   }
// }
//
// // import 'package:flutter/material.dart';
// //
// // import '../shared/component/components.dart';
// //
// // class DisplayOneHospital extends StatefulWidget {
// //   @override
// //   State<DisplayOneHospital> createState() => _DisplayOneHospitalState();
// // }
// //
// // class _DisplayOneHospitalState extends State<DisplayOneHospital> {
// //   bool isSmall = true;
// //   bool isSmallActiveTime = false;
// //   bool isReadmore = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double height1 = MediaQuery.of(context).size.height / 4.round();
// //     double mapHeight = MediaQuery.of(context).size.height / 4.round();
// //
// //     return Scaffold(
// //         body: Container(
// //             decoration: defualtBoxDecoration(),
// //             child: ListView(
// //                 padding: EdgeInsets.symmetric(horizontal: 15),
// //                 children: [
// //                   SizedBox(
// //                     height: 30,
// //                   ),
// //                   Padding(
// //                       padding: const EdgeInsets.symmetric(vertical: 10),
// //                       child: Card(
// //                           child: Container(
// //                         child: Text(
// //                           "d",
// //                         ),
// //                       )))
// //                 ])));
// //   }
// // }
// //
// // //
// // //
// // //
// // // 04:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م, 09:00 ص, 09:30 ص, 10:00 ص, 10:30 ص, 11:00 ص, 11:30 ص, 12:00 م, 12:30 م], sunday: [], monday: [04:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م], tuesday: [], wednesday: [04:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م], thursday: [], friday: []}
// // // 4:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م, 09:00 ص, 09:30 ص, 10:00 ص, 10:30 ص, 11:00 ص, 11:30 ص, 12:00 م, 12:30 م]I/flutter (25579): staticDaysList []
// // // 04:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م
// // //
// // // 04:30 م, 05:00 م, 05:30 م, 06:00 م, 06:30 م, 07:00 م, 07:30 م, 08:00 م]
