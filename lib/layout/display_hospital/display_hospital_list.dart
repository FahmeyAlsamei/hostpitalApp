import 'package:flutter/material.dart';
import 'package:project/api/api_blood.dart';
import 'package:project/api/api_job.dart';
import 'package:project/config/data.dart';
import 'package:project/modules/display_blood/display_blood.dart';
import 'package:project/modules/display_jobs/display_job.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import '../../api/api_doctor.dart';
import '../../api/api_hospital.dart';
import '../../models/language.dart';
import '../../shared/component/components.dart';
import '../../modules/display_pharmacy/display_one_pharmacy.dart';

import '../display_one_dector/display_one_dectors.dart';
import 'animtion.dart';
import 'display_one_hospital.dart';

class DisplayHospitalList extends StatefulWidget {
  static const routeName = '/DisplayHospital';

  bool isPrssedCilnicButton;
  bool isPrssedPharmacyButton;
  bool isPrssedLaboratryButton;
  bool isPrssedRadiationButton;
  bool isPrssedBloodVolunteertButton;
  bool isPrssedDoctorButton;
  bool isPrssedDepartmentButton;
  bool isPressedJobButton;
  DisplayHospitalList({
    this.isPrssedCilnicButton = false,
    this.isPrssedPharmacyButton = false,
    this.isPrssedLaboratryButton = false,
    this.isPrssedRadiationButton = false,
    this.isPrssedDepartmentButton = false,
    this.isPrssedBloodVolunteertButton = false,
    this.isPrssedDoctorButton = false,
    this.isPressedJobButton=false,
  });

  @override
  State<DisplayHospitalList> createState() => _DisplayHospitalListState();
}

class _DisplayHospitalListState extends State<DisplayHospitalList> {
  bool isSelected = false;
  TextStyle? style =
      const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle? style1 = TextStyle(
    color: Colors.black.withOpacity(0.7),
    fontWeight: FontWeight.w300,
  );
  int userEnter1 = 2;
  int userEnter2 = 1;
  int userEnter3 = 4;
  DoctorsProvider _doctorsProvider = new DoctorsProvider();

  HospitalApiProvider _hospitalApiProvider = new HospitalApiProvider();
  BloodProvider _bloodProvider=BloodProvider();
  JobProvider  _jobProvider=JobProvider();
  @override
  void dispose() {
    // AppData.MyHospital=[];
    // TODO: implement dispose
    super.dispose();
    // AppData.MyHospital=[];
  }

