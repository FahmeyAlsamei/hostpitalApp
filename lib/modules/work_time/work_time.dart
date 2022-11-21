import 'package:flutter/material.dart';


import 'package:project/api/active_time_hospital.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/users/table_activ_time.dart';

import '../../shared/component/components.dart';

import '../users/activ_time.dart';

class WorkTime extends StatefulWidget {
  static const routeName = '/WorkTime';
  ActivTime? time;

  WorkTime({this.time});

  @override
  State<WorkTime> createState() => _WorkTimeState();
}

class _WorkTimeState extends State<WorkTime> {
  int? choosenValue;

  bool sturdayCheckValue = true;
  bool sturdayAddPriodTime = false;

  bool sundayCheckValue = true;
  bool sundayAddPriodTime = false;

  bool mondayCheckValue = true;
  bool mondayAddPriodTime = false;

  bool tuesdayCheckValue = true;
  bool tuesdayAddPriodTime = false;

  bool wendesdayCheckValue = true;
  bool wendesdayAddPriodTime = false;

  bool thursdayCheckValue = true;
  bool thursdayAddPriodTime = false;

  bool fridayCheckValue = false;
  bool fridayAddPriodTime = false;

  DateTime data = DateTime.now();
  Color color=const Color.fromRGBO(36, 164, 164, 1);
  TextEditingController sturdayStartTimePriod1 = TextEditingController();
  TextEditingController sturdayEndTimePriod1 = TextEditingController();
  TextEditingController sturdayStartTimePriod2 = TextEditingController();
  TextEditingController sturdayEndTimePriod2 = TextEditingController();

  TextEditingController sundayStartTimePriod1 = TextEditingController();
  TextEditingController sundayEndTimePriod1 = TextEditingController();
  TextEditingController sundayStartTimePriod2 = TextEditingController();
  TextEditingController sundayEndTimePriod2 = TextEditingController();

  TextEditingController mondayStartTimePriod1 = TextEditingController();
  TextEditingController mondayEndTimePriod1 = TextEditingController();
  TextEditingController mondayStartTimePriod2 = TextEditingController();
  TextEditingController mondayEndTimePriod2 = TextEditingController();

  TextEditingController tuesdayStartTimePriod1 = TextEditingController();
  TextEditingController tuesdayEndTimePriod1 = TextEditingController();
  TextEditingController tuesdayStartTimePriod2 = TextEditingController();
  TextEditingController tuesdayEndTimePriod2 = TextEditingController();

  TextEditingController wendesdayStartTimePriod1 = TextEditingController();
  TextEditingController wendesdayEndTimePriod1 = TextEditingController();
  TextEditingController wendesdayStartTimePriod2 = TextEditingController();
  TextEditingController wendesdayEndTimePriod2 = TextEditingController();

  TextEditingController thursdayStartTimePriod1 = TextEditingController();
  TextEditingController thursdayEndTimePriod1 = TextEditingController();
  TextEditingController thursdayStartTimePriod2 = TextEditingController();
  TextEditingController thursdayEndTimePriod2 = TextEditingController();

  TextEditingController fridayStartTimePriod1 = TextEditingController();
  TextEditingController fridayEndTimePriod1 = TextEditingController();
  TextEditingController fridayStartTimePriod2 = TextEditingController();
  TextEditingController fridayEndTimePriod2 = TextEditingController();

