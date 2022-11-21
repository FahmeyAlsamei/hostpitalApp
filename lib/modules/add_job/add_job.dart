// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/api/api_job.dart';
import 'package:project/config/data.dart';
import 'package:project/layout/home/home_screen.dart';
import 'package:project/models/language.dart';
import 'package:project/shared/component/components.dart';

import '../users/Jobs.dart';
import '../users/hospital_model.dart';


class AddJob extends StatefulWidget {
  bool isJob;
  Hospital? hospital;
  AddJob({required this.isJob,this.hospital});
  @override
  State<AddJob> createState() => _AddJobState();
}


String? emptyAdTitle;
String? emptyJobTitle;
String? emptyWorkingHour;
String? emptySalary;
String? emptyEmail;
String? emptyLevelExperience;
String? emptyDegree;
String? emptyDirectorate;
String textEmptyError = "can't be empty";
var defualtExperience;


var distanceBetween=const SizedBox(height: 22,);



class _AddJobState extends State<AddJob> {
  TextEditingController adTitle = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController workingHour = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController AddtionalInformationAboutJob = TextEditingController();
  var formKey=GlobalKey<FormState>();

  File? imgFile;
  final imgPicker = ImagePicker();
  List<String> listAcademicDegree = [
    isEnglish?'Diploma':"دبلوم",
    isEnglish? "Bachelor's":"بكالوريوس",
    isEnglish?"Master's":"ماجستير",
    isEnglish?'Associate':"زمالة",
    isEnglish?'Board':"بورد",
    isEnglish?'Doctoral':"دكتوراه"
  ];
  List<String> listExperience = [
    isEnglish?'Beginner ':"مبتدئ",
    isEnglish?'1-2 years':"1-2 سنة ",
    isEnglish? '3-4 years':"3-4 سنة",
    isEnglish?'4-6 years':"4-6 سنة",
    isEnglish?'6-9 years':"6-9 سنة:",
    isEnglish?'9-11 years': "9-11 سنة",
    isEnglish?'11+':" 11 سنة فما فوق",
  ];
  String? _selectedValue;
  String? _defualtDegree;
  bool isSave=false;

