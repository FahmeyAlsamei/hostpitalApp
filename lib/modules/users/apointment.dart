


import 'package:project/modules/users/doctors.dart';
import 'package:project/modules/users/hospital_model.dart';
import 'package:project/modules/users/type_comercial_model.dart';
import 'package:project/modules/users/user_model.dart';

class ApointmentsModel{
  int? id;
  Hospital? hospital;
  Users? created_by;
  Doctors? doctor;
  Category? category;
  String? apointment_date;
  String? apointment_time;
  bool ? isCancel;
  bool ? isConform;
  bool ? isFinish;

  String? Name;
  String? Phone_Number;

  String? Date_Update;
  String? Date_Added;


  ApointmentsModel(
  {
    this.id,
    this.category,
    this.doctor,
    this.created_by,
    this.hospital,
    this.Name,
    this.Phone_Number,
    this.apointment_date,
    this.apointment_time,
    this.Date_Update,
    this.Date_Added,
    this.isCancel,
    this.isConform,
    this.isFinish,
   }
      );

  factory  ApointmentsModel.fromJson(Map<String,dynamic> json)=>ApointmentsModel(
      // category:json['category'] ==null?null:json['category'],
      // doctors:json['doctor'] ==null?null:json['doctor'],
//      hospital,
      Name:json['Name'],
      Phone_Number:json['Phone_Number'],

    id: json['id'],
    Date_Added: json['Date_Added'],
    Date_Update: json['Date_Update'],
    isFinish: json['isFinish'],
    apointment_date: json['apointment_date'],
    apointment_time: json['apointment_time'],
    isCancel: json['isCancel'],
    isConform: json['isConform'],
    // blood_Type: json['isCancel'],
    // gender: json['gender'],
    // is_data_aveilable: json['is_data_aveilable'],
    // volunteer_data:json['volunteer_data'],
    // last_volunted_date:json['last_volunted_date'] ,
    // status:json['status'] ,
    // is_blood_volunteer:json['is_blood_volunteer'] ?? false,
    // is_needer_blood: json['is_needer_blood']!= null? json['is_needer_blood']:false,
    created_by: json["created_by"] == null
        ? null : json["created_by"].runtimeType == int?
        Users(id:json["created_by"])
        : Users.fromJsonListComercial(json["created_by"]),
    hospital: json["hospital"] == null
        ? null : json["hospital"].runtimeType == int?
    Hospital(id:json["hospital"])
        : Hospital.fromMap(json["created_by"]),
    category: json["category"] == null
        ? null : json["category"].runtimeType == int?
    Category(id:json["category"])
        : Category.fromJson(json["category"]),



    doctor: json["doctor"] == null
        ? null : json["doctor"].runtimeType == int?
    Doctors(id:json["doctor"])
        : Doctors.fromJson(json["doctor"]),
    //  apointment_date,
     // apointment_time
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": Name,
    "category": category!=null?category!.id:null,
    "hospital":  hospital!=null?hospital!.id:null,
    "created_by": created_by!=null?created_by!.id:null,
    "doctor": doctor!=null?doctor!.id:null,
    "isConform":isConform,

    "isCancel":isCancel,
    "isFinish":isFinish,
    "apointment_date":apointment_date,
    "apointment_time":apointment_time,
    "Date_Added":Date_Added,
    "Date_Update":Date_Update,
    "Phone_Number": Phone_Number,


  };
  Map<String, dynamic> toJsonIsCansel() => {

    // "isConform":isConform,

    "isCancel":isCancel,
    // "isFinish":isFinish,
    // "apointment_date":apointment_date,
    // "apointment_time":apointment_time,
    // "Date_Added":Date_Added,
    // "Date_Update":Date_Update,
    // "Phone_Number": Phone_Number,


  };
  Map<String, dynamic> toJsonIsConfirm() => {

    "isConform":isConform,

    // "isCancel":isCancel,
    // "isFinish":isFinish,
    // "apointment_date":apointment_date,
    // "apointment_time":apointment_time,
    // "Date_Added":Date_Added,
    // "Date_Update":Date_Update,
    // "Phone_Number": Phone_Number,


  };
  Map<String, dynamic> toJsonIsFinish() => {

    "isFinish":isFinish,

    // "isCancel":isCancel,
    // "isFinish":isFinish,
    // "apointment_date":apointment_date,
    // "apointment_time":apointment_time,
    // "Date_Added":Date_Added,
    // "Date_Update":Date_Update,
    // "Phone_Number": Phone_Number,


  };

}