  @override
  void initState() {
    super.initState();
    var set = <int>{};
    AppData.MyHospital = AppData.MyHospital.where((e) => set.add(e.id!)).toList();
  }
  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.isPrssedDoctorButton
                ? isEnglish?"DOCTORS LIST":"الأطــبــاء"
                : widget.isPrssedCilnicButton
                    ? isEnglish?"CLINICS LIST":"الــعـيــادات"
                    : widget.isPrssedPharmacyButton
                        ? isEnglish?"PHARMACIES LIST":"الصيدليات"
                        : widget.isPrssedLaboratryButton
                            ? isEnglish?"LABORATORIES LIST":"الــمـخـتـبـرات"
                            : widget.isPrssedRadiationButton
                                ? isEnglish?"RADIATIONS LIST":"الأشــعــات"
                                : widget.isPrssedBloodVolunteertButton
                                    ? isEnglish?"Blood Volunteers List":"الـمـتـبرعـيـن بالـدام"
                                    : widget.isPrssedDepartmentButton
                                        ? isEnglish?"DEPARTMENTS List":"الأقــســأم"
                                        :widget.isPressedJobButton? isEnglish?"Jobs List ":"الوظائف":isEnglish?"HOSPITALS LIST":"الـمـسـتـشـفـيـات",textAlign: TextAlign.center,),
          ),
          body: widget.isPrssedDoctorButton
              ? Container(
                  decoration: defualtBoxDecoration(),
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: FutureBuilder(
                          future: _doctorsProvider.fetchAllDoctors(),
                          builder: (_, snapshot) {
                            // Displaying LoadingSpinner to indicate waiting state
                            // print(snapshot.data);
                            // if(snapshot.hasData)
                            // AppData.MyHospital=snapshot.data as  List<Hospital>;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: const Color.fromRGBO(78,162,152,1),
                                ),
                              );
                            } else if (snapshot.stackTrace!=null
                            ) {
                              return  AnimationForImageInDisplayList(path: 'images/doctorrr.png',);
                            }else {
                              return ListView.builder(
                                itemCount: AppData.ListDoctror.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (index == 0)
                                        const SizedBox(
                                          height: 40,
                                        ),
                                      if (index == 0)
                                        AnimationForImageInDisplayList(path: 'images/doctor33.png',),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        elevation: 10,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  userEnter1++;
                                                });
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DisplayOneDoctors(
                                                              AppData.ListDoctror[
                                                                  index],
                                                            )));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary: const Color.fromRGBO(
                                                      240, 239, 241, 1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                  )),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Row(children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color.fromRGBO(78,162,152,.8),
                                                              width: 3),
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AppData.ListDoctror[index].images_main !=
                                                                          null &&
                                                                      AppData
                                                                          .ListDoctror[
                                                                              index]
                                                                          .images_main!
                                                                          .isNotEmpty
                                                                  ? NetworkImage(AppData.ListDoctror[index].images_main!)
                                                                      as ImageProvider
                                                                  : const AssetImage(
                                                                      'images/hospital3.jpg'))),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 18,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      AppData.ListDoctror[index]
                                                          .Name!,
                                                      style: style,
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      Icon(
                                                        Icons.visibility,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                      ),
                                                      Text(
                                                        '${AppData.ListDoctror[index].Name!.length + index}',
                                                        style: style1,
                                                      )
                                                    ],
                                                  ))
                                                ]),
                                              ),
                                            )),
                                      ),
                                    const  SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                },
                                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              );
                            }
                          })))

                  :widget.isPrssedBloodVolunteertButton?
          Container(
              decoration: defualtBoxDecoration(),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: FutureBuilder(
                      future: _bloodProvider.fetchAllBlood(),
                      builder: (_, snapshot) {
                        // Displaying LoadingSpinner to indicate waiting state
                        // print(snapshot.data);
                        // if(snapshot.hasData)
                        // AppData.MyHospital=snapshot.data as  List<Hospital>;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color:  Color.fromRGBO(78,162,152,0.8),
                            ),
                          );
                        }else if (snapshot.stackTrace!=null) {
                          return Column(
                            children: [
                              SizedBox(height: 15,),

                              AnimationForImageInDisplayList(path:'images/blood.png'),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                child: Text(isEnglish? ''' Filed to get data please check internet connection..'''
                                    : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',style: TextStyle(fontSize:isEnglish? 14:15,fontWeight: isEnglish?FontWeight.w500:FontWeight.w600),textAlign: TextAlign.center,),
                              ),
                            ],
                          );
                        } else {
                          return ListView.builder(
                            itemCount: AppData.ListBlood.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  if (index == 0)
                               AnimationForImageInDisplayList(path:'images/blood.png'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 7,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              userEnter1++;
                                            });
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DisplayDoner(
                                                          AppData.ListBlood[
                                                          index],
                                                        )));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  240, 239, 241, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              )),
                                          child: Container(
                                            padding:
                                            const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Row(children: [
                                              Expanded(
                                                child: Container(

                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                      border: Border.all(
                                                          color: const  Color.fromRGBO(78,162,152,0.8),
                                                          width: 3),
                                                      shape: BoxShape.circle,
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    foregroundColor:Colors.white ,
                                                    backgroundColor:Colors.white ,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8.0),
                                                      child:AppData.ListBlood[index]!=null&& AppData.ListBlood[index].blood_Type!=null?Text(AppData.ListBlood[index].blood_Type!,
                                                        style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold,color: Colors.red),textDirection:TextDirection.ltr ,)
                                                      :SizedBox(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  AppData.ListBlood[index]
                                                      .Name!,
                                                  style: style,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                ],
                              );
                            },
                            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          );
                        }
                      })))



              :widget.isPressedJobButton?
           Container(
              decoration: defualtBoxDecoration(),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: FutureBuilder(
                      future:_jobProvider.fetchAllJob() ,
                      builder: (_, snapshot) {
                        // Displaying LoadingSpinner to indicate waiting state
                        // print(snapshot.data);
                        // if(snapshot.hasData)
                        // AppData.MyHospital=snapshot.data as  List<Hospital>;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color:  Color.fromRGBO(78,162,152,0.8),
                            ),
                          );
                        } else if (snapshot.stackTrace!=null) {
                          return Column(
                            children: [
                              SizedBox(height: 15,),

                              AnimationForImageInDisplayList(path:'images/nurses.png'),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                child: Text(isEnglish? ''' Filed to get data please check internet connection..'''
                                    : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',style: TextStyle(fontSize:isEnglish? 14:15,fontWeight: isEnglish?FontWeight.w500:FontWeight.w600),textAlign: TextAlign.center,),
                              ),
                            ],
                          );
                        }else {
                          return ListView.builder(
                            itemCount: AppData.ListJob.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  if (index == 0)
                               AnimationForImageInDisplayList(path:'images/nurses.png' ,),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 10,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              userEnter1++;
                                            });
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DisplayJob(
                                                          AppData.ListJob[
                                                          index]!=null?
                                                          AppData.ListJob[
                                                          index]:null,
                                                        )));

                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary:const Color.fromRGBO(
                                                  240, 239, 241, 1),
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              )),
                                          child: Container(
                                            padding: const EdgeInsets
                                                .symmetric(
                                              vertical: 10,
                                            ),
                                            child: Row(children: [
                                              Expanded(
                                                child: Container(
                                                  padding:const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10),
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:const Color.fromRGBO(78,162,152,0.8),
                                                          width: 3),
                                                      shape:
                                                      BoxShape.circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit
                                                              .cover,
                                                          image: AppData.ListJob[index].images_main !=
                                                              null &&
                                                              AppData
                                                                  .ListJob[index]
                                                                  .images_main!
                                                                  .isNotEmpty
                                                              ? NetworkImage(AppData.ListJob[index].images_main!) as ImageProvider
                                                              : const AssetImage('images/hospital3.jpg'))),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  AppData
                                                      .ListJob[index]
                                                      .offerName!,
                                                  style: style,
                                                ),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      Icon(
                                                        Icons.visibility,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                      ),
                                                      Text(
                                                        '${AppData.ListJob[index].offerName!.length + index}',
                                                        style: style1,
                                                      )
                                                    ],
                                                  ))
                                            ]),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              );
                            },
                            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          );
                        }
                      }))):


          Container(
                      decoration: defualtBoxDecoration(),
                      child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                          child: FutureBuilder(
                              future: _hospitalApiProvider.fetchAllHospital(
                                widget.isPrssedCilnicButton,
                                widget.isPrssedPharmacyButton,
                                widget.isPrssedCilnicButton == false &&
                                        widget.isPrssedPharmacyButton == false &&
                                        widget.isPrssedLaboratryButton == false &&
                                        widget.isPrssedRadiationButton == false
                                    ? true
                                    : false,
                                widget.isPrssedRadiationButton,
                                widget.isPrssedLaboratryButton,
                              ),
                              builder: (_, snapshot) {
                                var set = <int>{};
                                AppData.MyHospital = AppData.MyHospital.where(
                                    (e) => set.add(e.id!)).toList();

                                // Displaying LoadingSpinner to indicate waiting state
                                // print(snapshot.data);
                                // if(snapshot.hasData)
                                // AppData.MyHospital=snapshot.data as  List<Hospital>;
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting &&
                                    AppData.MyHospital.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color:  Color.fromRGBO(78,162,152,0.8),
                                    ),
                                  );
                                } else if (snapshot.stackTrace!=null
                                    ) {
                                  return  Column(
                                    children: [
                                      SizedBox(height: 15,),

                                      AnimationForImageInDisplayList(
                                          path:widget.isPrssedPharmacyButton?'images/pharmacy.png'
                                              : widget.isPrssedCilnicButton?"images/healt.jpg"
                                              :widget.isPrssedLaboratryButton?"images/laboratory.png"
                                              :widget.isPrssedRadiationButton?"images/radia.png"


                                              :'images/hos1.PNG'),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                        child: Text(isEnglish? ''' Filed to get data please check internet connection..'''
                                            : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',style: TextStyle(fontSize:isEnglish? 14:15,fontWeight: isEnglish?FontWeight.w500:FontWeight.w600),textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  );
                                }else {
                                  return ListView.builder(
                                    itemCount: AppData.MyHospital.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          if (index == 0)
                                           const SizedBox(
                                              height: 40,
                                            ),
                                          if (index == 0)
                                            AnimationForImageInDisplayList(
                                              path:widget.isPrssedPharmacyButton?'images/pharmacy.png'
                                                  :widget.isPrssedLaboratryButton?"images/laboratory.png"
                                                  :widget.isPrssedRadiationButton?"images/radia.png"


                                                  :'images/hos1.PNG'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Card(
                                            elevation: 10,
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      userEnter1++;
                                                    });
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => widget.isPrssedCilnicButton
                                                            ? DisplayOnePharmacy(
                                                                AppData.MyHospital[
                                                                    index],
                                                                is_clinic: true,
                                                              )
                                                            : widget.isPrssedPharmacyButton
                                                                ? DisplayOnePharmacy(
                                                                    AppData.MyHospital[
                                                                        index],
                                                                  )
                                                                : widget.isPrssedLaboratryButton
                                                                    ? DisplayOnePharmacy(
                                                                        AppData.MyHospital[
                                                                            index],
                                                                        is_laboratory:
                                                                            true,
                                                                      )
                                                                    : widget.isPrssedRadiationButton
                                                                        ? DisplayOnePharmacy(
                                                                            AppData
                                                                                .MyHospital[index],
                                                                            is_radiation:
                                                                                true,
                                                                          )
                                                                        : widget.isPrssedBloodVolunteertButton
                                                                            ? DisplayDoner(
                                                                               AppData.ListBlood[index]
                                                                              )
                                                                            : DisplayOneHospital(
                                                                                AppData.MyHospital[index],
                                                                              )));

                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary:
                                                          const Color.fromRGBO(
                                                              240, 239, 241, 1),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8),
                                                      )),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                    ),
                                                    child: Row(children: [
                                                      Expanded(
                                                        child: Container(
                                                          padding:const EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10),
                                                          width: 70,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color.fromRGBO(78,162,152,1),
                                                                  width: 3),
                                                              shape:
                                                                  BoxShape.circle,
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AppData.MyHospital[index].images_main != null &&
                                                                          AppData
                                                                              .MyHospital[
                                                                                  index]
                                                                              .images_main!
                                                                              .isNotEmpty
                                                                      ? NetworkImage(AppData.MyHospital[index].images_main!)
                                                                          as ImageProvider
                                                                      : const AssetImage('images/hospital3.jpg'))),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 18,
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          AppData
                                                              .MyHospital[index]
                                                              .Name!,
                                                          style: style,
                                                        ),

                                                      ),
                                                      Expanded(
                                                          child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            height: 25,
                                                          ),
                                                          Icon(
                                                            Icons.visibility,
                                                            color: Colors.black
                                                                .withOpacity(0.6),
                                                          ),
                                                          Text(
                                                            '${AppData.MyHospital[index].Name!.length + index}',
                                                            style: style1,
                                                          )
                                                        ],
                                                      ))
                                                    ]),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      );
                                    },
                                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  );
                                }
                              })))),
    );
  }
}