  Future<void> showOptionsDialog(BuildContext context) {
    Color color=Theme.of(context).primaryColor;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), side: BorderSide()),
            backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openCamera();
                        },
                        label:const Text('Image From Camera',
                            style:TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                color: Colors.black)),
                        icon:const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )),
                  const  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openGallery();
                        },
                        label:const Text('Image From Gallery',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                color: Colors.black)),
                        icon:const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary:color,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera != null) imgFile = File(imgCamera.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery != null) imgFile = File(imgGallery.path);
    });
    Navigator.of(context).pop();
  }


  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    Color color=Theme.of(context).primaryColor;
    bool isEngish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

    return
      Directionality(textDirection:isEnglish? TextDirection.rtl:TextDirection.rtl,
        child: Scaffold(
            body: Container(
                decoration: defualtBoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        const SizedBox(
                          height: 40,
                        ),

                        Center(
                          child: Stack(
                            children: [
                              Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromRGBO(235, 236, 243, 1),
                                          width: 3),
                                      boxShadow:const  [
                                        BoxShadow(
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          color: Color.fromRGBO(119, 205, 188, 1),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: (imgFile != null)
                                              ? FileImage(imgFile!, scale: 1)
                                          as ImageProvider
                                              : AssetImage( widget.isJob?'images/doctor2.jpg':'images/hospital5.jpg')))),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:color,

                                        border: Border.all(
                                            width: 4,
                                            color: const Color.fromRGBO(235, 236, 243, 1)),
                                        // color: color,
                                      ),
                                      child: IconButton(
                                        hoverColor: const Color.fromRGBO(138, 215, 228, 1),
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          showOptionsDialog(context);
                                        },
                                      )))
                            ],
                          ),
                        ),
                        //SizedBox(height:6,),
                        distanceBetween,


                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                defualtTextField(
                                    hinText: widget.isJob? isEngish?"job advertisement title":"عنوان اعلان الوظيفة":isEngish?"Job Seeker Name":"اسم المتقدم",
                                    icon: Icons.title_sharp,
                                    myController: adTitle,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return widget.isJob?isEnglish?"Job Adv title  can't be empty":"لا يمكن ان يظل عنوان الاعلان فارغ" :isEnglish?"Job seeker Name can't be empty ":"لا يمكن ان يظل اسم المتقدم فارغ";
                                      }

                                      return null;
                                    }
                                ),
                                !widget.isJob?   distanceBetween:const SizedBox(),

                                !widget.isJob? defualtTextField(
                                    hinText:isEngish?"phone Number":" رقم الجوال ",
                                    icon: Icons.phone,
                                    myController: phoneNumber,
                                    inputType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return isEnglish?"Phone number can't be empty"
                                            : "الرجاء ادخال رقم الجوال";
                                      }
                                      return null;
                                    }
                                ):const SizedBox(),

                                distanceBetween,

                                defualtTextField(
                                    hinText: isEnglish?"Job Title":" عنوان الوظيفة ",
                                    icon: Icons.title,
                                    inputType: TextInputType.text,
                                    myController: jobTitle,

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return isEnglish?"Job Title can't be empty"
                                            : "الرجاء ادخال عنوان الوظيفة";
                                      }
                                      return null;
                                    }


                                ),

                                distanceBetween,

                                DropdownButtonFormField(
                                  value: _defualtDegree ,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hint: Text(

                                    isEnglish?'Choose Degree':" اختر درجة الوظيفة  ",
                                    style:TextStyle(
                                      color: Colors.black,
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



                                  items:listAcademicDegree
                                      .map((String val) {
                                    return DropdownMenuItem(
                                        value: val,

                                        onTap: (){
                                          setState((){
                                            _defualtDegree=val;
                                            print(_defualtDegree);
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
                                distanceBetween,

                                DropdownButtonFormField(
                                  value: _selectedValue,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hint: Text(

                                    isEnglish?'Experience level':"اختر مستوى الخبرة",
                                    style:TextStyle(
                                      color: Colors.black,
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



                                  items:listExperience
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
                                widget.isJob? distanceBetween:const SizedBox(),

                                widget.isJob?defualtTextField(
                                  hinText:isEnglish ?"Salary Like consider after interview or(200\$\")":" الراتب:-  (هذا الخيار اختياري)",
                                  icon: Icons.attach_money,
                                  myController: salary,
                                  inputType: TextInputType.number,
                                ):const SizedBox(),
                                widget.isJob? distanceBetween:const SizedBox(),
                                widget.isJob?defualtTextField(
                                  inputType: TextInputType.values[0],
                                  hinText: isEngish?"Working Hour":"ساعات الدوام",
                                  errorText: emptyWorkingHour,
                                  icon: Icons.work,
                                  myController: workingHour,
                                ):const SizedBox(height: 0,),

                                distanceBetween,

                                defualtTextField(
                                  inputType: TextInputType.values[0],
                                  hinText: isEnglish?"E-mail":"البريد الالكتروني",
                                  icon: Icons.email,
                                  myController: email,
                                  errorText: emptyEmail,
                                ),
                                distanceBetween,

                                defualtTextField(
                                    hinText: widget.isJob?isEnglish?"Additional information about the advertisment ":"لاضافة مزيد من التقاصيل حول الاعلان":isEnglish?"Additional information about the job seeker":"لاضافة مزيد من المعلومات عن المتقدم",
                                    icon: Icons.add,
                                    myController: AddtionalInformationAboutJob,
                                    numberOfline: 6),

                                distanceBetween,


                              ],
                            )),








                        isSave?
                        Center(
                          child: CircularProgressIndicator(
                            color: color,
                          ),
                        ):SizedBox(),

                        SizedBox(
                          width: double.infinity,
                          child: defualtElevatedButton(
                              title: 'SAVE',
                              function: () async{

                                if (formKey.currentState!.validate()) {
                                  if(_selectedValue!=null||_defualtDegree!=null){
                                    setState((){
                                      isSave=true;
                                      print(widget.isJob);
                                    });}

                                  JobProvider _newJobProvider=JobProvider();
                                  Job _job=Job(
                                      offerName:adTitle.text,
                                      images_main:imgFile!=null?imgFile!.path.toString():null,
                                      PhoneNumber:phoneNumber.text,
                                      jobAdvert: AppData.UserAccountData!.Full_Name!,
                                      jobTitle:jobTitle.text,
                                      jobDegree:_defualtDegree,
                                      email:email.text,
                                      experienceLevel:defualtExperience,
                                      workHour: workingHour.text,
                                      salary:salary.text,
                                      Detial_AR:AddtionalInformationAboutJob.text,
                                      isAdvertisement:widget.isJob,
                                      isOffer:widget.isJob?false:true,
                                      hospital: widget.hospital!=null?widget.hospital:null

                                  );

                                  Job? _Job1=await  _newJobProvider.addNewJob(_job);

                                  print(_Job1!.id);
                                  if(_Job1!=null&&_Job1!.id!=null){
                                    setState((){
                                      isSave=false;
                                    });
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

                                              height:isEngish? MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/2.8,

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
                                                    child: Text(isEngish? ''' Will try to add information to application as soon as possible after validation process of them. and Thanks'''
                                                        : ''' سوف نحاول قدر الامكان اضافة المعلومات في التطبيق في أقرب وقت  وشكراً''',style: TextStyle(fontSize:isEngish? 14:18,fontWeight: isEngish?FontWeight.w500:FontWeight.w700),textAlign: TextAlign.center,),
                                                  ),


                                                  const SizedBox(width: 29,),
                                                  Center(
                                                    child: defualtElevatedButton(
                                                      title: isEngish? "Agree": " موافق ",
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

                                        });}
                                }
                                // });


                              },
                              border: 8
                            //Color.fromRGBO(138, 215, 228, 0.7)
                          ),
                        ),
                        const SizedBox(height: 30),
                        // SizedBox(height: 20,),
                        // Card(
                        // elevation:1,
                        // child: Container(
                        // padding: EdgeInsets.all(5),
                        // decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8),
                        // border: Border.all(
                        // color: Colors.grey.withOpacity(0.4)
                        // )
                        //
                        // ),
                        // )
                        //
                        // )
                      ],
                    ),
                  ),
                ))),
      );
  }
}
