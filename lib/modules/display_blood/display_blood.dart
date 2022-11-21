import 'package:flutter/material.dart';
import 'package:project/models/language.dart';
import 'package:project/shared/component/components.dart';

import '../users/blood.dart';


class DisplayDoner extends StatefulWidget {
  @override
  Blood ?blood;
  DisplayDoner(this.blood);
  State<DisplayDoner> createState() =>_DisplayDonerState();


}

class _DisplayDonerState extends State<DisplayDoner> {

  bool isDoner = false;
  bool isSmall = true;
  bool isSmallActiveTime = false;
  bool isReadmore = false;
  Color color = const Color.fromRGBO(78,162,152,1);
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
  @override
  Widget build(BuildContext context) {
    double mdw = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height / 4.round();
    double mapHeight = MediaQuery.of(context).size.height / 4.round();
    bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

    return
      Directionality(textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
          child:
          Scaffold(
            // appBar: AppBar(
            //   title: Text("Almotawakel",
            //       style:
            //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            // ),
              body: Container(
                  decoration: defualtBoxDecoration(),
                  child: ListView(padding: const EdgeInsets.symmetric(horizontal: 13),
                      children: [

                        Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Card(
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color:color,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context)..pop();
                                          },
                                          icon:  Icon(
                                            isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 85,
                                      ),
                                      Text( widget.blood!.status!?isEnglish?"Blood Doner":"الـمتبرع بالـدم":" Need Blood" "المحتاج لـلدم",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 23,color: Colors.white))

                                    ],
                                  )),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: Colors.white, width: 3.2),
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      color: Color.fromRGBO(119, 205, 188, 1),
                                    )
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: isDoner
                                          ? const AssetImage('images/bloodD.png')
                                          : const AssetImage("images/bloodD.png"))
                              ),
                            ),


                          ],
                        ),

                        Center(
                          child:
                          Text( widget.blood!.status!?(isEnglish?" Blood Doner Information ":" معلومات المتبرع بالـدم"):(isEnglish?"blood needly Infrmationn":"معلومات المحتاج للدم"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Racing_Sans_One')),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(

                          child: Column(
                              children: [
                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Stack(children: [
                                      Padding(
                                          padding: const EdgeInsets.only(left: 5),

                                          child: Row(
                                            children: [
                                              Container(
                                                  child: Text(
                                                    isEnglish? (widget.blood!.status!?'Name of Doner:- ':"Name of the needy:-" )
                                                        :(widget.blood!.status!?"اسم المتبرع بالدم:- ":"اسم المحتاج للدم :-"),
                                                    style:style2,
                                                  ),




                                              ),
                                              SizedBox(width: 10,),
                                              Text(widget.blood!.Name!,style: style,)
                                            ],
                                          )

                                      ),
                                    ]),
                                  ),
                                ),
                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child:
                                            Text(
                                              isEnglish? 'Number phone 1  :- ':"رقم الهاتف 1  :-",
                                              style: style2
                                            ),

                                          ),

                                          SizedBox(width: 10,),
                                          Text(widget.blood!.Phone_Number1!,style:TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Anton',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing:2),)

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                widget.blood!.phone_Number2!=null&&widget.blood!.phone_Number2!.isNotEmpty?
                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text( isEnglish?'Number Phone 2  :- ':"رقم الـهاتـف 2  :-",

                                              style: style2
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(widget.blood!.phone_Number2!,style:TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Anton',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ):SizedBox(),
                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              isEnglish?'City :- ':"الـمديـنة :-",
                                              style: style2,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(widget.blood!.city!,style: style,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                isEnglish?'Directorate :- ':"المـديريـة :-",
                                                style:style2
                                              ),

                                            ),
                                            SizedBox(width: 10,),
                                            Text(widget.blood!.directorate!,style: style,)

                                          ],
                                        )),
                                  ),
                                ),

                                Card(
                                  elevation: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: defualtBoxDecoration1(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              isEnglish?  'Blood type :-:- ':" نـوع فصيـلة الـدم :-",
                                              style:style2
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(widget.blood!.blood_Type!,style:TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Anton',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing:2),textDirection: TextDirection.ltr,)
                                        ],
                                      ),
                                    ),
                                  ),
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
                                              width: MediaQuery.of(context).size.width,

                                              padding: const EdgeInsets.only(top: 35, left: 10, right: 10),

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
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                          Text(
                                                            isEnglish?  widget.blood!.status!?'More details about  :-': 'More details about ":-'
                                                                : widget.blood!.status!?"المعلومات الاضافية عن المتبرع :-":"المعـلومـات الاضـافـية :- ",
                                                            style:style2,

                                                          )),
                                                      widget.blood!.Detial_AR!=null&&widget.blood!.Detial_AR!.isNotEmpty?
                                                      buildText(widget.blood!.Detial_AR!, 'Anton',  FontWeight.w700, isReadmore):Text(""),

                                                      // flex: 5,
                                                      Icon(
                                                        isReadmore
                                                            ? Icons.arrow_drop_up
                                                            : Icons.arrow_drop_down_circle,
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
                                Container(
                                  // padding: EdgeInsets.all(3),
                                  //       decoration:defualtBoxDecoration1(),
                                    margin: const EdgeInsets.all(2),

                                    child: Row(children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                const Color.fromRGBO(119, 205, 188, 1)),
                                            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              // istapped = 'Button tapped';
                                            });
                                          },
                                          child: Column(
                                            children: const [
                                              Icon(
                                                Icons.share,
                                                color: Colors.white,
                                              ),
                                              Text("Share")
                                            ],
                                          ),
                                          // child: const Text('Enabled Button')),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  const Color.fromRGBO(119, 205, 188, 1)),
                                              padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                              textStyle: MaterialStateProperty.all(
                                                  const TextStyle(fontSize: 14, color: Colors.white))),
                                          onPressed: () {
                                            setState(() {
                                              isDoner=!isDoner;
                                              // istapped = 'Button tapped';
                                            });
                                          },
                                          child: Column(
                                            children: const [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                              Text("Add"),
                                            ],
                                          ),
                                          // child: const Text('Enabled Button')),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                const Color.fromRGBO(119, 205, 188, 1)),
                                            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isEnglish=!isEnglish;
                                              // istapped = 'Button tapped';
                                            });
                                          },
                                          child:Column(
                                            children: const [
                                              Icon(
                                                Icons.chat,
                                                color: Colors.white,
                                              ),
                                              Text("Chat"),
                                            ],
                                          ),

                                          // child: const Text('Enabled Button')),






                                        ),
                                      ),const SizedBox(width: 5,),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                const Color.fromRGBO(119, 205, 188, 1)),
                                            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              // istapped = 'Button tapped';
                                            });
                                          },
                                          child:

                                          Column(
                                            children: const [
                                              Icon(
                                                Icons.call,
                                                color: Colors.white,
                                              ),
                                              Text("Call"),
                                            ],
                                          ),

                                          // child: const Text('Enabled Button')),




                                        ),
                                      ),
                                    ],
                                    )
                                )
                              ]

                          ),
                        )
                      ]
                  )))
      );
  }
}
