


// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:project/modules/users/blood.dart';

import '../config/data.dart';
import '../config/path.dart';

class BloodProvider with ChangeNotifier{

  BloodProvider(){

  }

  List<Blood> _todos=[];

  List<Blood> get(){
    return [..._todos];

  }

  Future<Blood?> addNewBlood(Blood blood) async{


    const unencodedPath =
        '/api/BloodSave/';

    var url =Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    var response = await http.post(url,
        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(blood.toJson())
    );
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(blood.images_main !=null&& blood.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', blood.images_main??""));
    // // }
    // request.fields['Name']=blood.Name??"";
    // request.fields["Phone_Number1"]=blood.Phone_Number1??"";
    // request.fields["phone_Number2"]=blood.phone_Number2??"";
    // request.fields["city"]=blood.city??"";
    // request.fields["directorat"]=blood.directorate??"";
    // request.fields["blood_Type"]=blood.blood_Type??"";
    // request.fields["is_Male"]=blood.is_Male?.toString()??"";
    // request.fields["is_Famle"]=blood.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=blood.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=blood.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=blood.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=blood.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=blood.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_blood_volunteer"]=blood.is_blood_volunteer?.toString()??"";
    // request.fields["is_needer_blood"]=blood.is_needer_blood?.toString()??"";
    // request.fields["Detial_AR"]=blood.Detial_AR??"";
    // request.fields["created_by"]=  blood.created_by?.id.toString()??"";


    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(blood.id);
    print(blood.Name);


    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    Blood ?blood1;
    if(response.statusCode==201){
      blood1=Blood.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return blood1;
    }
    return blood1;

  }

  Future <List<Blood>> fetchAllBlood()async{


    // if(!is_volunteer){
    //
    //   AppData.ListBlood.removeWhere((element) => element.is_needer_blood!);
    // }
    // if(!is_needer){
    //   AppData.ListBlood.removeWhere((element) => element.is_needer_blood!);
    // }

    var unencodedPath = "/api/Blood/";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
        {
          "format": "json",

        }

    );
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    final response=await http.get(url,headers: PathAPI.Header);
    print(response.body);
    if(response !=null){

      if(response.statusCode==200){
        var datamap=json.decode(utf8.decode(response.bodyBytes));

        List data=datamap["results"] as List;

        print(data);

        data.forEach((blood) async
        {
          print(blood);
          AppData.ListBlood.add(Blood.fromJson(blood));

          var set=<int>{};
          AppData.ListBlood=AppData.ListBlood.where((element) => set.add(element.id!)).toList();

        });
        var set=<int>{};
        AppData.ListBlood=AppData.ListBlood.where((element) => set.add(element.id!)).toList();
        return  AppData.ListBlood;

      }
      else
        return  AppData.ListBlood;
    }
    return  AppData.ListBlood;
  }


  Future<Blood> fetchOneBlood(int id) async{

    var unencodedPath = "/api/Blood/${id}/?format=json";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response= await http.get(url,headers: PathAPI.Header);

    Blood blood=Blood(id: id);

    if( response !=null ){
      if(response.statusCode==200){

        var data=json.decode(response.body);
        print(data);

        blood=Blood.fromJson(
            json.decode(utf8.decode(response.bodyBytes))
        );
        _todos = data.map<Blood>((json) => Blood.fromJson(json)).toList();

        return blood;
      }



    }
    return blood;


  }

}