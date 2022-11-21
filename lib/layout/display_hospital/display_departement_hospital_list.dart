import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:project/config/data.dart';
import 'package:project/modules/apointment.dart';
import '../../api/api_doctor.dart';
import '../../api/api_hospital.dart';
import '../../models/language.dart';
import '../../modules/users/hospital_model.dart';
import '../../modules/users/type_comercial_model.dart';
import '../../shared/component/components.dart';
import '../../modules/display_pharmacy/display_one_pharmacy.dart';

import '../display_one_dector/display_one_dectors.dart';
import 'animtion.dart';
import 'display_one_hospital.dart';

class displayDepartementHospitalList extends StatefulWidget {
  static const routeName = '/DisplayHospital';
  Hospital hospital;
  displayDepartementHospitalList(this.hospital);  // bool isPrssedCilnicButton;
  // bool isPrssedPharmacyButton;
  // bool isPrssedLaboratryButton;
  // bool isPrssedRadiationButton;
  // bool isPrssedBloodVolunteertButton;
  // bool isPrssedDoctorButton;
  // bool isPrssedDepartmentButton;
  // bool isPressedJobButton;


  @override
  State<displayDepartementHospitalList> createState() => _displayDepartementHospitalListState();
}

class _displayDepartementHospitalListState extends State<displayDepartementHospitalList> {
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

                Text(isEnglish?"DEPARTMENTS List":"   أقــســام"+" ${widget.hospital.Name!.substring(0,
                    widget.hospital.Name!.length>=20?
                    20:widget.hospital.Name!.length)}")
            ),
            body:

            Container(
              child: Column(
                children: [
                  widget.hospital!.images_back !=null && widget.hospital!.images_back!.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AnimationForImageInDisplayList(path:widget.hospital!.images_back!),
                  ): AnimationForImageInDisplayList(path: 'images/10.JPG',),

                  Expanded(
                    child: ListView(
                      children: [
                        // const SizedBox(
                        //   height: 40,
                        // ),

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
                                      ConnectionState.waiting && (widget.hospital!.category==null||

                                      widget.hospital!.category!.isEmpty
                                  )) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );


                                  }
                                  else if (snapshot.connectionState ==
                                      ConnectionState.done && (widget.hospital!.category==null||

                                      widget.hospital!.category!.isEmpty
                                  )) {
                                    return  Center(
                                      child:  Text(isEnglish?"There are no hospital departments":"لا يوجد أقــســام للمستشفى"),
                                    );
                                  }
                                  else {
                                    // Hospital hospital=snapshot.data as Hospital;

                                    // if(hospital!=null&&hospital.category!.length>0)
                                    // widget.hospital.category=hospital.category;
                                    return ListView.builder(
                                      itemCount: widget.hospital.category!.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width,

                                          child: Card(
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
                                                      vertical: 15,horizontal: 2
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
                                                                color:const Color.fromRGBO(78,162,152,0.8),
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
                                                        width: 20,
                                                      ),

                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.hospital!.category![index].Name!,
                                                          style: style,
                                                        ),
                                                      ),


                                                      Expanded(
                                                        flex: 3,
                                                        child: defualtElevatedButton(title:isEnglish?'APPOINTMENT NOW':
                                                        "احــجــز الان",
                                                            function: (){
                                                              // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(builder: (context)=>ApointmentScrean(
                                                                    hospitals:widget.hospital!,
                                                                    category: widget.hospital!.category![index],
                                                                  ))
                                                              );

                                                            },paddingHorizatal: 20,
                                                             paddingVerical: 0,
                                                            border: 8,
                                                       letterSpacing: isEnglish?2:0

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
                                                      //           '(${widget.hospital!.category![index].Name!.length + index})',
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
      )
    );
  }
}
