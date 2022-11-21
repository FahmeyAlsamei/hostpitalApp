/// ClientModel.dart
import 'dart:convert';
import 'dart:ffi';


import 'package:project/modules/users/activ_time.dart';
import 'package:project/modules/users/doctors.dart';
import 'package:project/modules/users/is_riting.dart';
import 'package:project/modules/users/user_model.dart';

import 'all_info_rating_comercial_model.dart';
import 'type_comercial_model.dart';



class Hospital {
  int? id;
  String? Name;
  String? Detial_AR;
  // String? Email;
  bool? is_radiation;
  bool? is_laboratry;
  bool? is_farmacy;
  bool? is_clinic;
  bool? is_hospital;
  String?  Phone_Number_tow;

  String? location_Name;
  String? images_back;
  String? Phone_Number;
  String? Date_Update;
  String? Date_Added;
  String? images_main;

  Users? created_by;
  double? latitude;
  double? longitude;
  List<Category>? category;
  List<Doctors>? doctors;

  Hospital({
     this.id,
    this.Detial_AR,
    this.Date_Added,
    this.Date_Update,
    this.images_main,
    this.Name,
    this.Phone_Number,
    // this.Email,
    this.location_Name,
    this.images_back,
    this.is_clinic,
    this.is_farmacy,
    this.Activ_Time,
    this.created_by,
    this.latitude,
    this.longitude,
    this.category=const [],
    this.doctors=const [],

    this.is_hospital,
    this.Phone_Number_tow,
    this.is_laboratry,
    this.is_radiation,
    this.is_riting,
    this.ratingdata,
  });


  ActivTime? Activ_Time;
  List<RatingdataHospital>? ratingdata;
  List<IsRitingHospital>? is_riting;


  factory Hospital.fromMap(Map<String, dynamic> json) => Hospital(
    id: json["id"],
    Name: json["Name"],
    Detial_AR: json["Detial_AR"],
    images_back: json['images_background'],

    // Email: json["Email"],
    category: json["category"] == null
        ? []
        : List<Category>.from(
        json["category"].map((x) =>
            x.runtimeType==Int?Category(id: x):

            Category.fromJson(x))),

    doctors: json["doctors"] == null
          ? []
          : List<Doctors>.from(
          json["doctors"].map((x) => Doctors.fromJson(x))),


    created_by: json["created_by"] == null
        ? null: json["created_by"].runtimeType==int?Users(id:json["created_by"])

        : Users.fromJsonListComercial(json["created_by"]),
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,

    Phone_Number: json["Phone_Number"],
    images_main: json["images_main"],
    Date_Added: json["Date_Added"],

    Date_Update: json["Date_Update"],
    Activ_Time: json["Activ_Time"] == null
        ? null: json["Activ_Time"].runtimeType==int?ActivTime(id:json["Activ_Time"])
        : ActivTime.fromJson(json["Activ_Time"]),


    // isBlock: json["isBlock"] != null ? json["isBlock"] : 0,
    // is_clinic: json["is_clinic"] != null ? json["is_clinic"] : 0,

    is_farmacy: json["is_farmacy"] ?? false,
    is_clinic: json["is_clinic"] ?? false,
    is_laboratry: json["is_laboratry"] ?? false,
    is_radiation: json["is_radiation"] ?? false,
    is_hospital: json["is_hospital"] ?? true,

    Phone_Number_tow: json["Phone_Number_tow"],

    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,
    is_riting: json["isRiting"] == null
        ? []
        : List<IsRitingHospital>.from(
        json["isRiting"].map((x) => IsRitingHospital.fromJson(x))),


    ratingdata: json["ratingdata"] == null
        ? []
        : List<RatingdataHospital>.from(
        json["ratingdata"].map((x) => RatingdataHospital.fromJson(x))),
    location_Name:json["location_Name"],


    // KeyActiveStatus: json["KeyActiveStatus"],
  );
  factory Hospital.fromMapForSave(Map<String, dynamic> json) => Hospital(
    id: json["id"],
    Name: json["Name"],
    Detial_AR: json["Detial_AR"],

    // Email: json["Email"],
    // category: json["category"] == null
    //     ? []
    //     : List<Category>.from(
    //     json["category"].map((x) => Category.fromJson(x))),
    // created_by: json["created_by"] == null
    //     ? null
    //     : Users.fromJsonListComercial(json["created_by"]),
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,
 images_back: json["images_background"],
    Phone_Number: json["Phone_Number"],
    images_main: json["images_main"],
    Date_Added: json["Date_Added"],

    Date_Update: json["Date_Update"],
    // Activ_Time: json["Activ_Time"] == null
    //     ? null
    //     : ActivTime.fromJson(json["Activ_Time"]),


    // isBlock: json["isBlock"] != null ? json["isBlock"] : 0,
    // is_clinic: json["is_clinic"] != null ? json["is_clinic"] : 0,

    is_farmacy: json["is_farmacy"] ?? false,
    is_clinic: json["is_clinic"] ?? false,
    is_laboratry: json["is_laboratry"] ?? false,
    is_radiation: json["is_radiation"] ?? false,
    is_hospital: json["is_hospital"] ?? true,
    Phone_Number_tow: json["Phone_Number_tow"],

    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,
    is_riting: json["isRiting"] == null
        ? []
    : List<IsRitingHospital>.from(
    json["isRiting"].map((x) => IsRitingHospital.fromJson(x))),


    // ratingdata: json["ratingdata"] == null
    //     ? []
    //     : List<RatingdataHospital>.from(
    //     json["ratingdata"].map((x) => RatingdataHospital.fromJson(x))),
    location_Name:json["location_Name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "Name": Name,
    "Detial_AR": Detial_AR,
    // "Email": Email,
    "Phone_Number": Phone_Number,
    "category": category?.map((x) => x.id).toList(),
    "Phone_Number": Phone_Number,
    " images_main": images_main,
    "id_api": id,
    // "last_Name": lastName,
    "Date_Added": Date_Added,
"images_background":images_back,
    "Date_Update": Date_Update,
  };


  dynamic toJsonsaveLocation() => {
    'latitude': latitude,
    // 'Email': Email,
    //'keyVerify':KeyActiveStatus,
    'longitude': longitude,


  };



  dynamic toJsonsave() => {
    'id': id,
    'Name': Name,
    // 'Email': Email,
    //'keyVerify':KeyActiveStatus,
    'Detial_AR': Detial_AR,
    'Phone_Number': Phone_Number,
     "images_background":images_back,
    "images_main": images_main,

  };
}