  @override
  initState() {
    super.initState();

    if(widget.time== null){
      widget.time=ActivTime(
          Table_Activ_Time:TableActivTime(
              id: 1,
              Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"
          )
      );
    }

    if (widget.time!.Table_Activ_Time== null) {
      widget.time!.Table_Activ_Time=TableActivTime(
          id: 1,
          Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"
      );
    }
    if (widget.time!.Table_Activ_Time!.id != null) {
      choosenValue = widget.time!.Table_Activ_Time!.id!;
    } else {
      choosenValue = 1;
    }

    sturdayCheckValue = widget.time!.Sat_Type_Activ!;
    sundayCheckValue = widget.time!.Sun_Type_Activ!;

    mondayCheckValue = widget.time!.Mon_Type_Activ!;
    tuesdayCheckValue = widget.time!.Tue_Type_Activ!;
    wendesdayCheckValue = widget.time!.Wed_Type_Activ!;
    thursdayCheckValue = widget.time!.Thurs_Type_Activ!;
    fridayCheckValue = widget.time!.Fri_Type_Activ!;

    if (widget.time!.Sat_Type_Activ! && widget.time!.Sat_Activ_From != null) {
      sturdayStartTimePriod1.text = widget.time!.Sat_Activ_From!;
    }
    if (widget.time!.Sat_Type_Activ! && widget.time!.Sat_Activ_To != null) {
      sturdayEndTimePriod1.text = widget.time!.Sat_Activ_To!;
    }

    if (widget.time!.Sat_Type_Activ! &&
        widget.time!.Sat_Activ_From_Scond != null) {
      sturdayStartTimePriod2.text = widget.time!.Sat_Activ_From_Scond!;
    }

    if (widget.time!.Sat_Type_Activ! &&
        widget.time!.Sat_Activ_To_Scond != null) {
      sturdayEndTimePriod2.text = widget.time!.Sat_Activ_From_Scond!;
      sturdayAddPriodTime = true;
    }

    if (widget.time!.Sun_Type_Activ! && widget.time!.Sun_Activ_From != null) {
      sundayStartTimePriod1.text = widget.time!.Sun_Activ_From!;
    }
    if (widget.time!.Sun_Type_Activ! && widget.time!.Sun_Activ_To != null) {
      sundayEndTimePriod1.text = widget.time!.Sun_Activ_To!;
    }

    if (widget.time!.Sun_Type_Activ! &&
        widget.time!.Sun_Activ_From_Scond != null) {
      sundayStartTimePriod2.text = widget.time!.Sun_Activ_From_Scond!;
    }
    if (widget.time!.Sun_Type_Activ! &&
        widget.time!.Sun_Activ_To_Scond != null) {
      sundayAddPriodTime = true;
      sundayEndTimePriod2.text = widget.time!.Sun_Activ_To_Scond!;
    }

    if (widget.time!.Mon_Type_Activ! && widget.time!.Mon_Activ_From != null) {
      mondayStartTimePriod1.text = widget.time!.Mon_Activ_From!;
    }
    if (widget.time!.Mon_Type_Activ! && widget.time!.Mon_Activ_To != null) {
      mondayEndTimePriod1.text = widget.time!.Mon_Activ_To!;
    }
    if (widget.time!.Mon_Type_Activ! &&
        widget.time!.Mon_Activ_From_Scond != null) {
      mondayStartTimePriod2.text = widget.time!.Mon_Activ_From_Scond!;
      mondayAddPriodTime = true;
    }
    if (widget.time!.Mon_Type_Activ! &&
        widget.time!.Mon_Activ_To_Scond != null) {
      mondayEndTimePriod2.text = widget.time!.Mon_Activ_To_Scond!;
      mondayAddPriodTime = true;
    }

    if (widget.time!.Tue_Type_Activ! && widget.time!.Tue_Activ_From != null) {
      tuesdayStartTimePriod1.text = widget.time!.Tue_Activ_From!;
    }
    if (widget.time!.Tue_Type_Activ! && widget.time!.Tue_Activ_To != null) {
      tuesdayEndTimePriod1.text = widget.time!.Tue_Activ_To!;
    }
    if (widget.time!.Tue_Type_Activ! &&
        widget.time!.Tue_Activ_From_Scond != null) {
      tuesdayStartTimePriod2.text = widget.time!.Tue_Activ_From_Scond!;
      tuesdayAddPriodTime = true;
    }
    if (widget.time!.Tue_Type_Activ! &&
        widget.time!.Tue_Activ_To_Scond != null) {
      tuesdayEndTimePriod2.text = widget.time!.Tue_Activ_To_Scond!;
      tuesdayAddPriodTime = true;
    }

    if (widget.time!.Wed_Type_Activ! && widget.time!.Wed_Activ_From != null) {
      wendesdayStartTimePriod1.text = widget.time!.Wed_Activ_From!;
      wendesdayEndTimePriod1.text = widget.time!.Wed_Activ_To!;

    }

    if (widget.time!.Wed_Type_Activ! && widget.time!.Wed_Activ_To != null) {
      wendesdayEndTimePriod1.text = widget.time!.Wed_Activ_To!;
    }
    if (widget.time!.Wed_Type_Activ! &&
        widget.time!.Wed_Activ_From_Scond != null &&
        widget.time!.Wed_Activ_From_Scond!.isNotEmpty) {
      wendesdayStartTimePriod2.text = widget.time!.Wed_Activ_From_Scond!;
      wendesdayAddPriodTime = true;
    }

    if (widget.time!.Wed_Type_Activ! &&
        widget.time!.Wed_Activ_To_Scond != null &&
        widget.time!.Wed_Activ_To_Scond!.isNotEmpty) {
      wendesdayEndTimePriod2.text = widget.time!.Wed_Activ_To_Scond!;
    }

    if (widget.time!.Thurs_Type_Activ! &&
        widget.time!.Thurs_Activ_From != null) {
      thursdayStartTimePriod1.text = widget.time!.Thurs_Activ_From!;
    }
    if (widget.time!.Thurs_Type_Activ! && widget.time!.Thurs_Activ_To != null) {
      thursdayEndTimePriod1.text = widget.time!.Thurs_Activ_To!;
    }
    if (widget.time!.Thurs_Type_Activ! &&
        widget.time!.Thurs_Activ_From_Scond != null) {
      thursdayAddPriodTime = true;
      thursdayStartTimePriod2.text = widget.time!.Thurs_Activ_From_Scond!;
    }
    if (widget.time!.Thurs_Type_Activ! &&
        widget.time!.Thurs_Activ_To_Scond != null) {
      thursdayEndTimePriod2.text = widget.time!.Thurs_Activ_To_Scond!;
      thursdayAddPriodTime = true;
    }

    if (widget.time!.Fri_Type_Activ! && widget.time!.Fri_Activ_From != null) {
      fridayStartTimePriod1.text = widget.time!.Fri_Activ_From!;
    }
    if (widget.time!.Fri_Type_Activ! && widget.time!.Fri_Activ_To != null) {
      fridayEndTimePriod1.text = widget.time!.Fri_Activ_To!;
    }

    if (widget.time!.Fri_Type_Activ! &&
        widget.time!.Fri_Activ_From_Scond != null) {
      fridayStartTimePriod2.text = widget.time!.Fri_Activ_From_Scond!;
      fridayAddPriodTime = true;
    }
    if (widget.time!.Fri_Type_Activ! &&
        widget.time!.Fri_Activ_To_Scond != null) {
      fridayEndTimePriod2.text = widget.time!.Fri_Activ_To_Scond!;
      fridayAddPriodTime = true;
    }
  }

