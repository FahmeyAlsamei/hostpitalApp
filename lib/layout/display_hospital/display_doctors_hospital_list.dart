// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/layout/display_one_dector/DisplayOneDoctorFromhospital.dart';
import 'package:project/modules/apointment.dart';
import 'package:project/modules/display_blood/display_blood.dart';

import '../../api/api_hospital.dart';
import '../../config/data.dart';
import '../../models/language.dart';
import '../../modules/users/hospital_model.dart';
import '../../shared/component/components.dart';

import 'animtion.dart';

class displayDoctorsInHospitalList extends StatefulWidget {
  static const routeName = '/DisplayHospital';
  Hospital hospital;
  displayDoctorsInHospitalList(this.hospital);  // bool isPrssedCilnicButton;
  // bool isPrssedPharmacyButton;
  // bool isPrssedLaboratryButton;
  // bool isPrssedRadiationButton;
  // bool isPrssedBloodVolunteertButton;
  // bool isPrssedDoctorButton;
  // bool isPrssedDepartmentButton;
  // bool isPressedJobButton;


  @override
  State<displayDoctorsInHospitalList> createState() => _displayDoctorsInHospitalListState();
}

class _displayDoctorsInHospitalListState extends State<displayDoctorsInHospitalList> {
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
  // DoctorsProvider _doctorsProvider = new DoctorsProvider();

  HospitalApiProvider _hospitalApiProvider = new HospitalApiProvider();

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
      child: Directionality(
        textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
        title:

          Text(isEnglish?"Doctors List":"    أطبــاء"+" ${widget.hospital.Name!.substring(0,
              widget.hospital.Name!.length>=20?
              20:widget.hospital.Name!.length)
          }")
            ),
            body:

                Container(

                  child: Column(
                    children:[

                  widget.hospital!.images_back !=null && widget.hospital!.images_back!.isNotEmpty?
                      Padding(
                      padding: const EdgeInsets.all(5.0),
                  child: AnimationForImageInDisplayList(path:widget.hospital!.images_back!),
                ): AnimationForImageInDisplayList(path: 'images/10.JPG',),

                      Expanded(
                        child: ListView(
                          children: [
                              const SizedBox(
                                height: 5,
                              ),

            Container(
              // decoration: defualtBoxDecoration(),
              child:  FutureBuilder(
                          future: _hospitalApiProvider.fetchOneHospital(widget.hospital!.id!),
                          builder: (_, snapshot) {
                            // Displaying LoadingSpinner to indicate waiting state
                            // print(snapshot.data);
                            // if(snapshot.hasData)
                            // AppData.MyHospital=snapshot.data as  List<Hospital>;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting && (widget.hospital!.doctors==null||

                                widget.hospital!.doctors!.isEmpty
                            )) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: const Color.fromRGBO(78,162,152,0.8),
                                ),
                              );


                            }
                            else if (snapshot.connectionState ==
                                ConnectionState.done && (widget.hospital!.doctors==null||

                                widget.hospital!.doctors!.isEmpty
                            )) {
                              return  Center(
                                child:  Text(isEnglish?"There are no hospital Doctors":"لا يوجد أطبــاء للمستشفى"),
                              );
                            }
                            else {
                              // Hospital hospital=snapshot.data as Hospital;

                              // if(hospital!=null&&hospital.doctors!.length>0)
                              // widget.hospital.doctors=hospital.doctors;
                              return ListView.builder(
                                itemCount: widget.hospital.doctors!.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,

                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 1,
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                userEnter1++;
                                              });

                                              widget.hospital!=null&&widget.hospital!.doctors!=null&& widget.hospital!.doctors![index]!=null?

                                              Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context){
                                                  return DisplayOneDoctorFromhospital(widget.hospital!.doctors![index]);
                                                })
                                              ):SizedBox();
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
                                                vertical: 15,
                                              ),
                                              child: Row(children: [
                                                Container(
                                                  padding:const EdgeInsets
                                                      .symmetric(
                                                      vertical: 0),
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:const  Color.fromRGBO(78,162,152,0.8),
                                                          width: 3),
                                                      shape:
                                                      BoxShape.circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit
                                                              .cover,
                                                          image:  widget.hospital.images_main !=
                                                              null &&
                                                              widget.hospital.images_main!
                                                                  .isNotEmpty
                                                              ? NetworkImage(widget.hospital!.images_main!) as ImageProvider
                                                              : const AssetImage('images/hospital3.jpg'))),
                                                ),
                                                const SizedBox(
                                                  width: 36,
                                                ),

                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        widget.hospital!.doctors![index]
                                                            .Name!,
                                                        style: style,
                                                      ),

                                                      defualtElevatedButton(title:isEnglish?'APPOINTMENT NOW':
                                                      "احــجــز الان",
                                                          letterSpacing: isEnglish?2:0,
                                                          function: (){
                                                            // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context)=>ApointmentScrean(
                                                                  doctors: widget.hospital!.doctors![index],
                                                                  hospitals: widget.hospital,


                                                                ))
                                                            );

                                                          },paddingHorizatal: 20,
                                                          paddingVerical: 1,
                                                          border: 8,


                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // Expanded(
                                                //     child: Column(
                                                //       mainAxisSize:
                                                //       MainAxisSize.min,
                                                //       children: [
                                                //         const SizedBox(
                                                //           height: 25,
                                                //         ),
                                                //         Icon(
                                                //           Icons.visibility,
                                                //           color: Colors.black
                                                //               .withOpacity(0.6),
                                                //         ),
                                                //         Text(
                                                //           '(${widget.hospital!.doctors![index].Name!.length + index})',
                                                //           style: style1,
                                                //         )
                                                //       ],
                                                //     ))
                                              ]),
                                            ),
                                          )),
                                    ),

                                  );

                                },
                                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              );
                            }
                          })
            )
                          ],


                        ),
                      ),
                    ],
                  ),
                )

                ),
      ),
    );
  }
}
