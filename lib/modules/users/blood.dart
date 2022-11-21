
// ignore_for_file: non_constant_identifier_names, equal_keys_in_map

import 'dart:convert';

import 'package:project/modules/users/user_model.dart';

class Blood{
  int? id;
  String? Name;
  String? Phone_Number1;
  String? phone_Number2;
  String? city;
  String? directorate;
  String? blood_Type;
  bool?  gender;
  bool?  is_data_aveilable;
  bool? volunteer_data;
  bool? status;
  String? last_volunted_date;
  String? Detial_AR;

  bool? is_blood_volunteer;
  bool? is_needer_blood;

  String? Date_Update;
  String? Date_Added;

  Users? created_by;


  Blood({

    this.id,
    this.Name,
    this.Phone_Number1,
    this.phone_Number2,
    this.city,
    this.directorate,
    this.blood_Type,
    this.gender,
    this.is_data_aveilable,
    this.volunteer_data,
    this.status,
    this.last_volunted_date,
    this.Detial_AR,


    this.is_blood_volunteer,
    this.is_needer_blood,

    this.Date_Added,
    this.Date_Update,

    this.created_by,
});

  factory Blood.fromJson(Map<String ,dynamic>json)=>Blood(
      id: json['id'],
      Name: json['Name'],
      Phone_Number1: json['Phone_Number1'],
      phone_Number2: json['phone_Number2'],
      city: json['city'],
    directorate: json['directorate'],
    blood_Type: json['blood_Type'],
    gender: json['gender'],
    is_data_aveilable: json['is_data_aveilable'],
    volunteer_data:json['volunteer_data'],
    last_volunted_date:json['last_volunted_date'] ,
    status:json['status'] ,
    is_blood_volunteer:json['is_blood_volunteer'] ?? false,
    is_needer_blood: json['is_needer_blood']!= null? json['is_needer_blood']:false,
    created_by: json["created_by"] == null
        ? null: json["created_by"].runtimeType==int?Users(id:json["created_by"])

        : Users.fromJsonListComercial(json["created_by"]),
    );
  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": Name,
    "Phone_Number1": Phone_Number1,
    "phone_Number2": phone_Number2,
    "city":city,
    "directorate":directorate,
    "blood_Type":blood_Type,
    "gender":gender,
    "is_data_aveilable":is_data_aveilable,
    "volunteer_data":volunteer_data,
    "last_volunted_date":last_volunted_date,
     "status":status,
     "is_blood_volunteer":is_blood_volunteer,
    "is_needer_blood":is_needer_blood,
    "Detial_AR": Detial_AR,
     "created_by":created_by!.id,

    "Date_Added": Date_Added,
    "Date_Update": Date_Update,


  };

}
