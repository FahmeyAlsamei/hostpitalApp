
import

































































































































































































































'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/config/data.dart';
import 'package:project/config/path.dart';
import 'package:project/modules/users/activ_time.dart';

import 'package:project/modules/users/hospital_model.dart';

class ActivTimeApiProvider with ChangeNotifier {
  ActivTimeApiProvider() {
    //this.fetchTasks();
  }

  List<ActivTime> _todos = [];
  List<ActivTime> _ActivTimeErr = [];

  List<ActivTime> get todos {
    return [..._todos];
  }

  int ChckLogIN = 0;


  Future<ActivTime>addActivTime(ActivTime activTimeInput) async {

    final unencodedPath =
        '/api/ActivTime/';
    // var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    // "id": 9,
    // "url": "https://testmyguideatmyphone.pythonanywhere.com/RowadMarketing-api/v8/ActivTimeInfo/ActivTimeRegisterAndLogIn/9/",
    // "Frist_Name": null,
    // "last_Name": null,
    // "Synopsis": null,
    // "Name": "hxbxnbxnb",
    // "Email": "jshsgsh@hdghdgd.com",
    // "Gender": null,
    // "Date_Update": "2022-02-08T18:55:11.631456Z",
    // "Date_Added": "2022-02-08T18:55:11.631494Z",
    // "IMEI_device": "1efa300ab8ca2438",
    // "password": "ddddd",
    // "session_no": "LJr3BchzQ8IwY1uZijz36qgWLTm",
    // "ActivTimeName": "dddd",
    // "PhoneNo": "737310611",
    // "keyVerify": [],
    // "images_main": null,
    // "KeyActiveStatus": true

    var response = await http.post(url,
      // final response = await http.post(url,
          headers:
          {
            "Content-Type": "application/json",
            //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

          }
       ,
            body: jsonEncode(activTimeInput.toJsonForSaveNew())
    );

    // request.headers=PathAPI.Header;

    //request.fields['Frist_Name'] = ActivTime.fristName;



    // var streamedResponse = await request.send();

    // var response = await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));
    // final response = await http.post(url,
    //     headers:
    //     {
    //       "Content-Type": "application/json",
    //       //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
    //
    //     }
    //  ,
    //       body: jsonEncode(ActivTime.toJsonsave()));
    ////
    ////
    if (response.statusCode == 201) {
      //ActivTime.id = json.decode(response.body)['id'];
      //_todos.add(ActivTime);
      // Future<List<ActivTime> >

      ////

      ActivTime activTime_out = ActivTime.fromJsonSave(
          json.decode(utf8.decode(response.bodyBytes)));
      // AppData.MyActivTime.add(ActivTime);

      notifyListeners();

      return      activTime_out;
    } else {
      // var data = utf8.decode(response.bodyBytes);

      // _ActivTimeErr =data.toList();

      return    activTimeInput;

      // if( data.Email.toString().isNotEmpty){
      //     return "التأكد من صحة البريد او قد يكون موجود من سابق";
      // }
      //  if( data["ActivTimeName"].toString().isNotEmpty){
      //     return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //   }
      //
      //  if( data["ActivTimeName"].toString().isNotEmpty){
      //      return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //  }

/*      'id': id,
     'ActivTimeName': ActivTimeName,
     'Name': Name,
     'KeyActiveStatus':KeyActiveStatus,
     'Email':Email,
     'keyVerify':KeyActiveStatus,
     'Detial_AR':Detial_AR,
     'PhoneNo':PhoneNo,
     'session_no':session_no,


     "images_main": images_main*/

      // ////data[0]);
      //  ////data.Email);

      // return response.body.toString();
    }
  }




//  Future <List<ActivTime>> fetchAllActivTime(bool is_clinic,bool is_farmacy,bool is_ActivTime,
//   bool is_radiation,
//   bool is_laboratry,
//      ) async {
//
//     // await http.get(url,headers: PathAPI.Header);
//     // if (response != null) if (response.statusCode == 200) {
//     //   ////"dataActivTime");
//
//     var unencodedPath = "/api/ActivTime/";
//     ////"https://"+PathAPI.PATH_MAIN_API+unencodedPath+"?format=json");
//     var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
//         {"format": "json",
//         'is_clinic': "$is_clinic",
//           'is_farmacy': "$is_farmacy",
//           'is_ActivTime': "$is_ActivTime",
//           'is_radiation': "$is_radiation",
//           'is_laboratry': "$is_laboratry",
//         });
//     ////"https://"+url.host+url.path+url.query);
//     //
//     //url.query.toString());
//     ////url.isAbsolute);
//     print(url.scheme+"://"+url.host+url.path+"?"+url.query);
//
//     final response = await http.get(url, headers: PathAPI.Header);
//     // print(response.statusCode);
//     // print(response.body);
//
//
//     ////
//     if (response != null){
//       if (response.statusCode == 200) {
//         var datamap= json.decode(utf8.decode(response.bodyBytes));
//         // print(datamap);
//
//         List data=datamap["results"] as List;
//         print(data);
//         // var datas= datamap.map<ActivTime>((json){
//         //    print(json);
//         //    AppData.MyActivTime.add(ActivTime.fromMap(json));
//         //
//         //    return ActivTime.fromMap(json);
//         //  });
//         // print(datas);
//
//         // print(datamap["results"].map<ActivTime>((json) => ActivTime.fromMap(json)).toList());
//         // AppData.MyActivTime = data.map<ActivTime>((json) => ActivTime.fromMap(json)).toList();
//         // print(AppData.MyActivTime);
//
//         // for(var i=0;i<; in data.length) {
//         data.forEach((ActivTime) async {
//           print( ActivTime);
//           // AppData.MyActivTime.length>0
//           // print(AppData.MyActivTime.indexWhere((element) => element.id==ActivTime['id']));
//           // var idSet = <int>{};
//           // idSet.add(ActivTime['id']);
//
//           // if(idSet.contains(ActivTime['id']))
//
//           //   if(datamap["count"]>AppData.MyActivTime.length)
//           AppData.MyActivTime.add(ActivTime.fromMap(ActivTime));
//
//           AppData.MyActivTime=AppData.MyActivTime.toSet().toList();
//         });
//         print(await 'ActivTime');
//         // AppData.MyActivTime.add(ActivTime);
//
//         return AppData.MyActivTime;
//
//       } else {
//         return AppData.MyActivTime;
//       }
//     }
//     return AppData.MyActivTime;
//     // return AppData.MyActivTime;
//
//
//    // notifyListeners();
// //  return  data;
//
//     // fetchTasks() async {
//     //   var unencodedPath="/api/ActivTime/?format=json";
//     //   var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
//     //   final response = await http.get(url,headers: PathAPI.Header);
//     //   if (response != null) if (response.statusCode == 200) {
//     //     var data = json.decode(response.body) as List;
//     //     _todos = data.map<ActivTime>((json) => ActivTime.fromMapForSave(json)).toList();
//     //     notifyListeners();
//     //   }
//   }

  // Future<ActivTime>fetchOneActivTime(int id) async {
  //
  //   var unencodedPath = "/api/ActivTime/${id}/?format=json";
  //   var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
  //   final response = await http.get(url, headers: PathAPI.Header);
  //   ActivTime ActivTime=ActivTime(id: id);
  //   if (response != null) if (response.statusCode == 200) {
  //
  //     var data = json.decode(response.body);
  //     print(data);
  //      ActivTime = ActivTime.fromMapForSave(
  //         json.decode(utf8.decode(response.bodyBytes)));
  //     _todos = data.map<ActivTime>((json) => ActivTime.fromMapForSave(json)).toList();
  //
  //     return ActivTime;
  //     ////_todos);
  //     // notifyListeners();
  //   }
  //   return ActivTime;
  // }
}
