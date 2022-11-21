import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/config/data.dart';
import 'package:project/config/path.dart';
import 'package:http/http.dart' as http;

import '../modules/users/Jobs.dart';

class JobProvider with ChangeNotifier{


  JobProvider(){

  }


  List<Job> _tidoes=[];

  List<Job> get(){

    return [..._tidoes];
  }



  Future<Job ?> addNewJob(Job job)async{

    const unencodedPath =
        '/api/JopSave/';

    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    var request=http.MultipartRequest('POST',url);

    request.headers.addAll(PathAPI.Header);

    if(job.images_main!=null && job.images_main!.isNotEmpty){
      request.files.add(await http.MultipartFile.fromPath("images_main", job.images_main!) );
    }
    request.fields["offerName"]=job.offerName??"";
    request.fields["PhoneNumber"]=job.PhoneNumber??"";
    request.fields["jobAdvert"]=job.jobAdvert??"";
    request.fields["jobTitle"]=job.jobTitle??"";
    request.fields["jobDegree"]=job.jobDegree??"";
    request.fields["email"]=job.email??"";
    request.fields["experienceLevel"]=job.experienceLevel??"";
    // request.fields["workHour"]=job.workHour??"";
    // request.fields["salary"]=job.salary??"";
    request.fields["created_by"]=job.created_by?.id.toString()??"";
    //request.fields["isAdvertisement"]=job.isAdvertisement?.toString()??"";
    // request.fields["isOffer"]=job.isOffer?.toString()??"";
    request.fields["Detial_AR"]=job.Detial_AR??"";
    request.fields["isAdvertisement"]=job.isAdvertisement.toString()??"";
    request.fields["isOffer"]=job.isOffer.toString()??"";
    request.fields["workHour"]=job.workHour??"";
    request.fields["salary"]=job.salary??"";


    print(url.scheme+"://"+url.host+url.path+"?"+url.query);
    print(job.id);
    print(job.offerName);

    var streamedResponse=await request.send();

    var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    Job ? job1;

    if(response.statusCode==201){
      job1=Job.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return job1;
    }

    return job1;
  }

  Future <List<Job>> fetchAllJob()async{



    var unencodedPath = "/api/Jop/";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath,
        {
          "format": "json",
        }

    );
    print(url.scheme+"://"+url.host+url.path+"?"+url.query);

    final response=await http.get(url,headers: PathAPI.Header);

    if(response !=null){

      if(response.statusCode==200){
        print(response.body);
        var datamap=json.decode(utf8.decode(response.bodyBytes));

        List data=datamap["results"] as List;

        print(data);

        data.forEach((job) async
        {
          print(job);
          AppData.ListJob.add(Job.fromJson(job));

          var set=<int>{};
          AppData.ListJob=AppData.ListJob.where((element) => set.add(element.id!)).toList();

        });
        var set=<int>{};
        AppData.ListJob=AppData.ListJob.where((element) => set.add(element.id!)).toList();
        return  AppData.ListJob;

      }
      else
        return  AppData.ListJob;
    }
    return  AppData.ListJob;
  }
  Future<Job> fetchOneJob(int id) async{

    var unencodedPath = "/api/Job/${id}/?format=json";
    var url=Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response= await http.get(url,headers: PathAPI.Header);

    Job job=Job(id: id);

    if( response !=null ){
      if(response.statusCode==200){

        var data=json.decode(response.body);
        print(data);

        job=Job.fromJson(
            json.decode(utf8.decode(response.bodyBytes))
        );
        _tidoes = data.map<Job>((json) => Job.fromJson(json)).toList();

        return job;
      }



    }
    return job;


  }
}

