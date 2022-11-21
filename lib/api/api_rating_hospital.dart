import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/path.dart';
import '../modules/users/Jobs.dart';
import '../modules/users/rating_hospital_model.dart';

class RatingHospitalProvider with ChangeNotifier{




  List<RatingHospitalModel> _tidoes=[];

  List<RatingHospitalModel> get(){

    return [..._tidoes];
  }



  Future<RatingHospitalModel ?> addNewRatingHospitalModel(RatingHospitalModel ratingHospitalModel)async{

    const unencodedPath =
        '/api/RatingHospital/';

    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);


    var response = await http.post(url,
        // final response = await http.post(url,
        headers:
        {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'

        }
        ,
        body: jsonEncode(ratingHospitalModel.toJson())
    );

    // var response=await http.Response.fromStream(streamedResponse);
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    print(utf8.decode(response.bodyBytes));

    RatingHospitalModel ? ratingHospitalModelReturn;

    if(response.statusCode==201){
      ratingHospitalModelReturn=RatingHospitalModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return ratingHospitalModelReturn;
    }

    return ratingHospitalModelReturn;
  }

}

