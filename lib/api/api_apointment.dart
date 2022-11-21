


// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:project/config/data.dart';
import 'package:project/config/path.dart';
import 'package:project/modules/users/apointment.dart';
import 'package:http/http.dart' as http;

class ApointmentsProvider with ChangeNotifier{
  


  List<ApointmentsModel> _todos=[];

  List<ApointmentsModel> get(){
    return [..._todos];
    
  }

  // Future<ApointmentsModel?> addIsConfirmApointments( ApointmentsModel apointments) async{
  //
  //
  //   int id =apointments.id!;
  //   var unencodedPath =
  //       '/api/ApointmentSave/${id}/';
  //
  //   var url =Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);
  //
  //   var response = await http.patch(url,
  //       // final response = await http.post(url,
  //       headers:
  //       {
  //         "Content-Type": "application/json",
  //         //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
  //
  //       }
  //       ,
  //       body: jsonEncode(apointments.isConform())
  //   );
  //   //
  //   // var request =http.post(
  //   //
  //   //   'POST',
  //   //   url
  //   // );
  //
  //   // request.headers.addAll((PathAPI.Header));
  //   //
  //   // // if(Apointments.images_main !=null&& Apointments.images_main!.isNotEmpty){
  //   // //   request.files.add(await http.MultipartFile.fromPath('images_main', Apointments.images_main??""));
  //   // // }
  //   // request.fields['Name']=Apointments.Name??"";
  //   // request.fields["Phone_Number1"]=Apointments.Phone_Number1??"";
  //   // request.fields["phone_Number2"]=Apointments.phone_Number2??"";
  //   // request.fields["city"]=Apointments.city??"";
  //   // request.fields["directorat"]=Apointments.directorate??"";
  //   // request.fields["Apointments_Type"]=Apointments.Apointments_Type??"";
  //   // request.fields["is_Male"]=Apointments.is_Male?.toString()??"";
  //   // request.fields["is_Famle"]=Apointments.is_Famle?.toString()??"";
  //   // request.fields["is_Data_for_all"]=Apointments.is_Data_for_all?.toString()??"";
  //   // request.fields["is_Data_Hospital"]=Apointments.is_Data_Hospital?.toString()??"";
  //   // request.fields["is_Volunteer_befor"]=Apointments.is_Volunteer_befor?.toString()??"";
  //   // request.fields["last_volunted_date"]=Apointments.last_volunted_date??"";
  //   // request.fields["is_Volunteer_first_time"]=Apointments.is_Volunteer_first_time?.toString()??"";
  //   // request.fields["is_Apointments_volunteer"]=Apointments.is_Apointments_volunteer?.toString()??"";
  //   // request.fields["is_needer_Apointments"]=Apointments.is_needer_Apointments?.toString()??"";
  //   // request.fields["Detial_AR"]=Apointments.Detial_AR??"";
  //   // request.fields["created_by"]=  Apointments.created_by?.id.toString()??"";
  //
  //
  //   print(url.scheme+"://"+url.host+url.path+"?"+url.query);
  //   print(apointments.id);
  //   print(apointments.Name);
  //
  //
  //   // var streamedResponse=await request.send();
  //
  //   // var response=await http.Response.fromStream(streamedResponse);
  //
  //   print(utf8.decode(response.bodyBytes));
  //
  //   ApointmentsModel ?Apointments1;
  //   if(response.statusCode==201){
  //     Apointments1=ApointmentsModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     return Apointments1;
  //   }
  //   return Apointments1;
  //
  // }

  Future<ApointmentsModel?> addIsEventApointments( ApointmentsModel apointments,
      Map<String, dynamic> map

      ) async{


    int id =apointments.id!;
    var unencodedPath =
        '/api/ApointmentSave/${id}/';

    var url =Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);

