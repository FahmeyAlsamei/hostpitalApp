

import 'package:project/modules/users/activ_time.dart';
import 'package:project/modules/users/hospital_model.dart';

import 'type_comercial_model.dart';

class Doctors{
  int? id;
  String ? Name;
  String ? degree;
  String ? specialization;
  ActivTime? activTime;
  String ? Detial_AR;
  String? images_main;

  Hospital? hospital;
  //Department department
  String? Date_Update;
  String? Date_Added;
  Category? category;

  Doctors({
   this.id,
    this.Name,
    this.degree,
    this.specialization,
    this.activTime,
    this.Detial_AR,
    this.images_main,
    this.hospital,
    this.category,
    this.Date_Update,
    this.Date_Added,
  });

  factory Doctors.fromJson(Map<String,dynamic>json)=>Doctors(

    id: json['id'],
    Name: json['Name'],
    degree:json['degree'] ?? "",
    specialization:json['specialization'] ?? "",
    images_main: json["images_main"],


    Date_Added: json["Date_Added"],

    Date_Update: json["Date_Update"],
    Detial_AR: json['Detial_AR'],
    activTime: json["Activ_Time"] == null
        ? null: json['Activ_Time'].runtimeType==int?
    ActivTime(id:json['Activ_Time'] )
        : ActivTime.fromJson(json["Activ_Time"]),
    hospital: json['hospital']==null?null:

    json['hospital'].runtimeType==int?
    Hospital(id:json['hospital'] ):

    Hospital.fromMapForSave(json['hospital']),

    category: json['category']==null?null: json['category'].runtimeType==int?
    Category(id:json['category'] )


        :Category.fromJson(json['category'])


  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "Name": Name,
    "Detial_AR": Detial_AR,
    "degree":degree,
    "specialization":specialization,
    " images_main": images_main,
    "Date_Added": Date_Added,
    "Date_Update": Date_Update,
  };



}