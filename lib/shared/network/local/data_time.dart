

 import 'package:flutter/cupertino.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/users/activ_time.dart';
import 'package:project/modules/users/doctors.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/shared/component/components.dart';

 bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

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
         border: TableBorder(
           horizontalInside:BorderSide(
             color: const Color.fromRGBO(119, 205, 188, 0.25)
           )
         ),
         children: [




           ////////////////////  Sunday
           hospital.Activ_Time!.Sun_Type_Activ!=null&&
               hospital.Activ_Time!.Sun_Type_Activ!&&

               hospital.Activ_Time!.Sun_Activ_From!=null&&
               hospital.Activ_Time!.Sun_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Sun_Activ_To!=null&&
               hospital.Activ_Time!.Sun_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Sunday":"الأحــد"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Sun_Activ_To!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"الـي"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Sun_Activ_From!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Sunday":"الأحــد"),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
               visible:  hospital.Activ_Time!.Sun_Type_Activ!=null&&
                   hospital.Activ_Time!.Sun_Type_Activ!&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Sun_Activ_From_Scond !=null  ?
                   hospital.Activ_Time!.Sun_Activ_From_Scond!:""
               ),
               visible:   hospital.Activ_Time!.Sun_Type_Activ!=null&&
                   hospital.Activ_Time!.Sun_Type_Activ!&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"الـي"),
               visible:  hospital.Activ_Time!.Sun_Type_Activ!=null&&
                   hospital.Activ_Time!.Sun_Type_Activ!&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Sun_Activ_To_Scond !=null ?
                   hospital.Activ_Time!.Sun_Activ_To_Scond!:""
               ),
               visible: hospital.Activ_Time!.Sun_Type_Activ!=null&&
                   hospital.Activ_Time!.Sun_Type_Activ!&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           //////////////////////////  Monday
           hospital.Activ_Time!.Mon_Type_Activ!=null&&
               hospital.Activ_Time!.Mon_Type_Activ!&&
               hospital.Activ_Time!.Mon_Activ_From!=null&&
               hospital.Activ_Time!.Mon_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Mon_Activ_To!=null&&
               hospital.Activ_Time!.Mon_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Monday":"الأثـنـيـن"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Mon_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"الـي"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Mon_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Monday":"الأثـنـيـن"),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
                 visible: hospital.Activ_Time!.Mon_Type_Activ!=null&&
                     hospital.Activ_Time!.Mon_Type_Activ!&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     hospital.Activ_Time!.Mon_Activ_From_Scond !=null ?
                     hospital.Activ_Time!.Mon_Activ_From_Scond!:''
                 ),
                 visible: hospital.Activ_Time!.Mon_Type_Activ!=null&&
                     hospital.Activ_Time!.Mon_Type_Activ!&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child:
                 defualtContianerForTableRow(
                     isEnglish?"to ":"الـي"),
                 visible: hospital.Activ_Time!.Mon_Type_Activ!=null&&
                     hospital.Activ_Time!.Mon_Type_Activ!&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     hospital.Activ_Time!.Mon_Activ_To_Scond !=null ?
                     hospital.Activ_Time!.Mon_Activ_To_Scond!:''
                 ),
                 visible: hospital.Activ_Time!.Mon_Type_Activ!=null&&
                     hospital.Activ_Time!.Mon_Type_Activ!&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_From_Scond!.isNotEmpty&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!=null&&
                     hospital.Activ_Time!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             )
           ]),

           ////
           //
           // Tuesday
           hospital.Activ_Time!.Tue_Type_Activ!=null&&
               hospital.Activ_Time!.Tue_Type_Activ!&&
               hospital.Activ_Time!.Tue_Activ_From!=null&&
               hospital.Activ_Time!.Tue_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Tue_Activ_To!=null&&
               hospital.Activ_Time!.Tue_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Tuesday":"الـثـلاثـاء"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Tue_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Tue_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Tuesday":"الـثـلاثـاء"),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
               visible: hospital.Activ_Time!.Tue_Type_Activ!=null&&
                   hospital.Activ_Time!.Tue_Type_Activ!&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(

                   hospital.Activ_Time!
                       .Tue_Activ_From_Scond !=null?  hospital.Activ_Time!.Tue_Activ_From_Scond!:""

               ),
               visible: hospital.Activ_Time!.Tue_Type_Activ!=null&&
                   hospital.Activ_Time!.Tue_Type_Activ!&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible: hospital.Activ_Time!.Tue_Type_Activ!=null&&
                   hospital.Activ_Time!.Tue_Type_Activ!&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Tue_Activ_To_Scond !=null?  hospital.Activ_Time!.Tue_Activ_To_Scond!:""
               ),
               visible: hospital.Activ_Time!.Tue_Type_Activ!=null&&
                   hospital.Activ_Time!.Tue_Type_Activ!&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Wed_Type_Activ!=null&&
               hospital.Activ_Time!.Wed_Type_Activ!&&
               hospital.Activ_Time!.Wed_Activ_From!=null&&
               hospital.Activ_Time!.Wed_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Wed_Activ_To!=null&&
               hospital.Activ_Time!.Wed_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Wednesday":"الأربـعـاء"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Wed_Activ_From! ),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Wed_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Wednesday":"الأربـعـاء"),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
               visible:  hospital.Activ_Time!.Wed_Type_Activ!=null&&
                   hospital.Activ_Time!.Wed_Type_Activ!&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Wed_Activ_From_Scond !=null?  hospital.Activ_Time!.Wed_Activ_From_Scond!:""

               ),
               visible:  hospital.Activ_Time!.Wed_Type_Activ!=null&&
                   hospital.Activ_Time!.Wed_Type_Activ!&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:  hospital.Activ_Time!.Wed_Type_Activ!=null&&
                   hospital.Activ_Time!.Wed_Type_Activ!&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Wed_Activ_To_Scond !=null ? hospital.Activ_Time!.Wed_Activ_To_Scond!:""

               ),
               visible:  hospital.Activ_Time!.Wed_Type_Activ!=null&&
                   hospital.Activ_Time!.Wed_Type_Activ!&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Thurs_Type_Activ!=null&&
               hospital.Activ_Time!.Thurs_Type_Activ!&&
               hospital.Activ_Time!.Thurs_Activ_From!=null&&
               hospital.Activ_Time!.Thurs_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Thurs_Activ_To!=null&&
               hospital.Activ_Time!.Thurs_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Thursday":"الـخـمـيـس"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Thurs_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Thurs_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Thursday":"الـخـمـيـس"),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
               visible:
               hospital.Activ_Time!.Thurs_Type_Activ!=null&&
                   hospital.Activ_Time!.Thurs_Type_Activ!&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Thurs_Activ_From_Scond !=null?  hospital.Activ_Time!.Thurs_Activ_From_Scond!:"" ),
               visible:
               hospital.Activ_Time!.Thurs_Type_Activ!=null&&
                   hospital.Activ_Time!.Thurs_Type_Activ!&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:
               hospital.Activ_Time!.Thurs_Type_Activ!=null&&
                   hospital.Activ_Time!.Thurs_Type_Activ!&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Thurs_Activ_To_Scond !=null?  hospital.Activ_Time!.Thurs_Activ_To_Scond!:""
               ),
               visible:
               hospital.Activ_Time!.Thurs_Type_Activ!=null&&
                   hospital.Activ_Time!.Thurs_Type_Activ!&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           hospital.Activ_Time!.Fri_Type_Activ!=null&&
               hospital.Activ_Time!.Fri_Type_Activ!&&
               hospital.Activ_Time!.Fri_Activ_From!=null&&
               hospital.Activ_Time!.Fri_Activ_From!.isNotEmpty&&
               hospital.Activ_Time!.Fri_Activ_To!=null&&
               hospital.Activ_Time!.Fri_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(isEnglish?"Friday":"الـجـمعـه" ),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!
                     .Fri_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 hospital.Activ_Time!.Fri_Activ_To!
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Friday":"الـجـمعـه" ),
             defualtContianerForTableRow1(
                 isEnglish?" Closed":"مـغـلـق"),
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
               visible:
               hospital.Activ_Time!.Fri_Type_Activ!=null&&
                   hospital.Activ_Time!.Fri_Type_Activ!&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:

               defualtContianerForTableRow2(

                   hospital.Activ_Time!.Fri_Activ_From_Scond !=null?  hospital.Activ_Time!.Fri_Activ_From_Scond!:''),

               visible:
               hospital.Activ_Time!.Fri_Type_Activ!=null&&
                   hospital.Activ_Time!.Fri_Type_Activ!&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:
               hospital.Activ_Time!.Fri_Type_Activ!=null&&
                   hospital.Activ_Time!.Fri_Type_Activ!&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   hospital.Activ_Time!.Fri_Activ_To_Scond !=null?
                   hospital.Activ_Time!.Fri_Activ_To_Scond!:''),
               visible:
               hospital.Activ_Time!.Fri_Type_Activ!=null&&
                   hospital.Activ_Time!.Fri_Type_Activ!&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_From_Scond!.isNotEmpty&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!=null&&
                   hospital.Activ_Time!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),
         ],
       ): SizedBox()

   );


 }

 ///////////////////////////////////////////////////////////////////



 displayDataTimeInInputScreen({required ActivTime ? worktime,required  bool isEngish}){

   if(worktime != null &&
       worktime.Table_Activ_Time != null)
       worktime.Table_Activ_Time!.id ==1;


   return

        Table(
     columnWidths: {
       2: FractionColumnWidth(0.15)
     },
     defaultVerticalAlignment:
     TableCellVerticalAlignment.middle,
     children: [

       worktime!.Sat_Type_Activ !=null&&
           worktime.Sat_Type_Activ!&&
           worktime.Sat_Activ_From!=null&&
           worktime.Sat_Activ_From!.isNotEmpty&&
           worktime.Sat_Activ_To!=null&&
           worktime.Sat_Activ_To!.isNotEmpty



           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Saturday "
                 : "الـسـبـت"),
         defualtContianerForTableRow2(
             worktime.Sat_Activ_From !=null?  worktime.Sat_Activ_From!:""   ),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime.Sat_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Saturday "
                 : "الـسـبـت"),
         defualtContianerForTableRow1(
             isEnglish ? " Closed" : "مـغـلـق"),
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
             visible:
             worktime.Sat_Type_Activ !=null&&
                 worktime.Sat_Type_Activ!&&
                 worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Sat_Activ_From_Scond !=null?
                 worktime.Sat_Activ_From_Scond!:""
             ),
             visible:
             worktime.Sat_Type_Activ !=null&&
                 worktime.Sat_Type_Activ!&&
                 worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child:
             defualtContianerForTableRow(
                 isEngish?"to ":"إلـى"),
             visible:
             worktime.Sat_Type_Activ !=null&&
                 worktime.Sat_Type_Activ!&&
                 worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Sat_Activ_To_Scond !=null ?
                 worktime.Sat_Activ_To_Scond!:""
             ),
             visible:
             worktime.Sat_Type_Activ !=null&&
                 worktime.Sat_Type_Activ!&&
                 worktime.Sat_Activ_From_Scond!=null&&
                 worktime.Sat_Activ_From_Scond!.isNotEmpty&&
                 worktime.Sat_Activ_To_Scond!=null&&
                 worktime.Sat_Activ_To_Scond!.isNotEmpty?true:false
         )
       ]),

       ////////////////////  Sunday
       worktime.Sun_Type_Activ!=null&&
           worktime.Sun_Type_Activ!&&

           worktime.Sun_Activ_From!=null&&
           worktime.Sun_Activ_From!.isNotEmpty&&
           worktime.Sun_Activ_To!=null&&
           worktime.Sun_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish ? "Sunday " : "الأحــد"),
         defualtContianerForTableRow2(
             worktime.Sun_Activ_To!),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime
                 .Sun_Activ_From!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish ? "Sunday " : "الأحــد"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
           visible:   worktime.Sun_Type_Activ!=null&&
               worktime.Sun_Type_Activ!&&
               worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Sun_Activ_From_Scond !=null  ?
               worktime.Sun_Activ_From_Scond!:""
           ),
           visible:    worktime.Sun_Type_Activ!=null&&
               worktime.Sun_Type_Activ!&&
               worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               isEngish?"to ":"إلـى"),
           visible:   worktime.Sun_Type_Activ!=null&&
               worktime.Sun_Type_Activ!&&
               worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Sun_Activ_To_Scond !=null ?
               worktime.Sun_Activ_To_Scond!:""
           ),
           visible:  worktime.Sun_Type_Activ!=null&&
               worktime.Sun_Type_Activ!&&
               worktime.Sun_Activ_From_Scond!=null&&
               worktime.Sun_Activ_From_Scond!.isNotEmpty&&
               worktime.Sun_Activ_To_Scond!=null&&
               worktime.Sun_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       //////////////////////////  Monday
       worktime.Mon_Type_Activ!=null&&
           worktime.Mon_Type_Activ!&&
           worktime.Mon_Activ_From!=null&&
           worktime.Mon_Activ_From!.isNotEmpty&&
           worktime.Mon_Activ_To!=null&&
           worktime.Mon_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Monday "
                 : "الأثـنـيـن"),
         defualtContianerForTableRow2(
             worktime
                 .Mon_Activ_From!),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime.Mon_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Monday "
                 : "الأثـنـيـن"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
             visible:  worktime.Mon_Type_Activ!=null&&
                 worktime.Mon_Type_Activ!&&
                 worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Mon_Activ_From_Scond !=null ?
                 worktime.Mon_Activ_From_Scond!:''
             ),
             visible:  worktime.Mon_Type_Activ!=null&&
                 worktime.Mon_Type_Activ!&&
                 worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child:
             defualtContianerForTableRow(
                 isEngish?"to ":"إلـى"),
             visible:  worktime.Mon_Type_Activ!=null&&
                 worktime.Mon_Type_Activ!&&
                 worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         ),
         Visibility(
             child: defualtContianerForTableRow2(
                 worktime.Mon_Activ_To_Scond !=null ?
                 worktime.Mon_Activ_To_Scond!:''
             ),
             visible:  worktime.Mon_Type_Activ!=null&&
                 worktime.Mon_Type_Activ!&&
                 worktime.Mon_Activ_From_Scond!=null&&
                 worktime.Mon_Activ_From_Scond!.isNotEmpty&&
                 worktime.Mon_Activ_To_Scond!=null&&
                 worktime.Mon_Activ_To_Scond!.isNotEmpty?true:false
         )
       ]),

       ////
       //
       // Tuesday
       worktime.Tue_Type_Activ!=null&&
           worktime.Tue_Type_Activ!&&
           worktime.Tue_Activ_From!=null&&
           worktime.Tue_Activ_From!.isNotEmpty&&
           worktime.Tue_Activ_To!=null&&
           worktime.Tue_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Tuesday"
                 : "الـثـلاثـاء"),
         defualtContianerForTableRow2(
             worktime
                 .Tue_Activ_From!),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime.Tue_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Tuesday"
                 : "الـثـلاثـاء"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
           visible:  worktime.Tue_Type_Activ!=null&&
               worktime.Tue_Type_Activ!&&
               worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(

               worktime
                   .Tue_Activ_From_Scond !=null?   worktime.Tue_Activ_From_Scond!:""

           ),
           visible:  worktime.Tue_Type_Activ!=null&&
               worktime.Tue_Type_Activ!&&
               worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:  worktime.Tue_Type_Activ!=null&&
               worktime.Tue_Type_Activ!&&
               worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Tue_Activ_To_Scond !=null?   worktime.Tue_Activ_To_Scond!:""
           ),
           visible:  worktime.Tue_Type_Activ!=null&&
               worktime.Tue_Type_Activ!&&
               worktime.Tue_Activ_From_Scond!=null&&
               worktime.Tue_Activ_From_Scond!.isNotEmpty&&
               worktime.Tue_Activ_To_Scond!=null&&
               worktime.Tue_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Wed_Type_Activ!=null&&
           worktime.Wed_Type_Activ!&&
           worktime.Wed_Activ_From!=null&&
           worktime.Wed_Activ_From!.isNotEmpty&&
           worktime.Wed_Activ_To!=null&&
           worktime.Wed_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish?"Wednesday":"الأربـعـاء"),
         defualtContianerForTableRow2(
             worktime.Wed_Activ_From! ),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime
                 .Wed_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish?"Wednesday":"الأربـعـاء"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
           visible:   worktime.Wed_Type_Activ!=null&&
               worktime.Wed_Type_Activ!&&
               worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Wed_Activ_From_Scond !=null?   worktime.Wed_Activ_From_Scond!:""

           ),
           visible:   worktime.Wed_Type_Activ!=null&&
               worktime.Wed_Type_Activ!&&
               worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               isEngish?"to ":"إلـى"),
           visible:   worktime.Wed_Type_Activ!=null&&
               worktime.Wed_Type_Activ!&&
               worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Wed_Activ_To_Scond !=null ?  worktime.Wed_Activ_To_Scond!:""

           ),
           visible:   worktime.Wed_Type_Activ!=null&&
               worktime.Wed_Type_Activ!&&
               worktime.Wed_Activ_From_Scond!=null&&
               worktime.Wed_Activ_From_Scond!.isNotEmpty&&
               worktime.Wed_Activ_To_Scond!=null&&
               worktime.Wed_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Thurs_Type_Activ!=null&&
           worktime.Thurs_Type_Activ!&&
           worktime.Thurs_Activ_From!=null&&
           worktime.Thurs_Activ_From!.isNotEmpty&&
           worktime.Thurs_Activ_To!=null&&
           worktime.Thurs_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Thursday "
                 : "الـخـمـيـس"),
         defualtContianerForTableRow2(
             worktime
                 .Thurs_Activ_From!),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime
                 .Thurs_Activ_To!),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish
                 ? "Thursday "
                 : "الـخـمـيـس"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
           visible:
           worktime.Thurs_Type_Activ!=null&&
               worktime.Thurs_Type_Activ!&&
               worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Thurs_Activ_From_Scond !=null?   worktime.Thurs_Activ_From_Scond!:"" ),
           visible:
           worktime.Thurs_Type_Activ!=null&&
               worktime.Thurs_Type_Activ!&&
               worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               'to'),
           visible:
           worktime.Thurs_Type_Activ!=null&&
               worktime.Thurs_Type_Activ!&&
               worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Thurs_Activ_To_Scond !=null?   worktime.Thurs_Activ_To_Scond!:""
           ),
           visible:
           worktime.Thurs_Type_Activ!=null&&
               worktime.Thurs_Type_Activ!&&
               worktime.Thurs_Activ_From_Scond!=null&&
               worktime.Thurs_Activ_From_Scond!.isNotEmpty&&
               worktime.Thurs_Activ_To_Scond!=null&&
               worktime.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),

       worktime.Fri_Type_Activ!=null&&
           worktime.Fri_Type_Activ!&&
           worktime.Fri_Activ_From!=null&&
           worktime.Fri_Activ_From!.isNotEmpty&&
           worktime.Fri_Activ_To!=null&&
           worktime.Fri_Activ_To!.isNotEmpty
           ? TableRow(children: [
         defualtContianerForTableRow(
             isEngish ? "Friday" : "الـجـمعـه"),
         defualtContianerForTableRow2(
             worktime
                 .Fri_Activ_From!),
         defualtContianerForTableRow(
             isEngish?"to ":"إلـى"),
         defualtContianerForTableRow2(
             worktime.Fri_Activ_To!
         ),
       ])
           : TableRow(children: [
         defualtContianerForTableRow(
             isEngish ? "Friday" : "الـجـمعـه"),
         defualtContianerForTableRow1(
             isEngish ? " Closed" : "مـغـلـق"),
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
           visible:
           worktime.Fri_Type_Activ!=null&&
               worktime.Fri_Type_Activ!&&
               worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:

           defualtContianerForTableRow2(

               worktime.Fri_Activ_From_Scond !=null?   worktime.Fri_Activ_From_Scond!:''),

           visible:
           worktime.Fri_Type_Activ!=null&&
               worktime.Fri_Type_Activ!&&
               worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child:
           defualtContianerForTableRow(
               isEngish?"to ":"إلـى"),
           visible:
           worktime.Fri_Type_Activ!=null&&
               worktime.Fri_Type_Activ!&&
               worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         ),
         Visibility(
           child: defualtContianerForTableRow2(
               worktime.Fri_Activ_To_Scond !=null?
               worktime.Fri_Activ_To_Scond!:''),
           visible:
           worktime.Fri_Type_Activ!=null&&
               worktime.Fri_Type_Activ!&&
               worktime.Fri_Activ_From_Scond!=null&&
               worktime.Fri_Activ_From_Scond!.isNotEmpty&&
               worktime.Fri_Activ_To_Scond!=null&&
               worktime.Fri_Activ_To_Scond!.isNotEmpty?true:false,
         )
       ]),
     ],
   );
 }

 displayDataTimeInDoctorScreen({required bool isSmallActiveTime ,required Doctors doctor } ){

   return Visibility(
       visible: isSmallActiveTime,
       child:doctor.activTime != null &&
           doctor.activTime!.Table_Activ_Time != null &&
           doctor.activTime!.Table_Activ_Time!.id == 1


           ? Table(
         columnWidths: {
           2: FractionColumnWidth(0.15)
         },
         defaultVerticalAlignment:
         TableCellVerticalAlignment.middle,
         children: [

           doctor.activTime!.Sat_Type_Activ !=null&&
               doctor.activTime!.Sat_Type_Activ!&&
               doctor.activTime!.Sat_Activ_From!=null&&
               doctor.activTime!.Sat_Activ_From!.isNotEmpty&&
               doctor.activTime!.Sat_Activ_To!=null&&
               doctor.activTime!.Sat_Activ_To!.isNotEmpty



               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Saturday "
                     : "الـسـبـت"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Sat_Activ_From !=null? doctor.activTime!.Sat_Activ_From!:""   ),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Sat_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Saturday "
                     : "الـسـبـت"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
                 visible:
                 doctor.activTime!.Sat_Type_Activ !=null&&
                     doctor.activTime!.Sat_Type_Activ!&&
                     doctor.activTime!.Sat_Activ_From_Scond!=null&&
                     doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Sat_Activ_To_Scond!=null&&
                     doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     doctor.activTime!.Sat_Activ_From_Scond !=null?
                     doctor.activTime!.Sat_Activ_From_Scond!:""
                 ),
                 visible:
                 doctor.activTime!.Sat_Type_Activ !=null&&
                     doctor.activTime!.Sat_Type_Activ!&&
                     doctor.activTime!.Sat_Activ_From_Scond!=null&&
                     doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Sat_Activ_To_Scond!=null&&
                     doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child:
                 defualtContianerForTableRow(
                     isEnglish?"to ":"إلـى"),
                 visible:
                 doctor.activTime!.Sat_Type_Activ !=null&&
                     doctor.activTime!.Sat_Type_Activ!&&
                     doctor.activTime!.Sat_Activ_From_Scond!=null&&
                     doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Sat_Activ_To_Scond!=null&&
                     doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     doctor.activTime!.Sat_Activ_To_Scond !=null ?
                     doctor.activTime!.Sat_Activ_To_Scond!:""
                 ),
                 visible:
                 doctor.activTime!.Sat_Type_Activ !=null&&
                     doctor.activTime!.Sat_Type_Activ!&&
                     doctor.activTime!.Sat_Activ_From_Scond!=null&&
                     doctor.activTime!.Sat_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Sat_Activ_To_Scond!=null&&
                     doctor.activTime!.Sat_Activ_To_Scond!.isNotEmpty?true:false
             )
           ]),

           ////////////////////  Sunday
           doctor.activTime!.Sun_Type_Activ!=null&&
               doctor.activTime!.Sun_Type_Activ!&&

               doctor.activTime!.Sun_Activ_From!=null&&
               doctor.activTime!.Sun_Activ_From!.isNotEmpty&&
               doctor.activTime!.Sun_Activ_To!=null&&
               doctor.activTime!.Sun_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish ? "Sunday " : "الأحــد"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Sun_Activ_To!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Sun_Activ_From!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish ? "Sunday " : "الأحــد"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
               visible:  doctor.activTime!.Sun_Type_Activ!=null&&
                   doctor.activTime!.Sun_Type_Activ!&&
                   doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Sun_Activ_From_Scond !=null  ?
                   doctor.activTime!.Sun_Activ_From_Scond!:""
               ),
               visible:   doctor.activTime!.Sun_Type_Activ!=null&&
                   doctor.activTime!.Sun_Type_Activ!&&
                   doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:  doctor.activTime!.Sun_Type_Activ!=null&&
                   doctor.activTime!.Sun_Type_Activ!&&
                   doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Sun_Activ_To_Scond !=null ?
                   doctor.activTime!.Sun_Activ_To_Scond!:""
               ),
               visible: doctor.activTime!.Sun_Type_Activ!=null&&
                   doctor.activTime!.Sun_Type_Activ!&&
                   doctor.activTime!.Sun_Activ_From_Scond!=null&&
                   doctor.activTime!.Sun_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Sun_Activ_To_Scond!=null&&
                   doctor.activTime!.Sun_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           //////////////////////////  Monday
           doctor.activTime!.Mon_Type_Activ!=null&&
               doctor.activTime!.Mon_Type_Activ!&&
               doctor.activTime!.Mon_Activ_From!=null&&
               doctor.activTime!.Mon_Activ_From!.isNotEmpty&&
               doctor.activTime!.Mon_Activ_To!=null&&
               doctor.activTime!.Mon_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Monday "
                     : "الأثـنـيـن"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Mon_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Mon_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Monday "
                     : "الأثـنـيـن"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
                 visible: doctor.activTime!.Mon_Type_Activ!=null&&
                     doctor.activTime!.Mon_Type_Activ!&&
                     doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     doctor.activTime!.Mon_Activ_From_Scond !=null ?
                     doctor.activTime!.Mon_Activ_From_Scond!:''
                 ),
                 visible: doctor.activTime!.Mon_Type_Activ!=null&&
                     doctor.activTime!.Mon_Type_Activ!&&
                     doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child:
                 defualtContianerForTableRow(
                     isEnglish?"to ":"إلـى"),
                 visible: doctor.activTime!.Mon_Type_Activ!=null&&
                     doctor.activTime!.Mon_Type_Activ!&&
                     doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             ),
             Visibility(
                 child: defualtContianerForTableRow2(
                     doctor.activTime!.Mon_Activ_To_Scond !=null ?
                     doctor.activTime!.Mon_Activ_To_Scond!:''
                 ),
                 visible: doctor.activTime!.Mon_Type_Activ!=null&&
                     doctor.activTime!.Mon_Type_Activ!&&
                     doctor.activTime!.Mon_Activ_From_Scond!=null&&
                     doctor.activTime!.Mon_Activ_From_Scond!.isNotEmpty&&
                     doctor.activTime!.Mon_Activ_To_Scond!=null&&
                     doctor.activTime!.Mon_Activ_To_Scond!.isNotEmpty?true:false
             )
           ]),

           ////
           //
           // Tuesday
           doctor.activTime!.Tue_Type_Activ!=null&&
               doctor.activTime!.Tue_Type_Activ!&&
               doctor.activTime!.Tue_Activ_From!=null&&
               doctor.activTime!.Tue_Activ_From!.isNotEmpty&&
               doctor.activTime!.Tue_Activ_To!=null&&
               doctor.activTime!.Tue_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Tuesday"
                     : "الـثـلاثـاء"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Tue_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Tue_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Tuesday"
                     : "الـثـلاثـاء"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
               visible: doctor.activTime!.Tue_Type_Activ!=null&&
                   doctor.activTime!.Tue_Type_Activ!&&
                   doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(

                   doctor.activTime!
                       .Tue_Activ_From_Scond !=null?  doctor.activTime!.Tue_Activ_From_Scond!:""

               ),
               visible: doctor.activTime!.Tue_Type_Activ!=null&&
                   doctor.activTime!.Tue_Type_Activ!&&
                   doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible: doctor.activTime!.Tue_Type_Activ!=null&&
                   doctor.activTime!.Tue_Type_Activ!&&
                   doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Tue_Activ_To_Scond !=null?  doctor.activTime!.Tue_Activ_To_Scond!:""
               ),
               visible: doctor.activTime!.Tue_Type_Activ!=null&&
                   doctor.activTime!.Tue_Type_Activ!&&
                   doctor.activTime!.Tue_Activ_From_Scond!=null&&
                   doctor.activTime!.Tue_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Tue_Activ_To_Scond!=null&&
                   doctor.activTime!.Tue_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Wed_Type_Activ!=null&&
               doctor.activTime!.Wed_Type_Activ!&&
               doctor.activTime!.Wed_Activ_From!=null&&
               doctor.activTime!.Wed_Activ_From!.isNotEmpty&&
               doctor.activTime!.Wed_Activ_To!=null&&
               doctor.activTime!.Wed_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Wednesday":"الأربـعـاء"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Wed_Activ_From! ),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Wed_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish?"Wednesday":"الأربـعـاء"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
               visible:  doctor.activTime!.Wed_Type_Activ!=null&&
                   doctor.activTime!.Wed_Type_Activ!&&
                   doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Wed_Activ_From_Scond !=null?  doctor.activTime!.Wed_Activ_From_Scond!:""

               ),
               visible:  doctor.activTime!.Wed_Type_Activ!=null&&
                   doctor.activTime!.Wed_Type_Activ!&&
                   doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:  doctor.activTime!.Wed_Type_Activ!=null&&
                   doctor.activTime!.Wed_Type_Activ!&&
                   doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Wed_Activ_To_Scond !=null ? doctor.activTime!.Wed_Activ_To_Scond!:""

               ),
               visible:  doctor.activTime!.Wed_Type_Activ!=null&&
                   doctor.activTime!.Wed_Type_Activ!&&
                   doctor.activTime!.Wed_Activ_From_Scond!=null&&
                   doctor.activTime!.Wed_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Wed_Activ_To_Scond!=null&&
                   doctor.activTime!.Wed_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Thurs_Type_Activ!=null&&
               doctor.activTime!.Thurs_Type_Activ!&&
               doctor.activTime!.Thurs_Activ_From!=null&&
               doctor.activTime!.Thurs_Activ_From!.isNotEmpty&&
               doctor.activTime!.Thurs_Activ_To!=null&&
               doctor.activTime!.Thurs_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Thursday "
                     : "الـخـمـيـس"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Thurs_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Thurs_Activ_To!),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish
                     ? "Thursday "
                     : "الـخـمـيـس"),
             defualtContianerForTableRow1(
                 isEnglish ? " Closed" : "مـغـلـق"),
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
               visible:
               doctor.activTime!.Thurs_Type_Activ!=null&&
                   doctor.activTime!.Thurs_Type_Activ!&&
                   doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Thurs_Activ_From_Scond !=null?  doctor.activTime!.Thurs_Activ_From_Scond!:"" ),
               visible:
               doctor.activTime!.Thurs_Type_Activ!=null&&
                   doctor.activTime!.Thurs_Type_Activ!&&
                   doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:
               doctor.activTime!.Thurs_Type_Activ!=null&&
                   doctor.activTime!.Thurs_Type_Activ!&&
                   doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Thurs_Activ_To_Scond !=null?  doctor.activTime!.Thurs_Activ_To_Scond!:""
               ),
               visible:
               doctor.activTime!.Thurs_Type_Activ!=null&&
                   doctor.activTime!.Thurs_Type_Activ!&&
                   doctor.activTime!.Thurs_Activ_From_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Thurs_Activ_To_Scond!=null&&
                   doctor.activTime!.Thurs_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),

           doctor.activTime!.Fri_Type_Activ!=null&&
               doctor.activTime!.Fri_Type_Activ!&&
               doctor.activTime!.Fri_Activ_From!=null&&
               doctor.activTime!.Fri_Activ_From!.isNotEmpty&&
               doctor.activTime!.Fri_Activ_To!=null&&
               doctor.activTime!.Fri_Activ_To!.isNotEmpty
               ? TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish ? "Friday" : "الـجـمعـه"),
             defualtContianerForTableRow2(
                 doctor.activTime!
                     .Fri_Activ_From!),
             defualtContianerForTableRow(
                 isEnglish?"to ":"إلـى"),
             defualtContianerForTableRow2(
                 doctor.activTime!.Fri_Activ_To!
             ),
           ])
               : TableRow(children: [
             defualtContianerForTableRow(
                 isEnglish ? "Friday" : "الـجـمعـه"),
             defualtContianerForTableRow1(
                isEnglish ? " Closed" : "مـغـلـق",),
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
               visible:
               doctor.activTime!.Fri_Type_Activ!=null&&
                   doctor.activTime!.Fri_Type_Activ!&&
                   doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:

               defualtContianerForTableRow2(

                   doctor.activTime!.Fri_Activ_From_Scond !=null?  doctor.activTime!.Fri_Activ_From_Scond!:''),

               visible:
               doctor.activTime!.Fri_Type_Activ!=null&&
                   doctor.activTime!.Fri_Type_Activ!&&
                   doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child:
               defualtContianerForTableRow(
                   isEnglish?"to ":"إلـى"),
               visible:
               doctor.activTime!.Fri_Type_Activ!=null&&
                   doctor.activTime!.Fri_Type_Activ!&&
                   doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             ),
             Visibility(
               child: defualtContianerForTableRow2(
                   doctor.activTime!.Fri_Activ_To_Scond !=null?
                   doctor.activTime!.Fri_Activ_To_Scond!:''),
               visible:
               doctor.activTime!.Fri_Type_Activ!=null&&
                   doctor.activTime!.Fri_Type_Activ!&&
                   doctor.activTime!.Fri_Activ_From_Scond!=null&&
                   doctor.activTime!.Fri_Activ_From_Scond!.isNotEmpty&&
                   doctor.activTime!.Fri_Activ_To_Scond!=null&&
                   doctor.activTime!.Fri_Activ_To_Scond!.isNotEmpty?true:false,
             )
           ]),
         ],
       ): SizedBox()

   );


 }

 ///////////////////////////////////////////////////////////////////