    var response = await http.patch(url,
        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(map)
    );
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Apointments.images_main !=null&& Apointments.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Apointments.images_main??""));
    // // }
    // request.fields['Name']=Apointments.Name??"";
    // request.fields["Phone_Number1"]=Apointments.Phone_Number1??"";
    // request.fields["phone_Number2"]=Apointments.phone_Number2??"";
    // request.fields["city"]=Apointments.city??"";
    // request.fields["directorat"]=Apointments.directorate??"";
    // request.fields["Apointments_Type"]=Apointments.Apointments_Type??"";
    // request.fields["is_Male"]=Apointments.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Apointments.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Apointments.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Apointments.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Apointments.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Apointments.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Apointments.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Apointments_volunteer"]=Apointments.is_Apointments_volunteer?.toString()??"";
    // request.fields["is_needer_Apointments"]=Apointments.is_needer_Apointments?.toString()??"";
    // request.fields["Detial_AR"]=Apointments.Detial_AR??"";
    // request.fields["created_by"]=  Apointments.created_by?.id.toString()??"";


    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(apointments.id);
    print(apointments.Name);


    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    ApointmentsModel ?Apointments1;
    if(response.statusCode==201){
      Apointments1=ApointmentsModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return Apointments1;
    }
    return Apointments1;

  }

  Future<ApointmentsModel?> addNewApointments(ApointmentsModel Apointments) async{

    
    const unencodedPath =
        '/api/ApointmentSave/';

    var url =Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,);

    var response = await http.post(url,
        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(Apointments.toJson())
    );
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Apointments.images_main !=null&& Apointments.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Apointments.images_main??""));
    // // }
    // request.fields['Name']=Apointments.Name??"";
    // request.fields["Phone_Number1"]=Apointments.Phone_Number1??"";
    // request.fields["phone_Number2"]=Apointments.phone_Number2??"";
    // request.fields["city"]=Apointments.city??"";
    // request.fields["directorat"]=Apointments.directorate??"";
    // request.fields["Apointments_Type"]=Apointments.Apointments_Type??"";
    // request.fields["is_Male"]=Apointments.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Apointments.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Apointments.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Apointments.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Apointments.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Apointments.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Apointments.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Apointments_volunteer"]=Apointments.is_Apointments_volunteer?.toString()??"";
    // request.fields["is_needer_Apointments"]=Apointments.is_needer_Apointments?.toString()??"";
    // request.fields["Detial_AR"]=Apointments.Detial_AR??"";
    // request.fields["created_by"]=  Apointments.created_by?.id.toString()??"";


    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(Apointments.id);
    print(Apointments.Name);


    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    ApointmentsModel ?Apointments1;
    if(response.statusCode==201){
     Apointments1=ApointmentsModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
     return Apointments1;
    }
    return Apointments1;

  }
  Future <List<ApointmentsModel>> fetchAllApointmentsInHospital()async{


    // if(!is_volunteer){
    //
    //   AppData.ListApointments.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListApointments.removeWhere((element) => element.isConform!);
    // }

    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Apointment";
    Map<String, String>? queryParameters={
      "format": "json",
      // "hospital__created_by":AppData.UserAccountData!.id.toString(),
      "category__hospital__created_by":AppData.UserAccountData!.id.toString(),

    };
    if (kDebugMode) {
      print("http://"+PathAPI.PATH_MAIN_API.replaceAll("10.0.2.2", "127.0.0.1")+unencodedPath+"?"+queryParameters.entries.toString().replaceAll(':', '=').replaceAll("MapEntry(", '').replaceAll(")", '').replaceAll("(", '').replaceAll(" ", '').replaceAll(",", '&'));
    }

    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,

        queryParameters
    );
    if (kDebugMode) {
      print(url.scheme+"://"+url.host+":"+url.port.toString()+url.path+"?"+url.query);
    }

    final response=await http.get(url,headers: PathAPI.Header);
    if (kDebugMode) {
      print(response.body);
    }
    if(response !=null){

      if(response.statusCode==200){
        var datamap=json.decode(utf8.decode(response.bodyBytes));
        print(datamap);

        List data=datamap["results"] as List;

        print(data);

        data.forEach((_ap) async
        {
          print(_ap);
          AppData.ListHospitalApointments.add(ApointmentsModel.fromJson(_ap));

          var set=<int>{};
          AppData.ListHospitalApointments=AppData.ListHospitalApointments.where((element) => set.add(element.id!)).toList();

        });
        var set=<int>{};
        AppData.ListHospitalApointments=AppData.ListHospitalApointments.where((element) => set.add(element.id!)).toList();
        return  AppData.ListHospitalApointments;

      }
      else {
        return  AppData.ListHospitalApointments;
      }
    }
    return  AppData.ListHospitalApointments;
  }

 Future <List<ApointmentsModel>> fetchAllApointments()async{


    // if(!is_volunteer){
    //
    //   AppData.ListApointments.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListApointments.removeWhere((element) => element.isConform!);
    // }
   print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Apointment";
    Map<String, String>? queryParameters={
      "format": "json",
      "created_by":AppData.UserAccountData!.id.toString(),

    };
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,

        queryParameters
    );
    print(url.scheme+"://"+url.host+":"+url.port.toString()+url.path+"?"+url.query);

    final response=await http.get(url,headers: PathAPI.Header);

    if(response !=null){

      if(response.statusCode==200){
        var datamap=json.decode(utf8.decode(response.bodyBytes));
        print(datamap);

        List data=datamap["results"] as List;

        print(data);

        data.forEach((_ap) async
        {
          print(_ap);
          AppData.ListApointments.add(ApointmentsModel.fromJson(_ap));

          var set=<int>{};
          AppData.ListApointments=AppData.ListApointments.where((element) => set.add(element.id!)).toList();

        });
        var set=<int>{};
        AppData.ListApointments=AppData.ListApointments.where((element) => set.add(element.id!)).toList();
        return  AppData.ListApointments;

      }
      else {
        return  AppData.ListApointments;
      }
    }
    return  AppData.ListApointments;
  }


  Future<ApointmentsModel> fetchOneApointments(int id) async{

    var unencodedPath = "/api/Apointments/${id}/?format=json";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response= await http.get(url,headers: PathAPI.Header);

    ApointmentsModel Apointments=ApointmentsModel(id: id);

    if( response !=null ){
      if(response.statusCode==200){

        var data=json.decode(response.body);
        print(data);

        Apointments=ApointmentsModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes))
        );
        _todos = data.map<ApointmentsModel>((json) => ApointmentsModel.fromJson(json)).toList();

        return Apointments;
      }



    }
    return Apointments;


  }

}