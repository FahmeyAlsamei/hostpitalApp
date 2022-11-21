import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/config/data.dart';
import 'package:project/config/path.dart';
import 'package:project/modules/users/doctors.dart';

class DoctorsProvider with ChangeNotifier{

  DoctorsProvider(){

  }

  List<Doctors> _todos=[];

  List<Doctors> get(){
    return [..._todos];
  }

  Future <List<Doctors>> fetchAllDoctors() async {

    // await http.get(url,headers: PathAPI.Header);
    // if (response != null) if (response.statusCode == 200) {
    //   ////"dataHospital");

    var unencodedPath = "/api/Doctors/";
    ////"https://"+PathAPI.PATH_MAIN_API+unencodedPath+"?format=json");
    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
        {"format": "json",
          // 'is_clinic': "$is_clinic",
          // 'is_farmacy': "$is_farmacy",
          // 'is_hospital': "$is_hospital",
          // 'is_radiation': "$is_radiation",
          // 'is_laboratry': "$is_laboratry",
        });
    ////"https://"+url.host+url.path+url.query);
    //
    //url.query.toString());
    ////url.isAbsolute);
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    final response = await http.get(url, headers: PathAPI.Header);
    // print(response.statusCode);
    // print(response.body);


    ////
    if (response != null){
      if (response.statusCode == 200) {
        var datamap= json.decode(utf8.decode(response.bodyBytes));
        // print(datamap);

        List data=datamap["results"] as List;
        print(data);
        // var datas= datamap.map<Hospital>((json){
        //    print(json);
        //    AppData.MyHospital.add(Hospital.fromMap(json));
        //
        //    return Hospital.fromMap(json);
        //  });
        // print(datas);

        // print(datamap["results"].map<Hospital>((json) => Hospital.fromMap(json)).toList());
        // AppData.MyHospital = data.map<Hospital>((json) => Hospital.fromMap(json)).toList();
        // print(AppData.MyHospital);

        // for(var i=0;i<; in data.length) {
        data.forEach((doctors) async {
          print( doctors);
          // AppData.MyHospital.length>0
          // print(AppData.MyHospital.indexWhere((element) => element.id==hospital['id']));
          // var idSet = <int>{};
          // idSet.add(hospital['id']);

          // if(idSet.contains(hospital['id']))

          //   if(datamap["count"]>AppData.MyHospital.length)
          AppData.ListDoctror.add(Doctors.fromJson(doctors));

          // AppData.ListDoctror=AppData.ListDoctror.toSet().toList();

          var set = <int>{};
          AppData.ListDoctror =  AppData.ListDoctror.where((e) => set.add(e.id!)).toList();

        });
        print(await 'hospital');
        // AppData.MyHospital.add(hospital);

        return AppData.ListDoctror;

      } else {
        return AppData.ListDoctror;
      }
    }
    return AppData.ListDoctror;
    // return AppData.MyHospital;


    // notifyListeners();
//  return  data;

