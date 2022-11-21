


// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:project/config/data.dart';
import 'package:project/config/path.dart';
import 'package:project/modules/users/blood.dart';
import 'package:http/http.dart' as http;

import '../modules/users/type_comercial_model.dart';

class CategoryProvider with ChangeNotifier{
  


  List<Category> _todos=[];

  List<Category> get(){
    return [..._todos];
    
  }
  
  Future<Category?> addNewCategory(Category _category) async{
    
    
    const unencodedPath =
        '/api/CategorySave/';
    
    var url =Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    print('addNewCategory');
    var response = await http.post(url,
        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(_category.toJson())
    );
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Category.images_main !=null&& Category.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Category.images_main??""));
    // // }
    // request.fields['Name']=Category.Name??"";
    // request.fields["Phone_Number1"]=Category.Phone_Number1??"";
    // request.fields["phone_Number2"]=Category.phone_Number2??"";
    // request.fields["city"]=Category.city??"";
    // request.fields["directorat"]=Category.directorate??"";
    // request.fields["Category_Type"]=Category.Category_Type??"";
    // request.fields["is_Male"]=Category.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Category.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Category.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Category.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Category.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Category.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Category.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Category_volunteer"]=Category.is_Category_volunteer?.toString()??"";
    // request.fields["is_needer_Category"]=Category.is_needer_Category?.toString()??"";
    // request.fields["Detial_AR"]=Category.Detial_AR??"";
    // request.fields["created_by"]=  Category.created_by?.id.toString()??"";


    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(_category.id);
    print(_category.Name);


    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    Category ?category1;
    if(response.statusCode==201){
      category1=Category.fromJson(json.decode(utf8.decode(response.bodyBytes)));
     return category1;
    }
    return category1;

  }

 Future <List<Category>> fetchAllCategory( bool is_volunteer, bool is_needer)async{


    if(!is_volunteer){

      // AppData.ListCategory.removeWhere((element) => element.is_needer_Category!);
    }
    if(!is_needer){
      // AppData.ListCategory.removeWhere((element) => element.is_needer_Category!);
    }

    var unencodedPath = "/api/Category/";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
    {
      "format": "json",
       // "is_Category_volunteer":"$is_volunteer",
      // "is_needer_Category":"$is_needer"
    }

    );
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    final response=await http.get(url,headers: PathAPI.Header);

    if(response !=null){

      if(response.statusCode==200){
        var datamap=json.decode(utf8.decode(response.bodyBytes));

        List data=datamap["result"] as List;

        print(data);

        data.forEach((Category) async
        {
          print(Category);
          AppData.ListCategory.add(Category.fromJson(Category));

          var set=<int>{};
          AppData.ListCategory=AppData.ListCategory.where((element) => set.add(element.id!)).toList();

        });
        var set=<int>{};
        AppData.ListCategory=AppData.ListCategory.where((element) => set.add(element.id!)).toList();
        return  AppData.ListCategory;

      }
      else
        return  AppData.ListCategory;
    }
    return  AppData.ListCategory;
  }


  Future<Category> fetchOneCategory(int id) async{

    var unencodedPath = "/api/Category/${id}/?format=json";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response= await http.get(url,headers: PathAPI.Header);

    Category cctegory=Category(id: id);

    if( response !=null ){
      if(response.statusCode==200){

        var data=json.decode(response.body);
        print(data);

        cctegory=Category.fromJson(
          json.decode(utf8.decode(response.bodyBytes))
        );
        _todos = data.map<Category>((json) => Category.fromJson(json)).toList();

        return cctegory;
      }



    }
    return cctegory;


  }

}