
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../config/data.dart';
import '../config/path.dart';
import '../modules/users/hospital_model.dart';

class HospitalApiProvider with ChangeNotifier {
  HospitalApiProvider() {
    //this.fetchTasks();
  }

  List<Hospital> _todos = [];
  List<Hospital> _HospitalErr = [];

  List<Hospital> get todos {
    return [..._todos];
  }

  int ChckLogIN = 0;





  Future<Hospital?> addLocation(double lattude,double longtude,int idHosital) async {





    Hospital hospital=new Hospital(id: idHosital,latitude: lattude,longitude: longtude);

    final unencodedPath =
        '/api/HospitalSave/${idHosital}/';

    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);


    var response = await http.patch(
        url,

        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(hospital.toJsonsaveLocation())
    );


    //request.fields['Frist_Name'] = Hospital.fristName;



    print(response.statusCode);

    // print(utf8.decode(response.bodyBytes));
    // final response = await http.post(url,
    //     headers:
    //     {
    //       "Content-Type": "application/json",
    //       //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
    //
    //     }
    //  ,
    //       body: jsonEncode(Hospital.toJsonsave()));
    ////
    ////

    if (response.statusCode == 200) {
      //Hospital.id = json.decode(response.body)['id'];
      //_todos.add(Hospital);
      // Future<List<Hospital> >

      ////

      hospital = Hospital.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
      // AppData.MyHospital.add(hospital);

      // notifyListeners();

      return      hospital;
    }

    return    hospital;


  }

  Future<Hospital?> addHospital(Hospital hospitalInput) async {

    // Hospital.HospitalName = Hospital.HospitalName.contains(other)



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
        '/api/HospitalSave/';

    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);

    // "id": 9,
    // "url": "https://testmyguideatmyphone.pythonanywhere.com/RowadMarketing-api/v8/HospitalInfo/HospitalRegisterAndLogIn/9/",
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
    // "HospitalName": "dddd",
    // "PhoneNo": "737310611",
    // "keyVerify": [],
    // "images_main": null,
    // "KeyActiveStatus": true

    var request = http.MultipartRequest(
      'POST',
      url,

    );

    request.headers.addAll(PathAPI.Header);

    //request.fields['Frist_Name'] = Hospital.fristName;

    if (hospitalInput.images_main != null && hospitalInput.images_main!.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('images_main', hospitalInput.images_main?? ""));
    }
    if (hospitalInput.images_back != null && hospitalInput.images_back!.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('images_background', hospitalInput.images_back?? ""));
    }
    request.fields['Name'] = hospitalInput.Name?? "";
    request.fields['location_Name'] = hospitalInput.location_Name?? "";
    request.fields['latitude'] = hospitalInput.latitude?.toString()?? '0.0000';
    request.fields['longitude'] = hospitalInput.longitude?.toString()?? '0.0000';
    request.fields['is_clinic'] = hospitalInput.is_clinic?.toString()?? "";
    request.fields['is_hidden'] = false.toString();
    request.fields['is_deleted'] = false.toString();
    request.fields['is_completed'] = true.toString();
    request.fields['is_hospital'] = hospitalInput.is_hospital?.toString()?? "";

    request.fields['is_laboratry'] = hospitalInput.is_laboratry?.toString()?? "";
    request.fields['is_radiation'] = hospitalInput.is_radiation?.toString()?? "";
    request.fields['Phone_Number_tow'] = hospitalInput.Phone_Number_tow?.toString()?? "";
    request.fields['is_farmacy'] = hospitalInput.is_farmacy?.toString()?? "";
    request.fields['created_by'] = hospitalInput.created_by?.id.toString()?? "";

    request.fields['Activ_Time'] = hospitalInput.Activ_Time?.id.toString()?? "";

    request.fields['Detial_AR'] = hospitalInput.Detial_AR?? "";
    request.fields['Phone_Number'] = hospitalInput.Phone_Number?? "";

    // request.fields['Synopsis'] = Hospital.Synopsis;
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
    print(hospitalInput.Name);
    print(hospitalInput.Activ_Time);
    print(hospitalInput.Detial_AR);

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
    //       body: jsonEncode(Hospital.toJsonsave()));
    ////
    ////

    Hospital ?hospital;
    if (response.statusCode == 201) {
      //Hospital.id = json.decode(response.body)['id'];
      //_todos.add(Hospital);
      // Future<List<Hospital> >

      ////

      hospital = Hospital.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
      // AppData.MyHospital.add(hospital);

      // notifyListeners();

      return      hospital;
    }

    return    hospital;


  }




  Future <List<Hospital>> fetchAllHospital(bool is_clinic,bool is_farmacy,bool is_hospital,
      bool is_radiation,
      bool is_laboratry,
      ) async {
    if(!is_clinic){
      AppData.MyHospital.removeWhere((element) => element.is_clinic!);

    }
    if(!is_farmacy){
      AppData.MyHospital.removeWhere((element) => element.is_farmacy!);

    }
    if(!is_hospital){
      AppData.MyHospital.removeWhere((element) => element.is_hospital!);

    }
    if(!is_radiation){
      AppData.MyHospital.removeWhere((element) => element.is_radiation!);

    }
    if(!is_laboratry){
      AppData.MyHospital.removeWhere((element) => element.is_laboratry!);

    }

    // await http.get(url,headers: PathAPI.Header);
    // if (response != null) if (response.statusCode == 200) {
    //   ////"dataHospital");

    var unencodedPath = "/api/Hospital/";
    ////"https://"+PathAPI.PATH_MAIN_API+unencodedPath+"?format=json");
    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
        {"format": "json",
          'is_clinic': "$is_clinic",
          'is_farmacy': "$is_farmacy",
          'is_hospital': "$is_hospital",
          'is_radiation': "$is_radiation",
          'is_laboratry': "$is_laboratry",
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
        data.forEach((hospital) async {
          print( hospital);
          // AppData.MyHospital.length>0
          // print(AppData.MyHospital.indexWhere((element) => element.id==hospital['id']));
          // var idSet = <int>{};
          // idSet.add(hospital['id']);

          // if(idSet.contains(hospital['id']))

          //   if(datamap["count"]>AppData.MyHospital.length)
          AppData.MyHospital.add(Hospital.fromMap(hospital));

          var set = <int>{};
          AppData.MyHospital =  AppData.MyHospital.where((e) => set.add(e.id!)).toList();
        });
        print(await 'hospital');
        // AppData.MyHospital.add(hospital);
        var set = <int>{};

        AppData.MyHospital =  AppData.MyHospital.where((e) => set.add(e.id!)).toList();
        return AppData.MyHospital;

      } else {
        return AppData.MyHospital;
      }
    }
    return AppData.MyHospital;
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

  Future<Hospital>fetchOneHospital(int id) async {

    var unencodedPath = "/api/Hospital/${id}/?format=json";
    var url = Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);
    final response = await http.get(url, headers: PathAPI.Header);
    Hospital hospital=Hospital(id: id);
    if (response != null) if (response.statusCode == 200) {

      var data = json.decode(response.body);
      print(data);
      hospital = Hospital.fromMapForSave(
          json.decode(utf8.decode(response.bodyBytes)));
      _todos = data.map<Hospital>((json) => Hospital.fromMapForSave(json)).toList();

      return hospital;
      ////_todos);
      // notifyListeners();
    }
    return hospital;
  }
}
