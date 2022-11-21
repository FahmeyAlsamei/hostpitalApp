import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/api/api_hospital.dart';
import 'package:project/config/data.dart';
import 'package:project/layout/display_hospital/display_one_hospital.dart';
import 'package:project/layout/home/home_screen.dart';
import 'package:project/models/language.dart';
import 'package:project/models/worktime.dart';
import 'package:project/modules/display_pharmacy/display_one_pharmacy.dart';
import 'package:project/modules/login/login.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/modules/users/table_activ_time.dart';
import 'package:project/modules/work_time/work_time.dart';
import 'package:project/shared/network/local/data_time.dart';
import 'package:project/modules/users/hospital_model.dart';
import '../../shared/component/components.dart';
import 'dart:io';

import '../users/activ_time.dart';

class HospitalInfo extends StatefulWidget {
  static const routeName = '/HospitalInfo';
  bool isHospital;
  bool modifyButtonPressed;
  bool isClinic;
  bool isPharmacy;
  bool isLabortory;
  bool isRediation;
  ActivTime ? worktime;
  Hospital? hospital;

  HospitalInfo(
      {this.isHospital = true,
        this.isClinic = false,
        this.isPharmacy = false,
        this.worktime,
        this.isLabortory = false,
        this.isRediation = false,
        this.modifyButtonPressed=false,
        this.hospital

      });

  @override
  State<HospitalInfo> createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  final keyform = GlobalKey<FormState>();

  TextEditingController product_Name = new TextEditingController();
  TextEditingController product_Phone1 = new TextEditingController();
  TextEditingController product_Phone2 = new TextEditingController();
  TextEditingController product_Address = new TextEditingController();
  TextEditingController product_Addtional_Information =
  new TextEditingController();

  bool isEngish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  TapGestureRecognizer _isWorkTime = new TapGestureRecognizer();
  bool? isFrontImage;
  File? backImgFile;
  File? frontImgFile;
  final imgPicker = ImagePicker();

  bool isSave=false;