  onChoose(var value) {
    setState(() {
      choosenValue = value;
    });
  }

  bool isEnglish = Language.getData(key: "isDark") != null &&
      Language.getData(key: "isDark")!
      ? true
      : false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(isEnglish ? 'Work Time' : "أوقـات الــدوام"),
          ),
          //backgroundColor: Color.fromRGBO(244,245, 250, 1),

          body: Container(
              decoration: defualtBoxDecoration(),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                            Border.all(color: Colors.grey.withOpacity(0.8))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defualtRadioList(
                                title: isEnglish
                                    ? "Open to consider hours "
                                    : "مـفـتـوح حـسـب سـاعـات مـحـدودة",
                                value: 1,
                                choosenValue: choosenValue!,
                                function: (value) {
                                  onChoose(value);
                                }),
                            defualtRadioList(
                                title: isEnglish
                                    ? "Always Open "
                                    : "مـفـتـوح دائـماَ",
                                value: 2,
                                choosenValue: choosenValue!,
                                function: (value) {
                                  onChoose(value);
                                }),
                            defualtRadioList(
                                title: isEnglish
                                    ? "Permanent closed "
                                    : "مـغـلـق مـؤقـت",
                                value: 3,
                                choosenValue: choosenValue!,
                                function: (value) {
                                  onChoose(value);
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            choosenValue==1?Text(
                              isEnglish?"you should put your work time to apear on rearch result when open location ":" حدث ساعات عملك حتي تظهر نتائج البحث عندما يكون موقعك مفتوح",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey,fontSize: 13),
                            ):SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    (choosenValue == 1)
                        ? Card(
                        elevation: 2,
                        child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.8))),
                            child: Table(
                              textBaseline: TextBaseline.alphabetic,
                              defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: const FractionColumnWidth(0.05),
                                1: const FractionColumnWidth(0.18),
                                2: const FractionColumnWidth(0.28),
                                3: const FractionColumnWidth(0.04),
                                4: const FractionColumnWidth(0.28),
                                5: const FractionColumnWidth(0.08)
                              },
                              children: [
                                TableRow(children: [
                                  Checkbox(
                                      value: sturdayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          sturdayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title: isEnglish
                                          ? "Saturday "
                                          : "الـسـبـت"),
                                  sturdayCheckValue
                                      ? defualtDateTimeField(
                                    controller: sturdayStartTimePriod1,)
                                      : const SizedBox(),
                                  sturdayCheckValue
                                      ? defualtTextForTableRow(
                                      title: isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  sturdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: sturdayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish ? " Closed" : "مـغـلـق",
                                      color: Colors.red),
                                  sturdayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          sturdayAddPriodTime
                                              ? sturdayAddPriodTime
                                              : sturdayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    visible: sturdayAddPriodTime,
                                    child: defualtTextForTableRow(title: ''),
                                  ),
                                  Visibility(
                                    visible: sturdayAddPriodTime,
                                    child: defualtTextForTableRow(title: ''),
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: sturdayStartTimePriod2),
                                    visible: sturdayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: sturdayAddPriodTime,
                                    child: defualtTextForTableRow(
                                        title:isEnglish ? "to" :"إلى"),
                                  ),
                                  Visibility(
                                    visible: sturdayAddPriodTime,
                                    child: defualtDateTimeField(
                                        controller: sturdayEndTimePriod2),
                                  ),
                                  Visibility(
                                    visible: sturdayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              sturdayAddPriodTime
                                                  ? sturdayAddPriodTime =
                                              false
                                                  : sturdayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: sundayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          sundayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title:
                                      isEnglish ? "Sunday " : "الأحــد"),
                                  sundayCheckValue
                                      ? defualtDateTimeField(
                                      controller: sundayStartTimePriod1)
                                      : const SizedBox(),
                                  sundayCheckValue
                                      ? defualtTextForTableRow(
                                      title:isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  sundayCheckValue
                                      ? defualtDateTimeField(
                                      controller: sundayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق",
                                      color: Colors.red),
                                  sundayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          sundayCheckValue &&
                                              sundayAddPriodTime
                                              ? sundayAddPriodTime
                                              : sundayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: sundayStartTimePriod2),
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: sundayEndTimePriod2),
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: sundayCheckValue &&
                                        sundayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              sundayAddPriodTime
                                                  ? sundayAddPriodTime = false
                                                  : sundayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: mondayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          mondayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title: isEnglish
                                          ? "Monday "
                                          : "الأثـنـيـن"),
                                  mondayCheckValue
                                      ? defualtDateTimeField(
                                      controller: mondayStartTimePriod1)
                                      : const SizedBox(),
                                  mondayCheckValue
                                      ? defualtTextForTableRow(
                                      title: isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  mondayCheckValue
                                      ? defualtDateTimeField(
                                      controller: mondayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق",
                                      color: Colors.red),
                                  mondayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          mondayAddPriodTime
                                              ? mondayAddPriodTime
                                              : mondayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: mondayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: mondayCheckValue &&
                                        mondayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: mondayStartTimePriod2),
                                    visible: mondayCheckValue &&
                                        mondayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: mondayCheckValue &&
                                        mondayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: mondayEndTimePriod2),
                                    visible: mondayCheckValue &&
                                        mondayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: mondayCheckValue &&
                                        mondayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              mondayAddPriodTime
                                                  ? mondayAddPriodTime = false
                                                  : mondayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: tuesdayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          tuesdayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title: isEnglish
                                          ? "Tuesday"
                                          : "الـثـلاثـاء"),
                                  tuesdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: tuesdayEndTimePriod1)
                                      : const SizedBox(),
                                  tuesdayCheckValue
                                      ? defualtTextForTableRow(
                                      title:isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  tuesdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: tuesdayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق",
                                      color: Colors.red),
                                  tuesdayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          tuesdayAddPriodTime
                                              ? tuesdayAddPriodTime
                                              : tuesdayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: tuesdayStartTimePriod2),
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: tuesdayEndTimePriod2),
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: tuesdayCheckValue &&
                                        tuesdayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              tuesdayCheckValue
                                                  ? tuesdayAddPriodTime =
                                              false
                                                  : tuesdayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: wendesdayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          wendesdayCheckValue = value!;
                                        });
                                      }),
                                  isEnglish
                                      ? const Padding(
                                    padding: EdgeInsets.only(
                                        top: 1, right: 1),
                                    child: Text(
                                      "Wednesday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.black),
                                    ),
                                  ):defualtTextForTableRow(
                                      title: "الأربـعـاء"),
                                  wendesdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: wendesdayStartTimePriod1)
                                      : const SizedBox(),
                                  wendesdayCheckValue
                                      ? defualtTextForTableRow(
                                      title:isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  wendesdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: wendesdayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق",
                                      color: Colors.red),
                                  tuesdayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          wendesdayAddPriodTime
                                              ? wendesdayAddPriodTime
                                              : wendesdayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: wendesdayStartTimePriod2),
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: wendesdayEndTimePriod2),
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: wendesdayCheckValue &&
                                        wendesdayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              wendesdayCheckValue
                                                  ? wendesdayAddPriodTime =
                                              false
                                                  : wendesdayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: thursdayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          thursdayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title: isEnglish
                                          ? "Thursday "
                                          : "الـخـمـيـس"),
                                  thursdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: thursdayStartTimePriod1)
                                      : const SizedBox(),
                                  thursdayCheckValue
                                      ? defualtTextForTableRow(
                                      title: isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  thursdayCheckValue
                                      ? defualtDateTimeField(
                                      controller: thursdayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق",
                                      color: Colors.red),
                                  thursdayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          thursdayAddPriodTime
                                              ? thursdayAddPriodTime
                                              : thursdayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: thursdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: thursdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: thursdayStartTimePriod2),
                                    visible: thursdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: thursdayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: thursdayEndTimePriod2),
                                    visible: thursdayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: thursdayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              thursdayAddPriodTime
                                                  ? thursdayAddPriodTime =
                                              false
                                                  : thursdayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Checkbox(
                                      value: fridayCheckValue,
                                      onChanged: (value) {
                                        setState(() {
                                          fridayCheckValue = value!;
                                        });
                                      }),
                                  defualtTextForTableRow(
                                      title:
                                      isEnglish ? "Friday" : "الـجـمعـه"),
                                  fridayCheckValue
                                      ? defualtDateTimeField(
                                      controller: fridayStartTimePriod1)
                                      : const SizedBox(),
                                  fridayCheckValue
                                      ? defualtTextForTableRow(
                                      title:isEnglish ? "to" :"إلى")
                                      : const Text(""),
                                  fridayCheckValue
                                      ? defualtDateTimeField(
                                      controller: fridayEndTimePriod1)
                                      : defualtTextForTableRow(
                                      title: isEnglish
                                          ? " Closed"
                                          : "مـغـلـق", color: Colors.red),
                                  fridayCheckValue
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 3),
                                    child: defualtIconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      function: () {
                                        setState(() {
                                          fridayAddPriodTime
                                              ? fridayAddPriodTime
                                              : fridayAddPriodTime =
                                          true;
                                        });
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ]),
                                TableRow(children: [
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: fridayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(title: ''),
                                    visible: fridayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: fridayStartTimePriod2),
                                    visible: fridayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtTextForTableRow(
                                        title: isEnglish ? "to" :"إلى"),
                                    visible: fridayAddPriodTime,
                                  ),
                                  Visibility(
                                    child: defualtDateTimeField(
                                        controller: fridayEndTimePriod2),
                                    visible: fridayAddPriodTime,
                                  ),
                                  Visibility(
                                    visible: fridayAddPriodTime,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 3),
                                        child: defualtIconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_rounded,
                                            color: Colors.red,
                                          ),
                                          function: () {
                                            setState(() {
                                              fridayAddPriodTime
                                                  ? fridayAddPriodTime = false
                                                  : fridayAddPriodTime;
                                            });
                                          },
                                        )),
                                  ),
                                ]),
                              ],
                            )))
                        : const SizedBox(
                      height: 0,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defualtElevatedButton(
                      title: 'SAVE',
                      border: 8,
                      paddingHorizatal: 70,
                      function: () async {
                        print(choosenValue);
                        ActivTime activeTime = ActivTime(
                            Sat_Activ_From: sturdayStartTimePriod1.text.isEmpty
                                ? null
                                : sturdayStartTimePriod1.text,
                            Sat_Activ_To: sturdayEndTimePriod1.text.isEmpty
                                ? null
                                : sturdayEndTimePriod1.text,
                            Sat_Type_Activ: sturdayCheckValue,
                            Sat_Activ_From_Scond: sturdayStartTimePriod2.text.isEmpty
                                ? null
                                : sturdayStartTimePriod2.text,
                            Sat_Activ_To_Scond: sturdayEndTimePriod2.text.isEmpty
                                ? null
                                : sturdayEndTimePriod2.text,
                            Table_Activ_Time: TableActivTime(
                              id: choosenValue,
                              Tables_Type_Activ_From: choosenValue == 1
                                  ? "مفتوح حسب ساعات محدود"
                                  : choosenValue == 2
                                  ? "مفتوح دائماً"
                                  : choosenValue == 3
                                  ? "مغلق مؤقت"
                                  : "",
                            ),
                            Sun_Type_Activ: sundayCheckValue,
                            Sun_Activ_From: sundayStartTimePriod1.text.isEmpty
                                ? null
                                : sundayStartTimePriod1.text,
                            Sun_Activ_To: sundayEndTimePriod1.text.isEmpty
                                ? null
                                : sundayEndTimePriod1.text,
                            Sun_Activ_From_Scond: sundayStartTimePriod2.text.isEmpty
                                ? null
                                : sundayStartTimePriod2.text,
                            Sun_Activ_To_Scond: sundayEndTimePriod2.text.isEmpty
                                ? null
                                : sundayEndTimePriod2.text,
                            Mon_Type_Activ: mondayCheckValue,
                            Mon_Activ_From: mondayStartTimePriod1.text.isEmpty
                                ? null
                                : mondayStartTimePriod1.text,
                            Mon_Activ_To: mondayEndTimePriod1.text.isEmpty
                                ? null
                                : mondayEndTimePriod1.text,
                            Mon_Activ_From_Scond: mondayStartTimePriod2.text.isEmpty
                                ? null
                                : mondayStartTimePriod2.text,
                            Mon_Activ_To_Scond: mondayEndTimePriod2.text.isEmpty
                                ? null
                                : mondayEndTimePriod2.text,
                            Tue_Type_Activ: tuesdayCheckValue,
                            Tue_Activ_From: tuesdayStartTimePriod1.text.isEmpty
                                ? null
                                : tuesdayStartTimePriod1.text,
                            Tue_Activ_To: tuesdayEndTimePriod1.text.isEmpty
                                ? null
                                : tuesdayEndTimePriod1.text,
                            Tue_Activ_From_Scond: tuesdayStartTimePriod2.text.isEmpty
                                ? null
                                : tuesdayStartTimePriod2.text,
                            Tue_Activ_To_Scond: tuesdayEndTimePriod2.text.isEmpty
                                ? null
                                : tuesdayEndTimePriod2.text,
                            Wed_Type_Activ: wendesdayCheckValue,
                            Wed_Activ_From: wendesdayStartTimePriod1.text.isEmpty
                                ? null
                                : wendesdayStartTimePriod1.text,
                            Wed_Activ_To: wendesdayEndTimePriod1.text.isEmpty
                                ? null
                                : wendesdayEndTimePriod1.text,
                            Wed_Activ_From_Scond: wendesdayStartTimePriod2.text.isEmpty
                                ? null
                                : wendesdayStartTimePriod2.text,
                            Wed_Activ_To_Scond: wendesdayEndTimePriod2.text.isEmpty
                                ? null
                                : wendesdayEndTimePriod2.text,
                            Thurs_Type_Activ: thursdayCheckValue,
                            Thurs_Activ_From: thursdayStartTimePriod1.text.isEmpty
                                ? null
                                : thursdayStartTimePriod1.text,
                            Thurs_Activ_To: thursdayEndTimePriod1.text.isEmpty
                                ? null
                                : thursdayEndTimePriod1.text,
                            Thurs_Activ_From_Scond:
                            thursdayStartTimePriod2.text.isEmpty
                                ? null
                                : thursdayStartTimePriod2.text,
                            Thurs_Activ_To_Scond: thursdayEndTimePriod2.text.isEmpty
                                ? null
                                : thursdayEndTimePriod2.text,
                            Fri_Type_Activ: fridayCheckValue,
                            Fri_Activ_From: fridayStartTimePriod1.text.isEmpty ? null : fridayStartTimePriod1.text,
                            Fri_Activ_To: fridayEndTimePriod1.text.isEmpty ? null : fridayEndTimePriod1.text,
                            Fri_Activ_From_Scond: fridayStartTimePriod2.text.isEmpty ? null : fridayStartTimePriod1.text,
                            Fri_Activ_To_Scond: fridayEndTimePriod2.text.isEmpty ? null : fridayEndTimePriod2.text);

                        ActivTimeApiProvider active = new ActivTimeApiProvider();

                        // ActivTime  activeTimeOut;
                        try {
                          activeTime = await active.addActivTime(activeTime);

                          if (activeTime != null && activeTime.id != null) {
                            // /if(activeTimeOut.Table_Activ_Time)
                            activeTime.Table_Activ_Time!.Tables_Type_Activ_From =
                            choosenValue == 1
                                ? "مفتوح حسب ساعات محدود"
                                : choosenValue == 2
                                ? "مفتوح دائماً"
                                : choosenValue == 3
                                ? "مغلق مؤقت"
                                : "";

                            Navigator.pop(context, activeTime);
                          }

                          // if/(activeTime!=null&&activeTime.id!=null)
                          // Navigator.pop(context, activeTime);
                        } catch (r, a) {
                          // Navigator.pop(context, activeTime);

                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ))),
    );
  }
}
