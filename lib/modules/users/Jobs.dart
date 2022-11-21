

import 'package:project/modules/users/hospital_model.dart';
import 'package:project/modules/users/user_model.dart';

class Job{



  int? id;
  String? images_main;
  String ? offerName;
  String ? PhoneNumber;
  String?  jobAdvert;
  bool? isjobAdvert;
  bool? isjobOffer;
  String ? jobTitle;
  String ? jobDegree;
  String ? email;

  String? experienceLevel;
  String? workHour;
  String? salary;
  String? Detial_AR;

  bool? isAdvertisement;
  bool? isOffer;
  Hospital? hospital;
  Users? created_by;
  String? Date_Update;
  String? Date_Added;


  Job(


  {
    this.id,
    this.images_main,
    this.offerName,
    this.PhoneNumber,

    this.jobAdvert,
    this.jobTitle,
    this.jobDegree,
    this.email,
    this.experienceLevel,
    this.workHour,
    this.salary,
    this.created_by,
    this.isAdvertisement,
    this.isOffer,
    this.Detial_AR,
    this.Date_Added,
    this.Date_Update,
    this.hospital,
  }

      );

  factory Job.fromJson(Map<String,dynamic>json) {
    return Job(
   id:json['id'],
   images_main:json["images_main"],
  offerName:json["offerName"],
  PhoneNumber:json["PhoneNumber"],
  jobAdvert:json["jobAdvert"],
  jobTitle:json["jobTitle"],
  jobDegree:json["jobDegree"],
  email:json["email"],
  experienceLevel:json["experienceLevel"],
  workHour:json["workHour"],
  salary: json['salary'],
        created_by: json["created_by"] == null
            ? null: json["created_by"].runtimeType==int?Users(id:json["created_by"])

            : Users.fromJsonListComercial(json["created_by"]),

  hospital:
  json["hospital"] == null
      ? null: json["hospital"].runtimeType==int?Hospital(id:json["hospital"])

      : Hospital.fromMapForSave(json["hospital"]),
  isAdvertisement:json["isAdvertisement"],
  isOffer:json["isOffer"],
  Detial_AR:json["Detial_AR"],
  Date_Added:json["Date_Added"],
  Date_Update:json["Date_Update"]
  );
  }

  Map<String,dynamic> toJson()=>
      {

        "id": id,
        "images_main":images_main,
        "offerName":offerName,
        "PhoneNumber":PhoneNumber,
        "jobAdvert":jobAdvert,
        "jobTitle":jobTitle,
        "jobDegree":jobDegree,
        "email":email,
        "experienceLevel":experienceLevel,
        "workHour":workHour,
        "salary":salary,
        "created_by":created_by!.id!,
        "isAdvertisement":isAdvertisement,
        "isOffer":isOffer,
        "Detial_AR":Detial_AR,
        "Date_Added": Date_Added,
        "Date_Update": Date_Update,
         "hospital"  :hospital












      };

}