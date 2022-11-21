

 import 'package:flutter/cupertino.dart';
import 'package:project/modules/users/activ_time.dart';
import 'package:project/modules/users/doctors.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/shared/component/components.dart';



 displayDataWorkTime({required bool isSmallActiveTime ,required Hospital hospital } ){

   return Visibility(
       visible: isSmallActiveTime,
       child:hospital.Activ_Time != null &&
           hospital.Activ_Time!.Table_Activ_Time != null &&
           hospital.Activ_Time!.Table_Activ_Time!.id! == 1
           ? Table(
         columnWidths: {
           2: FractionColumnWidth(0.15)
         },
         defaultVerticalAlignment:
         TableCellVerticalAlignment.middle,
         children: [


           ////////////////////  Sunday

           hospital.Activ_Time!.Sun_Activ_From!=null&&
               hospital.Activ_Time!.Sun_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Sun_Activ_To!=null&&
               hospital.Activ_Time!.Sun_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Sunday"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Sun_Activ_To!=null? hospital.Activ_Time!.Sun_Activ_To!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Sun_Activ_From !=null? hospital.Activ_Time!.Sun_Activ_From!:""
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Sunday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Sun_Activ_From_Scond !=null? hospital.Activ_Time!.Sun_Activ_From_Scond!:""),
               visible:  hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible: hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Sun_Activ_To_Scond !=null? hospital.Activ_Time!.Sun_Activ_To_Scond!:""),
               visible: hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           //////////////////////////  Monday

           hospital.Activ_Time!.Mon_Activ_From!=null&&
               hospital.Activ_Time!.Mon_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Mon_Activ_To!=null&&
               hospital.Activ_Time!.Mon_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Monday"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Mon_Activ_From!=null? hospital.Activ_Time!.Mon_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Mon_Activ_To!=null?hospital.Activ_Time!.Mon_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Monday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
                 child:
                 defualtContianerForTableRow(
                     ""),
                 visible: hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Mon_Activ_From_Scond !=null?  hospital.Activ_Time!.Mon_Activ_From_Scond!:""),
               visible: hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     hospital.Activ_Time!.Mon_Activ_To_Scond !=null?  hospital.Activ_Time!.Mon_Activ_To_Scond!:""),
                 visible: hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             )
           ]),

           ////     Tuesday
           hospital.Activ_Time!.Tue_Activ_From!=null&&
               hospital.Activ_Time!.Tue_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Tue_Activ_To!=null&&
               hospital.Activ_Time!.Tue_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Tue_Activ_From!=null? hospital.Activ_Time!.Tue_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Tue_Activ_To!=null?  hospital.Activ_Time!.Tue_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Tue_Activ_From_Scond!=null?    hospital.Activ_Time!.Tue_Activ_From_Scond!:""),
               visible:hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Tue_Activ_To_Scond !=null?  hospital.Activ_Time!.Tue_Activ_To_Scond!:""),
               visible:hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Wed_Activ_From!=null&&
               hospital.Activ_Time!.Wed_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Wed_Activ_To!=null&&
               hospital.Activ_Time!.Wed_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Wednessday"),
             defualtContianerForTableRow2(

                 hospital.Activ_Time!.Wed_Activ_From!=null? hospital.Activ_Time!.Wed_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Wed_Activ_To!=null? hospital.Activ_Time!.Wed_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Wednesday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Wed_Activ_From_Scond!=null? hospital.Activ_Time!.Wed_Activ_From_Scond!:""),
               visible:hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Wed_Activ_To_Scond !=null? hospital.Activ_Time!.Wed_Activ_To_Scond!:""),
               visible:hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Thurs_Activ_From!=null&&
               hospital.Activ_Time!.Thurs_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Thurs_Activ_To!=null&&
               hospital.Activ_Time!.Thurs_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Thurs_Activ_From!=null? hospital.Activ_Time!.Thurs_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Thurs_Activ_To !=null ?hospital.Activ_Time!.Thurs_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow1(
                 "Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Thurs_Activ_From_Scond !=null? hospital.Activ_Time!.Thurs_Activ_From_Scond!:""),
               visible: hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:  hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Thurs_Activ_To_Scond !=null?   hospital.Activ_Time!.Thurs_Activ_To_Scond!:""),
               visible: hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Fri_Activ_From!=null&&
               hospital.Activ_Time!.Fri_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Fri_Activ_To!=null&&
               hospital.Activ_Time!.Fri_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Friday"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Fri_Activ_From!=null? hospital.Activ_Time!.Fri_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Fri_Activ_To!=null?hospital.Activ_Time!.Fri_Activ_To!:""
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Friday"),
             defualtContianerForTableRow1(
                 "Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible:  hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Fri_Activ_From_Scond !=null?hospital.Activ_Time!.Fri_Activ_From_Scond!:""),
               visible: hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:  hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Fri_Activ_To_Scond !=null? hospital.Activ_Time!.Fri_Activ_To_Scond!:""),
               visible: hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),
         ],
       )
           : SizedBox()

   );


 }

 ///////////////////////////////////////////////////////////////////



 displayDataTimeInInputScreen({required ActivTime ? worktime}){

   return worktime != null &&
       worktime.Table_Activ_Time!.id == 1

       ? Table(
     columnWidths: {
       2: FractionColumnWidth(0.15)
     },
     defaultVerticalAlignment:
     TableCellVerticalAlignment.middle,
     children: [
       worktime.Sat_Activ_From!=null&&
           worktime.Sat_Activ_From!.isNotEmpty&&
           worktime.Sat_Activ_To!=null&&
           worktime.Sat_Activ_To!.isNotEmpty



           ? TableRow(children: [
         defualtContianerForTableRow(
             "Sturday"),
         defualtContianerForTableRow2(
             worktime.Sat_Activ_From !=null?worktime.Sat_Activ_From!:""   ),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime
                 .Sat_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Sturday"),
         defualtContianerForTableRow1(
             " Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
             child:
             defualtContianerForTableRow(
                 ''),
             visible:  worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Sat_Activ_From_Scond !=null?
                 worktime.Sat_Activ_From_Scond!:""
             ),
             visible: worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child:
             defualtContianerForTableRow(
                 'to'),
             visible:  worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Sat_Activ_To_Scond !=null ?
                 worktime.Sat_Activ_To_Scond!:""
             ),
             visible:worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         )
       ]),

       ////////////////////  Sunday

       worktime.Sun_Activ_From!=null&&
           worktime.Sun_Activ_From!.isNotEmpty&&
           worktime.Sun_Activ_To!=null&&
           worktime.Sun_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Sunday"),
         defualtContianerForTableRow2(
             worktime.Sun_Activ_To!),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime
                 .Sun_Activ_From!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Sunday"),
         defualtContianerForTableRow1(
             " Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
           child:
           defualtContianerForTableRow(
               ''),
           visible: worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Sun_Activ_From_Scond !=null  ?
               worktime.Sun_Activ_From_Scond!:""
           ),
           visible:  worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:  worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Sun_Activ_To_Scond !=null ?
               worktime.Sun_Activ_To_Scond!:""
           ),
           visible: worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       //////////////////////////  Monday

       worktime.Mon_Activ_From!=null&&
           worktime.Mon_Activ_From!.isNotEmpty&&
           worktime.Mon_Activ_To!=null&&
           worktime.Mon_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Monday"),
         defualtContianerForTableRow2(
             worktime
                 .Mon_Activ_From!),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime.Mon_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Monday"),
         defualtContianerForTableRow1(
             " Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
             child:
             defualtContianerForTableRow(
                 ""),
             visible:  worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Mon_Activ_From_Scond !=null ?
               worktime.Mon_Activ_From_Scond!:''
           ),
           visible:
           worktime.Mon_Type_Activ!&&
               worktime.Mon_Activ_From_Scond!=null&&
               worktime.Mon_Activ_From_Scond!.isNotEmpty&&
               worktime.Mon_Activ_To_Scond!=null&&
               worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:worktime.Mon_Activ_From_Scond!=null&&
               worktime.Mon_Activ_From_Scond!.isNotEmpty&&
               worktime.Mon_Activ_To_Scond!=null&&
               worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Mon_Activ_To_Scond !=null ?
                 worktime.Mon_Activ_To_Scond!:''
             ),
             visible: worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         )
       ]),

       ////     Tuesday
       worktime.Tue_Activ_From!=null&&
           worktime.Tue_Activ_From!.isNotEmpty&&
           worktime.Tue_Activ_To!=null&&
           worktime.Tue_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Tuesday"),
         defualtContianerForTableRow2(
             worktime
                 .Tue_Activ_From!),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime.Tue_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Tuesday"),
         defualtContianerForTableRow1(
             " Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
           child:
           defualtContianerForTableRow(
               ''),
           visible: worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(

               worktime
                   .Tue_Activ_From_Scond !=null? worktime.Tue_Activ_From_Scond!:""

           ),
           visible: worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Tue_Activ_To_Scond !=null? worktime.Tue_Activ_To_Scond!:""
           ),
           visible:worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Wed_Activ_From!=null&&
           worktime.Wed_Activ_From!.isNotEmpty&&
           worktime.Wed_Activ_To!=null&&
           worktime.Wed_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Wednessday"),
         defualtContianerForTableRow2(
             worktime.Wed_Activ_From! ),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime
                 .Wed_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Wednesday"),
         defualtContianerForTableRow1(
             " Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
           child:
           defualtContianerForTableRow(
               ''),
           visible: worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Wed_Activ_From_Scond !=null? worktime.Wed_Activ_From_Scond!:""

           ),
           visible:worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible: worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Wed_Activ_To_Scond !=null ?worktime.Wed_Activ_To_Scond!:""

           ),
           visible:worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Thurs_Activ_From!=null&&
           worktime.Thurs_Activ_From!.isNotEmpty&&
           worktime.Thurs_Activ_To!=null&&
           worktime.Thurs_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Tuesday"),
         defualtContianerForTableRow2(
             worktime
                 .Thurs_Activ_From!),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime
                 .Thurs_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Tuesday"),
         defualtContianerForTableRow1(
             "Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
           child:
           defualtContianerForTableRow(
               ''),
           visible: worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Thurs_Activ_From_Scond !=null? worktime.Thurs_Activ_From_Scond!:"" ),
           visible:  worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:  worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Thurs_Activ_To_Scond !=null? worktime.Thurs_Activ_To_Scond!:""
           ),
           visible: worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Fri_Activ_From!=null&&
           worktime.Fri_Activ_From!.isNotEmpty&&
           worktime.Fri_Activ_To!=null&&
           worktime.Fri_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             "Friday"),
         defualtContianerForTableRow2(
             worktime
                 .Fri_Activ_From!),
         defualtContianerForTableRow(
             "to "),
         defualtContianerForTableRow2(
             worktime.Fri_Activ_To!
         ),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             "Friday"),
         defualtContianerForTableRow1(
             "Closed"),
         defualtContianerForTableRow(
             " "),
         defualtContianerForTableRow(
             " "),
       ]),

       TableRow(children: [
         Visibility(
           child:
           defualtContianerForTableRow(
               ''),
           visible:  worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:

           defualtContianerForTableRow2(

               worktime.Fri_Activ_From_Scond !=null? worktime.Fri_Activ_From_Scond!:''),
           visible:
           worktime.Fri_Type_Activ! == false?false:
           worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:  worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Fri_Activ_To_Scond !=null?
               worktime.Fri_Activ_To_Scond!:''),
           visible:  worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),
     ],
   )
       : SizedBox();
 }




















 displayDataTimeInDoctorScreen({required bool isSmallActiveTime ,required Doctors doctor}){

   return Visibility(
       visible: isSmallActiveTime,
       child:doctor.activTime != null &&
           doctor.activTime!.Table_Activ_Time!= null &&
           doctor.activTime!.Table_Activ_Time!.id! == 1
           ? Table(
         columnWidths: {
           2: FractionColumnWidth(0.15)
         },
         defaultVerticalAlignment:
         TableCellVerticalAlignment.middle,
         children: [


           ////////////////////  Sunday

           doctor.activTime!.Sun_Activ_From!=null&&
               doctor.activTime!.Sun_Activ_From!.isNotEmpty&&
               doctor.activTime!.Sun_Activ_To!=null&&
               doctor.activTime!.Sun_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Sunday"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Sun_Activ_To!=null? doctor.activTime!.Sun_Activ_To!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Sun_Activ_From !=null? doctor.activTime!.Sun_Activ_From!:""
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Sunday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Sun_Activ_From_Scond !=null? doctor.activTime!.Sun_Activ_From_Scond!:""),
               visible:  doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible: doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Sun_Activ_To_Scond !=null? doctor.activTime!.Sun_Activ_To_Scond!:""),
               visible: doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           //////////////////////////  Monday

           doctor.activTime!.Mon_Activ_From!=null&&
               doctor.activTime!.Mon_Activ_From!.isNotEmpty&&
               doctor.activTime!.Mon_Activ_To!=null&&
               doctor.activTime!.Mon_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Monday"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Mon_Activ_From!=null? doctor.activTime!.Mon_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Mon_Activ_To!=null?doctor.activTime!.Mon_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Monday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
                 child:
                 defualtContianerForTableRow(
                     ""),
                 visible: doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Mon_Activ_From_Scond !=null?  doctor.activTime!.Mon_Activ_From_Scond!:""),
               visible: doctor.activTime!.Mon_Activ_From_Scond!=null&&
                   doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Mon_Activ_To_Scond!=null&&
                   doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:doctor.activTime!.Mon_Activ_From_Scond!=null&&
                   doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Mon_Activ_To_Scond!=null&&
                   doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     doctor.activTime!.Mon_Activ_To_Scond !=null?  doctor.activTime!.Mon_Activ_To_Scond!:""),
                 visible: doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             )
           ]),

           ////     Tuesday
           doctor.activTime!.Tue_Activ_From!=null&&
               doctor.activTime!.Tue_Activ_From!.isNotEmpty&&
               doctor.activTime!.Tue_Activ_To!=null&&
               doctor.activTime!.Tue_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Tue_Activ_From!=null? doctor.activTime!.Tue_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Tue_Activ_To!=null?  doctor.activTime!.Tue_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Tue_Activ_From_Scond!=null?    doctor.activTime!.Tue_Activ_From_Scond!:""),
               visible:doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Tue_Activ_To_Scond !=null?  doctor.activTime!.Tue_Activ_To_Scond!:""),
               visible:doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Wed_Activ_From!=null&&
               doctor.activTime!.Wed_Activ_From!.isNotEmpty&&
               doctor.activTime!.Wed_Activ_To!=null&&
               doctor.activTime!.Wed_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Wednessday"),
             defualtContianerForTableRow2(

                 doctor.activTime!.Wed_Activ_From!=null? doctor.activTime!.Wed_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Wed_Activ_To!=null? doctor.activTime!.Wed_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Wednesday"),
             defualtContianerForTableRow1(
                 " Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Wed_Activ_From_Scond!=null? doctor.activTime!.Wed_Activ_From_Scond!:""),
               visible:doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Wed_Activ_To_Scond !=null? doctor.activTime!.Wed_Activ_To_Scond!:""),
               visible:doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Thurs_Activ_From!=null&&
               doctor.activTime!.Thurs_Activ_From!.isNotEmpty&&
               doctor.activTime!.Thurs_Activ_To!=null&&
               doctor.activTime!.Thurs_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Thurs_Activ_From!=null? doctor.activTime!.Thurs_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Thurs_Activ_To !=null ?doctor.activTime!.Thurs_Activ_To!:""),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Tuesday"),
             defualtContianerForTableRow1(
                 "Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible: doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Thurs_Activ_From_Scond !=null? doctor.activTime!.Thurs_Activ_From_Scond!:""),
               visible: doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:  doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Thurs_Activ_To_Scond !=null?   doctor.activTime!.Thurs_Activ_To_Scond!:""),
               visible: doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Fri_Activ_From!=null&&
               doctor.activTime!.Fri_Activ_From!.isNotEmpty&&
               doctor.activTime!.Fri_Activ_To!=null&&
               doctor.activTime!.Fri_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 "Friday"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Fri_Activ_From!=null? doctor.activTime!.Fri_Activ_From!:""),
             defualtContianerForTableRow(
                 "to "),
             defualtContianerForTableRow2(
                 doctor.activTime!.Fri_Activ_To!=null?doctor.activTime!.Fri_Activ_To!:""
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 "Friday"),
             defualtContianerForTableRow1(
                 "Closed"),
             defualtContianerForTableRow(
                 " "),
             defualtContianerForTableRow(
                 " "),
           ]),

           TableRow(children: [
             Visibility(
               child:
               defualtContianerForTableRow(
                   ''),
               visible:  doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Fri_Activ_From_Scond !=null?doctor.activTime!.Fri_Activ_From_Scond!:""),
               visible: doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   'to'),
               visible:  doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Fri_Activ_To_Scond !=null? doctor.activTime!.Fri_Activ_To_Scond!:""),
               visible: doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),
         ],
       )
           : SizedBox()

   );

 }