

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/layout/home/home_screen.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/add_job/add_job.dart';
import 'package:project/modules/users/Jobs.dart';
import 'package:project/shared/component/components.dart';

class DisplayJob extends StatefulWidget {
  Job? job;
  DisplayJob(this.job);
  @override
  State<DisplayJob> createState() => _DisplayJobState();
}

class _DisplayJobState extends State<DisplayJob> {
  bool isJob = false;
  bool isSmall = true;
  bool isSmallActiveTime = false;
  bool isReadmore = false;

  Language later=Language();
  bool isLatterButton=Language.getData(key:"isLater")!=null &&Language.getData(key:"isLater")!?true:false;

  TextStyle style= TextStyle(
    fontSize: 17,
    fontFamily: 'Anton',
    fontWeight: FontWeight.w600,
    letterSpacing: isEnglish? 1.5:0,);

  TextStyle style2=TextStyle(
    fontSize: 15,
    fontFamily: 'Anton',
    fontWeight: FontWeight.w900,
    letterSpacing: isEnglish? 2:0,
    color: Color.fromRGBO(78,162,152,1),


  );


  initState(){
    super.initState();
    isLatterButton?null :WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
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

                height:isEnglish? MediaQuery.of(context).size.height/2.8:MediaQuery.of(context).size.height/2.5,

                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),

                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              const AssetImage('images/stop_ar.jpg'))),
                    ),
                    const SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(isEnglish? '''If you are qualified to work in the medical field (such as a doctor, pharmacist, etc.), put your information here.\n The "For u" application is not responsible for any fraud, we want to be a link between the job Provider and the job applicant'''
                          :"إذ كنت مؤهل للعمل في المجال الطبي (كمساعد طبيب او بائع صيدلي ...الخ) ضع معلوماتك هنا لعلي وعسى يتصل بك مستشفي او صيدلي , تطبيقنا ليس مسؤل علي اي عملية احتيال او ازعاج نحن نريد ان نكون همزة وصل بين رب العمل وطالب العمل فقط",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                    ),

                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(
                          child: defualtElevatedButton(
                            title:  isEnglish?"Apply ":"تقديم ",
                            function: (){
                              Navigator.of(context).pushReplacement(

                                  MaterialPageRoute(builder:(context){
                                    return AddJob(isJob:false ,);
                                  })
                              );

                            },

                            border: 8,
                            paddingHorizatal: 2,
                            paddingVerical:10,

                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child:   defualtElevatedButton(
                          title: isEnglish?" Later ": "لاحقا",
                          function: (){},

                          border: 8,
                          paddingHorizatal: 2,
                          paddingVerical: 10,

                        ),),
                        const SizedBox(width: 10,),
                        Expanded(child:   defualtElevatedButton(
                          title: isEnglish? "Agree": " موافق ",
                          function: (){
                            later.putData(key: "isLater", value: !isLatterButton);

                            print(isLatterButton);
                            Navigator.of(context).pop();
                          },

                          border: 8,
                          paddingHorizatal: 2,
                          paddingVerical: 10,

                        ),),

                      ],
                    ),
                    const SizedBox(height: 15,),

                  ],
                ),
              ),
            );

          });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color =Theme.of(context).primaryColor;
    double mdw = MediaQuery
        .of(context)
        .size
        .width;
    double height1 = MediaQuery
        .of(context)
        .size
        .height / 4.round();
    double mapHeight = MediaQuery
        .of(context)
        .size
        .height / 4.round();

    return
      Directionality(
        textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text("Almotawakel",
          //       style:
          //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          // ),
            body: Container(
              decoration: defualtBoxDecoration(),
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 13), children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Card(
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                      ..pop();
                                  },
                                  icon: Icon(
                                    isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              SizedBox(
                                width: 85,
                              ),
                              widget.job!.isAdvertisement != null &&
                                  widget.job!.isAdvertisement! ?
                              Text(isEnglish ? "job" : "الوظيفة",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                                  : Text(isEnglish
                                  ? "Applying for a job"
                                  : "التقديم للوظيفة",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          )),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3.5,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 4.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 5,
                                color: color,
                              )
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: isJob
                                    ? AssetImage('images/hospital1.png')
                                    : AssetImage("images/jobApplicant.png"))),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Container(
                                width: mdw / 4,
                                height: mdw / 4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        color: color,
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: widget.job!.images_main !=
                                            null &&
                                            widget.job!.images_main!.isNotEmpty
                                            ?

                                        NetworkImage(widget.job!
                                            .images_main!) as ImageProvider
                                            :
                                        const AssetImage(
                                            "images/jobApplicant.png"))),
                              ),
                            ],
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              width: mdw / 3.8,
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 6, right: 10),
                              height: mdw / 8,
                              child: Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        color),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(2)),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // istapped = 'Button tapped';
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        isEnglish ? "More" : "المزيد",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.read_more,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  // child: const Text('Enabled Button')),
                                ),
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                widget.job!.isAdvertisement != null &&
                    widget.job!.isAdvertisement! ?
                Center(
                  child: Text(isEnglish ? "Job details" : "تفاصيل الوظيفة",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'Racing_Sans_One')),
                )
                    : SizedBox(),
                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: defualtBoxDecoration1(),
                  child: Column(
                    children: [
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                widget.job!.isAdvertisement != null &&
                                    widget.job!.isAdvertisement! ? Text(
                                  isEnglish
                                      ? " Job advertisement title:-"
                                      : "عنوان اعلان الوظيفة :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                )
                                    : Text(
                                  isEnglish
                                      ? "Applicant's Name:- "
                                      : "اسم المتقدم للوظـيفة :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),

                                widget.job!.isAdvertisement != null &&
                                    widget.job!.isAdvertisement!
                                    ? Text(
                                  widget.job!.hospital!.location_Name != null
                                      ? widget.job!.hospital!.location_Name!
                                      : widget.job!.offerName!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: isEnglish ? 3 : 0),
                                )
                                    : Text(
                                  widget.job!.offerName!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                widget.job!.isAdvertisement != null &&
                                    widget.job!.isAdvertisement!
                                    ? Text(
                                  isEnglish ? 'Job name:- ' : "اسم الوظيفة :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                )
                                    : Text(
                                  isEnglish
                                      ? 'Number Phone:- '
                                      : "رقم الجوال :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),
                                widget.job!.isAdvertisement != null &&
                                    widget.job!.isAdvertisement!
                                    ? Text(
                                  widget.job!.jobTitle!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: isEnglish ? 3 : 0),
                                )
                                    : Text(
                                  widget.job!.PhoneNumber!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text(
                                  isEnglish
                                      ? 'Academic Degree:- '
                                      : "الدرجة العلمية :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  widget.job!.jobDegree!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      widget.job!.isAdvertisement != null &&
                          widget.job!.isAdvertisement! ?
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [


                                  Text(
                                    isEnglish
                                        ? 'Working Home:- '
                                        : "ساعـات الدوام :- ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: isEnglish ? 3 : 0),
                                  ),

                                  SizedBox(width: 10,),
                                  Text(
                                    widget.job!.workHour!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: isEnglish ? 3 : 0),
                                  ),


                                ],
                              )),
                        ),
                      )
                          : SizedBox(),
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text(
                                  isEnglish ? 'Experience:- ' : "الخبرة :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),

                                ),
                                SizedBox(width: 10,),
                                Text(widget.job!.experienceLevel!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      widget.job!.isAdvertisement != null &&
                          widget.job!.isAdvertisement! ?
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [

                                Text(
                                  isEnglish ? 'Salary:- ' : "الراتب :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),
                                SizedBox(width: 10,),
                                Text(widget.job!.salary != null ? widget.job!
                                    .salary! : " undefined", style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: isEnglish ? 3 : 0),)

                              ],
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text(
                                  isEnglish
                                      ? 'Email :- '
                                      : " البريد الالكتروني :- ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: isEnglish ? 3 : 0),
                                ),
                                SizedBox(width: 10,),
                                Text(widget.job!.email!,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Anton',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: isEnglish ? 3 : 0),)


                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Card(
                        elevation: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: defualtBoxDecoration1(),
                          child: Stack(children: [

                            Card(
                              elevation: 1,
                              child: Container(
                                height: isReadmore ? 194 : 90,
                                decoration: defualtBoxDecoration1(),
                                child: Stack(children: [
                                  Container(
                                    // height: height1,

                                    height: isReadmore ? mdw / 122 : mdw / 22,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,

                                    padding: const EdgeInsets.only(
                                        top: 35, left: 10, right: 10),

                                    child: buildText("", 'Slabo27px',
                                        FontWeight.w700, isReadmore),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isReadmore = !isReadmore;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child:
                                                Text(
                                                  isEnglish ? widget.job!
                                                      .isAdvertisement !=
                                                      null && widget.job!
                                                      .isAdvertisement!
                                                      ? 'More details about the Ad :-'
                                                      : 'More details about job seeker :-'
                                                      : widget.job!
                                                      .isAdvertisement !=
                                                      null && widget.job!
                                                      .isAdvertisement!
                                                      ? "تفاصيل اضافية عن الاعلان"
                                                      : "تفاصيل اضافية عن المتقدم للوظيفة :- ",
                                                  style: style2,

                                                )),
                                            widget.job!.Detial_AR != null &&
                                                widget.job!.Detial_AR!
                                                    .isNotEmpty
                                                ?
                                            buildText(
                                                widget.job!.Detial_AR!, 'Anton',
                                                FontWeight.w700, isReadmore)
                                                : Text(""),

                                            // flex: 5,
                                            Icon(
                                              isReadmore
                                                  ? Icons.arrow_drop_up
                                                  : Icons
                                                  .arrow_drop_down_circle,
                                              color: color,
                                              size: isReadmore ? 40 : 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                          ),
                        ),
                        // SizedBox(height: 15,),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 15,),
                SizedBox(height: 20),
                Container(
                  // padding: EdgeInsets.all(3),
                  //       decoration:defualtBoxDecoration1(),
                  margin: EdgeInsets.all(2),

                  child: Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              color),
                          padding: MaterialStateProperty.all(const EdgeInsets
                              .all(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            // istapped = 'Button tapped';
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            Text(isEnglish ? "Share" : "مشاركة")
                          ],
                        ),
                        // child: const Text('Enabled Button')),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                color),
                            padding: MaterialStateProperty.all(const EdgeInsets
                                .all(8)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () {
                          setState(() {
                            // istapped = 'Button tapped';
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            Text(isEnglish ? "ِadd" : "للمفضلة"),
                          ],
                        ),
                        // child: const Text('Enabled Button')),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              color),
                          padding: MaterialStateProperty.all(const EdgeInsets
                              .all(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            // istapped = 'Button tapped';
                          });
                        },
                        child: isJob
                            ? Column(
                          children: [
                            Icon(
                              Icons.gpp_good_rounded,
                              color: Colors.white,
                            ),
                            Text("Apply"),
                          ],
                        )
                            : Column(
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.white,
                            ),
                            Text(isEnglish ? "Chat" : "دردشة"),
                          ],
                        ),

                        // child: const Text('Enabled Button')),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              color),
                          padding: MaterialStateProperty.all(const EdgeInsets
                              .all(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            // istapped = 'Button tapped';
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            Text(isEnglish ? "Call" : "اتصال"),
                          ],
                        ),
                        // child: const Text('Enabled Button')),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: 20,
                )
              ]),
            )),
      );
  }}
