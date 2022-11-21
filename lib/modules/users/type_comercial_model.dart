import 'dart:ffi';

import 'package:project/modules/users/hospital_model.dart';

class Category {
  Category({
    this.id,
    this.url,
    this.Name,
    this.price,
    this.Level,

    this.dateUpdate,
    this.dateAdded,
    this.hospital,
  });

  int? id;
  String? url;
  String? Name;
  String? Level;
  // String? Level;
  // String? price;
  double? price;
  DateTime? dateUpdate;
  DateTime? dateAdded;
  Hospital ?hospital ;
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        url: json["url"],
        Name: json["Name"],
    Level: json["Level"],
// price: ,
    price: json["price"],
    hospital: json['hospital']==null?null:

    json['hospital'].runtimeType==int?
    Hospital(id:json['hospital'] ):
    Hospital.fromMapForSave(json['hospital']),
    dateUpdate: json["Date_Update"] != null
            ? DateTime.parse(json["Date_Update"])
            : null,
        dateAdded: json["Date_Added"] != null
            ? DateTime.parse(json["Date_Added"])
            : null,
      );


  // factory Category.fromJsonForSaveNewComercial(Map<String, dynamic> json) => Category(
  //   id: json["id"],
  //   url: json["url"],
  //   Name: json["Name"],
  //   NameEn: json["Name_EN"] == null ? null : json["Name_EN"],
  //   imagesNameProdact: json["images_Name_ComercialActivies"],
  //   dateUpdate:json["Date_Update"]!=null?DateTime.parse(json["Date_Update"]):null,
  //   dateAdded:json["Date_Added"]!=null? DateTime.parse(json["Date_Added"]):null,
  // );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "url": url,
        "Name": Name,
    "Level":Level,
    "price":price,

    "Date_Updat": dateUpdate?.toIso8601String(),
        "Date_Added": dateAdded?.toIso8601String(),
        "hospital": hospital!=null?hospital!.id:null,

  };
}