    // fetchTasks() async {
    //   var unencodedPath="/api/Hospital/?format=json";
    //   var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
    //   final response = await http.get(url,headers: PathAPI.Header);
    //   if (response != null) if (response.statusCode == 200) {
    //     var data = json.decode(response.body) as List;
    //     _todos = data.map<Hospital>((json) => Hospital.fromMapForSave(json)).toList();
    //     notifyListeners();
    //   }
  }


  // Future<Doctors> addDoctor(Doctors doctor) async{
  //
  //   final unencodedPath =
  //       '/api/DoctorSave/';
  //
  //  var url=Uri.https(PathAPI.PATH_MAIN_API_local_local, unencodedPath);
  //
  //  var request=http.MultipartRequest(
  //    'Post',
  //    url
  //  );
  //  request.headers.addAll(PathAPI.Header);
  //
  //  if(doctor.images_main !=null && doctor.images_main!.isNotEmpty)
  //    request.files.add(
  //     await http.MultipartFile.fromPath('images_main', doctor.images_main??"")
  //    );
  //
  //
  // }
  Future<Doctors?> addDoctors(Doctors DoctorsInput) async {

    // Doctors.DoctorsName = Doctors.DoctorsName.contains(other)



    // if(prefs?.getString("CodeCountry")=="+966"){
    //   idCountry=2;
    // }
    // if(prefs?.getString("CodeCountry")=="+967"){
    //   idCountry=1;
    // }
    // if(prefs?.getString("CodeCountry")=="+965"){
    //   idCountry=3;
    // }
    // if(prefs?.getString("CodeCountry")=="+971"){
    //   idCountry=4;
    // }
    // if(prefs?.getString("CodeCountry")=="+974"){
    //   idCountry=5;
    // }
    // if(prefs?.getString("CodeCountry")=="+968"){
    //   idCountry=6;
    // }
    // if(prefs?.getString("CodeCountry")=="+973"){
    //   idCountry=7;
    // }
    // if(prefs?.getString("CodeCountry")=="+963"){
    //   idCountry=8;
    // }


    final unencodedPath =
        '/api/DoctorsSave/';

    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);

    // "id": 9,
    // "url": "https://testmyguideatmyphone.pythonanywhere.com/RowadMarketing-api/v8/DoctorsInfo/DoctorsRegisterAndLogIn/9/",
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
    // "DoctorsName": "dddd",
    // "PhoneNo": "737310611",
    // "keyVerify": [],
    // "images_main": null,
    // "KeyActiveStatus": true

    var request = http.MultipartRequest(
      'POST',
      url,

    );

    request.headers.addAll(PathAPI.Header);

    //request.fields['Frist_Name'] = Doctors.fristName;

    if (DoctorsInput.images_main != null && DoctorsInput.images_main!.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('images_main', DoctorsInput.images_main?? ""));
    }
    request.fields['Name'] = DoctorsInput.Name?? "";
    if( DoctorsInput.hospital!=null) {
      request.fields['hospital'] = DoctorsInput.hospital!=null ?DoctorsInput.hospital!.id.toString(): "";
    }
    request.fields['specialization'] = DoctorsInput.specialization?.toString()?? '';
    request.fields['degree'] = DoctorsInput.degree?.toString()?? '';
    request.fields['Detial_AR'] = DoctorsInput.Detial_AR?.toString()?? "";
    request.fields['is_hidden'] = false.toString();
    request.fields['is_deleted'] = false.toString();
    request.fields['is_completed'] = true.toString();
    if( DoctorsInput.category!=null) {
      request.fields['category'] = DoctorsInput.category!=null ? DoctorsInput.category!.id.toString(): "";
    }
    if( DoctorsInput.activTime!=null) {
      request.fields['Activ_Time'] = DoctorsInput.activTime!=null ? DoctorsInput.activTime!.id.toString():1.toString();
    } else{
      request.fields['Activ_Time'] =  1.toString();

    }

    request.fields['Detial_AR'] = DoctorsInput.Detial_AR?? "";

    // request.fields['Synopsis'] = Doctors.Synopsis;
    // "Name": "scdscdsc",
    // "Detial_AR": "scsc",
    // "location_Name": "scsc",
    // "Detial_EN": "scsc",
    // "Name_EN": "",
    // "images_main": null,
    // "PhoneNo_one": "",
    // "PhoneNo_two": "",
    // "PhoneNo_whatsapp": "",
    // "PhoneNo_landline": "",
    // "latitude": null,
    // "longitude": null
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(DoctorsInput.Name);
    print(DoctorsInput.Detial_AR);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);

    print(utf8.decode(response.bodyBytes));
    // final response = await http.post(url,
    //     headers:
    //     {
    //       "Content-Type": "application/json",
    //       //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
    //
    //     }
    //  ,
    //       body: jsonEncode(Doctors.toJsonsave()));
    ////
    ////

    Doctors ?doctorsOut;
    if (response.statusCode == 201) {
      //Doctors.id = json.decode(response.body)['id'];
      //_todos.add(Doctors);
      // Future<List<Doctors> >

      ////

      doctorsOut = Doctors.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
      // AppData.MyHospital.add(hospital);

      // notifyListeners();

      return      doctorsOut;
    }

    return    doctorsOut;


  }


}