  Future<void> showOptionsDialog({required BuildContext context, required bool isFrontImage}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), side: const BorderSide()),
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
                          openCamera(isFrontImage);
                        },
                        label: Text(isEngish?'Image From Camera':"الـصـوره من الكاميره",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: isEngish? 2:0,
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
                  Container(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openGallery(isFrontImage);
                        },
                        label: Text(isEngish?'Image From Gallery':"الـصـوره من الـمـعـرض",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing:isEngish? 2:0,
                                color: Colors.black)),
                        icon:const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary:const Color.fromRGBO(119, 205, 188, 1),
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
  void openCamera(bool isFrontImage) async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera != null) {
        if(isFrontImage){
          frontImgFile = File(imgCamera.path);
        }
        else
          backImgFile = File(imgCamera.path);
      }
    });
    Navigator.of(context).pop();
  }

  void openGallery(bool isFrontImage) async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery != null)
      {
        if(isFrontImage)frontImgFile = File(imgGallery.path);
        else   backImgFile = File(imgGallery.path);
      }
    });
    Navigator.of(context).pop();
  }

  @override
  initState() {

    super.initState();
    if(widget.modifyButtonPressed==true && widget.hospital!=null){
      product_Name.text=widget.hospital!.Name!;
      product_Phone1.text=widget.hospital!.Phone_Number!;
          product_Phone2.text=widget.hospital!.Phone_Number_tow!;
          product_Address.text=widget.hospital!.location_Name!;
          product_Addtional_Information.text=widget.hospital!.Detial_AR!;
          widget.worktime=widget.hospital!.Activ_Time!;
          //frontImgFile=File(imgPicker.getImage(source: widget.hospital!.images_main!));


    }

    if (widget.worktime == null) {
      widget.worktime = ActivTime (
        id: 1,
      );

      if(widget.worktime!.Table_Activ_Time==null){
        this.widget.worktime!.Table_Activ_Time=TableActivTime(
            id: 1,
            Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"
        );
      }
    }
    _isWorkTime = new TapGestureRecognizer()
      ..onTap = () async {
        print("onTap");
        widget.worktime = await Navigator.push(
          context,
          // Create the SelectionScreen in the next step.
          MaterialPageRoute(builder: (context) =>  WorkTime(time: widget.worktime,)),
        );
        print("widget.worktime");
        setState(() {
          widget.worktime= widget.worktime;
        });


        // =  await  Navigator.pushNamed(context,WorkTime.routeName);
      };


  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    // if (widget.worktime == null) {
    //   widget.worktime = ActivTime (
    //     id: 1,
    //   );
    // }
    if (widget.worktime == null) {
      widget.worktime = ActivTime (
        id: 1,
      );

      if(widget.worktime!.Table_Activ_Time==null){
        this.widget.worktime!.Table_Activ_Time=TableActivTime(
            id: 1,
            Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"


        );
        print(widget.worktime!.Table_Activ_Time!.Tables_Type_Activ_From);
      }
    }
    return
      AppData.UserAccountData!=null&&
          AppData.UserAccountData!.id!=null&&
          AppData.UserAccountData!.id!=0?
      Directionality(
        textDirection: isEngish?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
          //backgroundColor: Color.fromRGBO(244,245, 250, 1),

            body: Container(
                decoration: defualtBoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3.4,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: Colors.white, width: 3),
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      color: Color.fromRGBO(119, 205, 188, 1),
                                    )
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,

                                      image: (backImgFile != null)
                                          ? FileImage(backImgFile!, scale: 1)
                                      as ImageProvider
                                          : const AssetImage('images/hospital3.jpg'))),

                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child:  Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 3, color: Colors.white),
                                      color: Theme.of(context).primaryColor
                                  ),
                                  child:  IconButton(
                                    hoverColor:
                                    const Color.fromRGBO(138, 215, 228, 1),
                                    icon:const  Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      showOptionsDialog(context: context,isFrontImage: false);
                                    },
                                  )
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    Container(
                                        width: 120,
                                        height: 120,
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
                                                image: (frontImgFile != null)
                                                    ? FileImage(frontImgFile!, scale: 1)
                                                as ImageProvider
                                                    : const AssetImage('images/hospital3.jpg')))

                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 3, color: Colors.white),
                                                color: Theme.of(context).primaryColor
                                            ),
                                            child:  IconButton(
                                              hoverColor:
                                              const Color.fromRGBO(138, 215, 228, 1),
                                              icon:const  Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                showOptionsDialog(context: context,isFrontImage: true);
                                              },
                                            )
                                        )),
                                  ],
                                )),
                            // Align(
                            //     alignment: Alignment.bottomLeft,
                            //     child: Container(
                            //         padding: const EdgeInsets.only(
                            //           top: 15,
                            //           bottom: 8,
                            //           left: 25
                            //         ),
                            //         height: (MediaQuery.of(context).size.height / 3) -
                            //             (MediaQuery.of(context).size.height / 4),
                            //         child:IconButton(
                            //           color: Colors.pinkAccent,
                            //           onPressed: (){
                            //             setState((){
                            //               is_favorite =!is_favorite;
                            //             });
                            //           },
                            //
                            //           icon: Icon(is_favorite?Icons.favorite_border_outlined:Icons.favorite_outlined,size: 45,color:Theme.of(context).primaryColor,),
                            //
                            //         ) )),


                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Form(
                          key: keyform,
                          child: Column(
                            children: [
                              defualtTextField(
                                  hinText: widget.isClinic
                                      ? isEngish?"clinic Name":"أســم الـعـيـادة"
                                      : widget.isPharmacy
                                      ? isEngish?"Pharmacy Name":"أسـم الـصـيـدلـيـة"
                                      : widget.isLabortory
                                      ? isEngish?"Laboratory Name":"أسـم الـمـخـتبـر "
                                      : widget.isRediation
                                      ? isEngish? "Radiation Name":"أسـم الأشـعـة"
                                      : isEngish? "Hospital Name":" أسـم المـسـتـشـفـي",
                                  icon: Icons.apartment_outlined,
                                  myController: product_Name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Name can't be empty":"الأسـم لايمكن أن يـظل فارغ";
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Phone Number 1":"رقـم الـتـلـفـون (المحمول) ",
                                  icon: Icons.phone,
                                  myController: product_Phone1,
                                  inputType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Phone Number can't be empty":"رقـم الـتـلـفـون الايمكن ان يـظـل فـارغاَ";
                                    }
                                    else if( product_Phone1.text.length<9){
                                      return isEngish?"Phone Number can't be less than 9 number":"يـجـب أن يــكون الرقـم من 9 أرقام";
                                    }
                                    else if( !product_Phone1.text.startsWith('7')){
                                      return isEngish?"Phone Number must start by 7 ":"يـجـب أن يـبـداء الـرقـم ب 7";
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Phone Number 2":"رقـــم الـتـلـفون(الثـابـت)",
                                  icon: Icons.phone_rounded,
                                  myController: product_Phone2,
                                  inputType: TextInputType.number),
                              const SizedBox(
                                height: 15,
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Addresses":"الـعـنوان",
                                  icon: Icons.location_on_rounded,
                                  myController: product_Address,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Address can't be empty":"الـعـنوان لايمكن ان يـظل فـارغ";
                                    }
                                    return null;
                                  }),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),

                      //TODO:Time work here

                      Card(
                        elevation: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.4))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      isEngish? 'Work Time':"أوقـات الــدوام",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),

                                    widget.worktime!.Table_Activ_Time!=null?
                                    // widget.worktime!.Table_Activ_Time.Tables_Type_Activ_From == 1
                                    //     ? Text("")
                                    //     : widget.worktime!.choosenValue == 2
                                    //         ? Text("Always Open")
                                    //         : widget.worktime!.choosenValue == 3
                                    //             ? Text("Paramenent Closed")
                                    //             : Text("Always Close"),
                                    Text(  widget.worktime!.Table_Activ_Time!.Tables_Type_Activ_From!)

                                        :Container(),

                                    RichText(
                                        text: TextSpan(
                                            text: isEngish?'Modify':"تــعـديل",
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    119, 205, 188, 1),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                decoration:
                                                TextDecoration.underline),
                                            recognizer: _isWorkTime))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                displayDataTimeInInputScreen(worktime: widget.worktime,
                                    isEngish: isEngish)
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //TODO:Who we are
                      defualtTextField(
                          hinText: isEngish?"How We Are As Hospital ":"  مـن نحن ",

                          icon: Icons.add,
                          myController: product_Addtional_Information,
                          numberOfline: 6),
                      const SizedBox(
                        height: 30,
                      ), isSave?
                      CircularProgressIndicator(

                        color: color,
                      ):
                      SizedBox(
                        width: double.infinity,
                        child: defualtElevatedButton(
                            title: isEngish?'SAVE':"حـــفـظ",
                            function: () async {
                              if (keyform.currentState!.validate()) {

                                setState((){
                                  isSave=true;
                                });

                                HospitalApiProvider  _hospital_api=  HospitalApiProvider();
                                Hospital _hospital=Hospital(
                                  is_clinic: widget.isClinic,
                                  is_farmacy: widget.isPharmacy,
                                  is_laboratry: widget.isLabortory,
                                  is_radiation: widget.isRediation,
                                  longitude: 0.0000,
                                  latitude: 0.0000,
                                  category: [],
                                  // id: [],

                                  is_hospital: widget.isHospital,
                                  created_by: AppData.UserAccountData,



                                  Name: product_Name.text,
                                  Phone_Number: product_Phone1.text,
                                  Phone_Number_tow:product_Phone2.text,

                                  location_Name:product_Address.text,
                                  Detial_AR:product_Addtional_Information.text,
                                  images_main:frontImgFile!=null?frontImgFile!.path.toString():null,
                                  images_back: backImgFile!=null?backImgFile!.path.toString():null,


                                  Activ_Time:widget.worktime,



                                ) ;

                                Hospital ?_hospitalNew= await _hospital_api.addHospital(_hospital);
                                // print(_hospitalNew!.Name);
                                if(_hospitalNew!=null&&_hospitalNew.id!=null){
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
                                                      : ''' سوف نحاول قدر الامكان اضافة المعلومات في التطبيق في أقرب وقت ممكن بعد التحقق منها وشكراً''',style: TextStyle(fontSize:isEngish? 14:18,fontWeight: isEngish?FontWeight.w500:FontWeight.w700),textAlign: TextAlign.center,),
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

                                      });

                                  //
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) =>
                                  //     widget.isClinic
                                  //         ? DisplayOnePharmacy(_hospitalNew,is_clinic: true,)
                                  //         : widget.isPharmacy
                                  //         ? DisplayOnePharmacy(_hospitalNew,)
                                  //         : widget.isLabortory
                                  //         ? DisplayOnePharmacy(_hospitalNew,is_laboratory: true,)
                                  //         : widget.isRediation
                                  //         ? DisplayOnePharmacy(_hospitalNew,is_radiation: true,)
                                  //     // : widget.isPrssedBloodVolunteertButton
                                  //     // ? DisplayOnePharmacy(_hospitalNew,is_volunteer: true,)
                                  //         : DisplayOneHospital(_hospitalNew,)));

                                  print(_hospitalNew.is_hospital);

// snackBar.
                                }
                                else if(_hospitalNew!=null||_hospitalNew!.id==null){
                                  print("_hospitalNew 1");

                                  final snackBar = SnackBar(
                                    content: const Text('فشل عملبة الحفظ الرجاء المحاولة مرة أخرى',),
                                    action: SnackBarAction(
                                      label: 'فشل عملبة الحفظ',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );

                                  // snackBar.
                                }
                                else{
                                  print("_hospitalNew 1");

                                  final snackBar = SnackBar(
                                    content: const Text('فشل عملبة الحفظ الرجاء المحاولة مرة أخرى',),
                                    action: SnackBarAction(
                                      label: 'فشل عملبة الحفظ',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                }


                                // HospitalApiProvider.addHospital()


                                // Navigator.of(context).pop();

                              }
                            },
                            border: 8 //Color.fromRGBO(138, 215, 228, 0.7)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))),
      ):

      const LogIn()

    ;
  }
}
