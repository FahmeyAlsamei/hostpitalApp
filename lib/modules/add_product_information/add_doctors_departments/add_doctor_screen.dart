// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:project/models/language.dart';
import 'package:project/modules/users/activ_time.dart';
import 'package:project/modules/users/table_activ_time.dart';

import '../../../api/api_doctor.dart';
import '../../../shared/component/components.dart';
import '../../../shared/network/local/data_time.dart';
import '../../users/doctors.dart';
import '../../users/hospital_model.dart';
import '../../users/type_comercial_model.dart';
import '../../work_time/work_time.dart';

class add_doctor extends StatefulWidget {
  ActivTime? worktime;
  Hospital? hospital;
  Category ?category;

  add_doctor({this.worktime, this.hospital,this.category});

  @override
  State<add_doctor> createState() => _add_doctorState();
}

class _add_doctorState extends State<add_doctor> {
  TextEditingController Doctor_Name = TextEditingController();
  TextEditingController Doctor_Degree = TextEditingController();
  TextEditingController Doctor_Major = TextEditingController();
  TextEditingController Work_Address = TextEditingController();
  TextEditingController Addtional_Information_about_dectors =
  TextEditingController();
  final formKey = GlobalKey<FormState>();

  TapGestureRecognizer _isWorkTime = TapGestureRecognizer();
  File? imgFile;
  final imgPicker = ImagePicker();
  Category? categorry_choss;

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide()),
            backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openCamera();
                        },
                        label: const Text('Image From Camera',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                color: Colors.black)),
                        icon: const Icon(
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openGallery();
                        },
                        label: const Text('Image From Gallery',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                color: Colors.black)),
                        icon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(119, 205, 188, 1),
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

  @override
  initState() {
    super.initState();

    if(widget.category !=null)
      categorry_choss=widget.category;
    if (widget.worktime == null) {
      widget.worktime = ActivTime(
        id: 1,
      );

      if (widget.worktime!.Table_Activ_Time == null) {
        widget.worktime!.Table_Activ_Time = TableActivTime(
            id: 1, Tables_Type_Activ_From: "مفتوح حسب ساعات محدود");
      }
    }
    _isWorkTime = TapGestureRecognizer()
      ..onTap = () async {
        print("onTap");
        widget.worktime = await Navigator.push(
          context,
          // Create the SelectionScreen in the next step.
          MaterialPageRoute(
              builder: (context) => WorkTime(
                time: widget.worktime,
              )),
        );
        print("widget.worktime");

        if (!mounted) return;

        setState(() {
          widget.worktime = widget.worktime;
          print(widget.worktime);
        });
        // =  await  Navigator.pushNamed(context,WorkTime.routeName);
      };
  }

  bool isEnglish = Language.getData(key: "isDark") != null &&
      Language.getData(key: "isDark")!
      ? true
      : false;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Directionality(
      textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: Color.fromRGBO(244,245, 250, 1),

          body: Container(
            decoration: defualtBoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: color, borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  isEnglish
                                      ? Icons.arrow_back_ios_new_outlined
                                      : Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                                isEnglish
                                    ? "DOCTOR INFORMATION"
                                    : "مـعلـومـات الـدكـتـور",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20)),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
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
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  color: color,
                                )
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: (imgFile != null)
                                      ? FileImage(imgFile!, scale: 1)
                                  as ImageProvider
                                      : const AssetImage('images/fahmey.jpg'))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 4,
                                      color:
                                      const Color.fromRGBO(235, 236, 243, 1)),
                                  color: color,
                                ),
                                child: IconButton(
                                  hoverColor:
                                  const Color.fromRGBO(138, 215, 228, 1),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: defualtBoxDecoration1(),
                    child: DropdownButtonFormField(
                      value: categorry_choss,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: Text(
                        isEnglish ?'Choose Department':"اختر القسـم",
                        style: TextStyle(
                          color:categorry_choss==null?Colors.red:Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          categorry_choss = value as Category?;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          categorry_choss = value as Category?;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down_circle),
                      iconDisabledColor: Colors.red,
                      iconEnabledColor: const Color.fromRGBO(119, 205, 188, 1),
                      isExpanded: true,
                      decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          // errorText: err,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                              color: const Color.fromRGBO(78,162,152,0.8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.4),
                              )),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5)),
                      items: widget.hospital!.category!
                          .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            "${e.Name!}",
                          )))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [

                          defualtTextField(
                              hinText: isEnglish ? "Doctor Name " : "أسـم الـدكـتـور",
                              myController: Doctor_Name,
                              icon: Icons.person_outline,
                              validator: (value){
                                if(value!.isEmpty){
                                  return isEnglish?"Doctor name can't be empty":"أسـم الـدكتـوران يظل فارغ" ;
                                }

                              }
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defualtTextField(
                              icon: Icons.data_exploration_outlined,
                              hinText: isEnglish ? "Doctor Degree" : "الـدرجـة الـعـلـمية",
                              myController: Doctor_Degree,
                              validator: (value){
                                if(value!.isEmpty){
                                  return isEnglish?"Doctor degree can't be empty":"الـدرجة الـعلـمية ان يظل فارغ";
                                }}

                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defualtTextField(
                              hinText:
                              isEnglish ? "Doctor Specialized" : "تـخـصـص الـدكـتـور",
                              myController: Doctor_Major,
                              validator: (value){
                                if(value!.isEmpty){
                                  return isEnglish?"Doctor  Specialized can't be empty":"تـخـصـص الـدكـتـور ان يظل فارغ";
                                }},
                              icon: Icons.manage_search_sharp
                          ),
                        ],

                      )),

                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.withOpacity(0.6))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isEnglish ? 'Work Time' : "اوقـات الـدوام",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              if (widget.worktime!.Table_Activ_Time != null)
                                Text(widget.worktime!.Table_Activ_Time!
                                    .Tables_Type_Activ_From!)
                              else
                                Container(),
                              RichText(
                                  text: TextSpan(
                                      text: isEnglish ? 'Modify' : "تـعـديل",
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),
                                      recognizer: _isWorkTime))
                            ],
                          ),
                          widget.worktime!=null?
                          displayDataTimeInInputScreen(
                              worktime: widget.worktime, isEngish: isEnglish):SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defualtTextField(
                      hinText: isEnglish
                          ? "More Information About Doctor as experience and study space "
                          : "مـزيد من المـلـومـات عن الـدكـتـور مثلا خبرة الدكتور ومجال تخصص ",
                      myController: Addtional_Information_about_dectors,
                      numberOfline: 6,
                      icon: Icons.add),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: defualtElevatedButton(
                        title: isEnglish ? 'SAVE' : "حفظ",
                        function: () async {
                          // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                          // Navigator.of(context).pop();
                          // Navigator.of(context).pop();

                          String? path;
                          if (imgFile != null && imgFile!.path != null) {
                            path = imgFile!.path;
                          } else {
                            path = widget.hospital!.images_main;
                          }
                          DoctorsProvider _doctors_api = DoctorsProvider();
                          Doctors _hospital = Doctors(
                            hospital: widget.hospital,

                            category: categorry_choss,
                            specialization: Doctor_Major.text,
                            // is_laboratry: widget.isLabortory,
                            // is_radiation: widget.isRediation,
                            // longitude: 0.0000,
                            // latitude: 0.0000,
                            // category: ,
                            // id: [],

                            // is_hospital: widget.isHospital,
                            // created_by: AppData.UserAccountData,

                            Name: Doctor_Name.text,
                            degree: Doctor_Degree.text,

                            // id: ,

                            // location_Name:product_Address.text,
                            Detial_AR: Addtional_Information_about_dectors.text,
                            images_main:
                            imgFile != null ? imgFile!.path.toString() : null,

                            activTime: widget.worktime,
                          );


                          // print(_DoctorsNew!.Name);
                          if(formKey.currentState!.validate()&& categorry_choss !=null){
                            Navigator.of(context).pop();
                            Doctors? _DoctorsNew =
                            await _doctors_api.addDoctors(_hospital);
                            if (_DoctorsNew != null && _DoctorsNew.id != null) {
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
                          //  else if (_DoctorsNew != null && _DoctorsNew!.id == null) {
                          //     print("_hospitalNew 1");
                          //
                          //     final snackBar = SnackBar(
                          //       content: const Text(
                          //         'فشل عملبة الحفظ الرجاء المحاولة مرة أخرى',
                          //       ),
                          //       action: SnackBarAction(
                          //         label: 'فشل عملبة الحفظ',
                          //         onPressed: () {
                          //           // Some code to undo the change.
                          //         },
                          //       ),
                          //     );
                          //
                          //     // snackBar.
                          //   } else {
                          //     print("_hospitalNew 1");
                          //
                          //     final snackBar = SnackBar(
                          //       content: const Text(
                          //         'فشل عملبة الحفظ الرجاء المحاولة مرة أخرى',
                          //       ),
                          //       action: SnackBarAction(
                          //         label: 'فشل عملبة الحفظ',
                          //         onPressed: () {
                          //           // Some code to undo the change.
                          //         },
                          //       ),
                          //     );
                          //   }
                          //
                          //   // DoctorsProvider.addHospital()
                          //
                          //   // Navigator.of(context).pop();
                        },
                        border: 8
                      //Color.fromRGBO(138, 215, 228, 0.7)
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
