// ;
//
// // // import 'activ_time.dart';
// // import 'Comment.dart';
// // // import 'is_riting.dart';
// // // import 'all_info_rating_comercial_model.dart';
// // // import 'type_comercial_secondary_model.dart';
// // // import 'type_comercial_primery_model.dart';
// //
// // // import 'type_comercial_model.dart';
// // import 'url_site_comercial_activies_model.dart';
//
// // class IsRitingComercialActivie {
// //   IsRitingComercialActivie({
// //   this.no_rating,
// //   this.isRiting,
// //   });
// // bool isRiting;
// //   int no_rating;
// //
// //   factory IsRitingComercialActivie.fromJson(Map<String, dynamic> json) =>
// //       IsRitingComercialActivie(
// //
// //         isRiting: json["isRiting"],
// //         no_rating: json['no_rating'],
// //
// //       );
// // }
// import 'package:project/modules/users/user_model.dart';
//
// class ComercialActivieModel {
//   ComercialActivieModel({
//     this.id,
//     this.url,
//     this.Name,
//     this.Detial_AR,
//     this.Name_EN,
//     this.Detial_EN,
//     this.dateUpdate,
//     this.dateAdded,
//     this.imagesMain,
//     this.location_Name,
//     // this.phoneNoOne,
//     // this.phoneNoTwo,
//     // this.phoneNoWhatsapp,
//     // this.phoneNoLandline,
//     this.latitude,
//     this.longitude,
//     this.comentdata,
//
//     this.typeComercialactiviessecondary,
//     this.typeComercialactivieprimery,
//     this.countNoView,
//     this.typecomercial,
//     this.urlsitecomercialactivies,
//     this.city,
//     this.created_by,
//     this.isfavorit,
//     this.countNoViewUniq,
//     this.isfollow,
//     this.NoFollow,
//     this.NoProdact,
//     this.dialCode_Phone_Number,
//     this.dialCode_whatsapp,
//     this.isoCode_Phone_Number,
//     this.isoCode_whatsapp,
//     this.Phone_Number,
//     this.Phone_Number_whatsapp,
//     this.Phone_Number_whatsapp_with_out_kay,
//     this.Phone_Number_with_out_kay,
//     this.countNoViewWithProdact,
//     this.countNoOnTapLinkOrPhone,
//     // this.isRiting,
//   });
//
//   int id;
//   String? url;
//   String? Name;
//   String? Detial_AR;
//   String? Detial_EN;
//
//   String? Name_EN;
//   String? location_Name;
//   DateTime? dateUpdate;
//   DateTime? dateAdded;
//   String? imagesMain;
//   // IsRitingComercialActivie isRiting;
//   // String? phoneNoOne;
//   // String? phoneNoTwo;
//   // String? phoneNoWhatsapp;
//   // String? phoneNoLandline;
//
//   bool?  isfavorit;
//
//   bool?  isfollow;
//   int? NoProdact;
//
//   int? NoFollow;
//   int? countNoViewWithProdact;
//
//   int? countNoOnTapLinkOrPhone;
//
//   List<ComentdataComercial> comentdata;
//
//   List<TypeComercialActivieSecondary> typeComercialactiviessecondary;
//   // CityModel city;
//   // TypeComercialActiviePrimery typeComercialactivieprimery;
//   int? countNoView;
//   int? countNoViewUniq;
//
//   List<UrlSiteComercialActiviesModel> urlsitecomercialactivies;
//
//   String? Phone_Number;
//   String? Phone_Number_with_out_kay;
//   String? Phone_Number_whatsapp;
//
//   String? Phone_Number_whatsapp_with_out_kay;
//   String? isoCode_whatsapp;
//   String? isoCode_Phone_Number;
//   String? dialCode_whatsapp;
//   String? dialCode_Phone_Number;
//
//   factory ComercialActivieModel.fromJson(Map<String, dynamic> json) =>
//       ComercialActivieModel(
//         // id: json["id"],
//         id: json["id"] == null ? 0 : json["id"],
//
//         // url: json["url"],
//         // url: json["url"]==null?'':json["url"],
//
//         // Name: json["Name"],
//         Name: json["Name"] == null ? '' : json["Name"],
//
//         location_Name:
//             json["location_Name"] != null ? json["location_Name"] : null,
//         Detial_AR: json["Detial_AR"] == null ? '' : json["Detial_AR"],
//
//         // Detial_EN: json["Detial_EN"]==null? json["Detial_AR"]==null ?'':json["Detial_AR"]:json["Detial_EN"],
//         // Name_EN: json["Name_EN"]==null? json["Name"]==null ?'':json["Name"]:json["Name_EN"],
//         // dateUpdate:json["Date_Update"] ==null?DateTime.now().add(Duration(hours: -2)):json["Date_Update"]!=null? DateTime.parse(json["Date_Update"]):null,
//         dateAdded: json["Date_Added"] == null
//             ? DateTime.now().add(Duration(hours: -2))
//             : DateTime.parse(json["Date_Added"]),
//         imagesMain: json["images_main"] == null ? null : json["images_main"],
//         //  phoneNoOne: json["PhoneNo_one"],
//         urlsitecomercialactivies: json["UrlSiteComercialActivies"] == null ||
//                 json["UrlSiteComercialActivies"].length <= 0
//             ? []
//             : List<UrlSiteComercialActiviesModel>.from(
//                 json["UrlSiteComercialActivies"].map((x) =>
//                     UrlSiteComercialActiviesModel.fromJsonForListComercial(x))),
//         city: json["city"] == null
//             ? null
//             : CityModel.fromjsonComercial(json["city"]),
//
//         typeComercialactiviessecondary:
//             json["TypeComercialActiviesSecondary"] == null
//                 ? []
//                 : List<TypeComercialActivieSecondary>.from(
//                     json["TypeComercialActiviesSecondary"].map((x) =>
//                         TypeComercialActivieSecondary.fromJsonForListComercial(
//                             x))),
//
//         typeComercialactivieprimery:
//             json["TypeComercialActiviesPrimary"] != null
//                 ? TypeComercialActiviePrimery.fromJsonForListComercial(
//                     json["TypeComercialActiviesPrimary"])
//                 : null,
//
//         comentdata: json["comentdata"] == null
//             ? []
//             : List<ComentdataComercial>.from(
//                 json["comentdata"].map((x) => ComentdataComercial.fromJson(x))),
//         created_by: json["created_by"] == null
//             ? null
//             : Users.fromJsonListComercial(json["created_by"]),
//         // phoneNoTwo: json["PhoneNo_two"],
//         //  phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //  phoneNoLandline: json["PhoneNo_landline"],
//         latitude: json["latitude"] == null ? null : json["latitude"],
//         longitude: json["longitude"] == null ? null : json["longitude"],
//         // is_riting: List<IsRitingComercial>.from(
//         //     json["isRiting"].map((x) => IsRitingComercial.fromJson(x))),
//
//
//         // countNoView: json["countNoView"],
//         countNoView: json["countNoView"] == null ? 0 : json["countNoView"],
//         countNoViewUniq:
//             json["countNoViewUniq"] == null ? 0 : json["countNoViewUniq"],
//         countNoOnTapLinkOrPhone: json["countNoOnTapLinkOrPhone"] == null
//             ? null
//             : json["countNoOnTapLinkOrPhone"],
//         countNoViewWithProdact: json["countNoViewWithProdact"] == null
//             ? 0
//             : json["countNoViewWithProdact"],
//
//         //isfavorit: json["isfavorit"]==null?false:json["isfavorit"],
//
//         isfollow: json["isfollow"] == null ? false : json["isfollow"],
//
//         NoProdact: json["NoProdact"] == null ? null : json["NoProdact"],
//         NoFollow: json["NoFollow"] == null ? null : json["NoFollow"],
//         // isRiting: json["isRiting"],
//       );
//
//   factory ComercialActivieModel.fromJsonforProdactList(
//           Map<String, dynamic> json) =>
//       ComercialActivieModel(
//         //   id: json["id"],
//         //   url: json["url"],
//         //   Name: json["Name"],
//         //   // Detial_AR: json["Detial_AR"],
//         //   // dateUpdate: json["Date_Update"]==null?null: DateTime.parse(json["Date_Update"]),
//         //   // dateAdded:json["Date_Added"]==null?null: DateTime.parse(json["Date_Added"]),
//         //   imagesMain: json["images_main"]==null?null:json["images_main"],
//         //   city: json["city"]==null?null:CityModel.fromjsonComercial( json["city"]),
//         //  // phoneNoOne: json["PhoneNo_one"],
//         //  // phoneNoTwo: json["PhoneNo_two"],
//         //   created_by:json["created_by"] ==null?null:Users.fromJsonListComercial( json["created_by"]),
//         //   // ratingdata: List<RatingdataComercial>.from(
//         //   //     json["ratingdata"].map((x) => RatingdataComercial.fromJson(x))),
//         //   //  phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //  // phoneNoLandline: json["PhoneNo_landline"],
//         //   latitude: json["latitude"]==null?null:json["latitude"]!=null?json["latitude"]:null,
//         //   longitude:  json["longitude"]!=null?json["longitude"]:null,
//         //   location_Name: json["location_Name"]!=null?json["location_Name"]:null,
//         //   // Detial_EN:   json["Detial_EN"]!=null?json["Detial_EN"]:json["Detial_AR"],
//         //   // Name_EN:   json["Name_EN"]!=null?json["Name_EN"]:json["Name"],
//         //
//         //
//         //
//         //   // isfavorit: json["isfavorit"]==null?false:json["isfavorit"],
//         //   // isfollow: json["isfollow"]==null?false:json["isfollow"],
//         //   //
//         //   // NoProdact: json["NoProdact"]==null?null:json["NoProdact"],
//         //   // NoFollow: json["NoFollow"]==null?null:json["NoFollow"],
//         //
//         //
//         //
//         //
//         //
//         //
//         //
//         //
//         // //  id: json["id"],
//         //   // url: json["url"],
//         //   // Name: json["Name"],
//         //   // location_Name: json["location_Name"]!=null?json["location_Name"]:null,
//         //   // Detial_AR: json["Detial_AR"],
//         //   // Detial_EN:   json["Detial_EN"]!=null?json["Detial_EN"]:json["Detial_AR"],
//         //   // Name_EN:   json["Name_EN"]!=null?json["Name_EN"]:json["Name"],
//         //   // dateUpdate: DateTime.parse(json["Date_Update"]),
//         //   // dateAdded: DateTime.parse(json["Date_Added"]),
//         //   // imagesMain: json["images_main"]==null?null:json["images_main"],
//         //   //  phoneNoOne: json["PhoneNo_one"],
//         //   urlsitecomercialactivies: json["UrlSiteComercialActivies"]==null||json["UrlSiteComercialActivies"].length<=0?[]: List<UrlSiteComercialActiviesModel>.from(
//         //       json["UrlSiteComercialActivies"]
//         //           .map((x) => UrlSiteComercialActiviesModel.fromJsonForListComercial(x))),
//         //   // city: json["city"]==null?null:CityModel.fromjsonComercial( json["city"]),
//         //
//         //   typeComercialactiviessecondary:json["TypeComercialActiviesSecondary"]==null?[]:
//         //   List<TypeComercialActivieSecondary>.from(
//         //       json["TypeComercialActiviesSecondary"]
//         //           .map((x) => TypeComercialActivieSecondary.fromJsonForListComercial(x))),
//         //
//         //   typeComercialactivieprimery:json["TypeComercialActiviesPrimary"]==null?null: TypeComercialActiviePrimery.fromJsonForListComercial(
//         //       json["TypeComercialActiviesPrimary"]),
//         //   typecomercial:json["TypesComercial"]==null?[]:  List<TypeComercial>.from(
//         //       json["TypesComercial"].map((x) => TypeComercial.fromJson(x))),
//         //   // comentdata: List<ComentdataComercial>.from(
//         //   //     json["comentdata"].map((x) => ComentdataComercial.fromJson(x))),
//         //   // created_by: Users.fromJsonListComercial( json["created_by"]),
//         //   // phoneNoTwo: json["PhoneNo_two"],
//         //   //  phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //   //  phoneNoLandline: json["PhoneNo_landline"],
//         //   // latitude: json["latitude"]==null?null:json["latitude"],
//         //   // longitude: json["longitude"]==null?null:json["longitude"],
//         //   is_riting: json["isRiting"]==null?[]: List<IsRitingComercial>.from(
//         //       json["isRiting"].map((x) => IsRitingComercial.fromJson(x))),
//         //
//         //
//         //   countNoView: json["countNoView"]==null?0:json["countNoView"],
//         //   countNoViewUniq: json["countNoViewUniq"]==null?0:json["countNoViewUniq"],
//         //
//         //   //isfavorit: json["isfavorit"]==null?false:json["isfavorit"],
//         //
//         //   isfollow: json["isfollow"]==null?false:json["isfollow"],
//         //   NoProdact: json["NoProdact"]==null?null:json["NoProdact"],
//         //   NoFollow: json["NoFollow"]==null?null:json["NoFollow"],
//
//         //  Activ_Time:  json["Activ_Time"]==null?null:ActivTime.fromJson(json["Activ_Time"]),
//         //   ratingdata: List<RatingdataComercial>.from(
//         //       json["ratingdata"].map((x) => RatingdataComercial.fromJson(x))),
//         //   countNoView: json["countNoView"],
//
//         //Activ_Time: ActivTime.fromJson(json["Activ_Time"]),
//
//         // id: json["id"],
//         id: json["id"] == null ? 0 : json["id"],
//
//         // url: json["url"],
//         // url: json["url"]==null?'':json["url"],
//
//         // Name: json["Name"],
//         Name: json["Name"] == null ? '' : json["Name"],
//
//         location_Name:
//             json["location_Name"] != null ? json["location_Name"] : null,
//         Detial_AR: json["Detial_AR"] == null ? '' : json["Detial_AR"],
//
//         // Detial_EN: json["Detial_EN"]==null? json["Detial_AR"]==null ?'':json["Detial_AR"]:json["Detial_EN"],
//         // Name_EN: json["Name_EN"]==null? json["Name"]==null ?'':json["Name"]:json["Name_EN"],
//         // dateUpdate:json["Date_Update"] ==null?DateTime.now().add(Duration(hours: -2)):json["Date_Update"]!=null? DateTime.parse(json["Date_Update"]):null,
//         dateAdded: json["Date_Added"] == null
//             ? DateTime.now().add(Duration(hours: -2))
//             : DateTime.parse(json["Date_Added"]),
//         imagesMain: json["images_main"] == null ? null : json["images_main"],
//         //  phoneNoOne: json["PhoneNo_one"],
//         urlsitecomercialactivies: json["UrlSiteComercialActivies"] == null ||
//                 json["UrlSiteComercialActivies"].length <= 0
//             ? []
//             : List<UrlSiteComercialActiviesModel>.from(
//                 json["UrlSiteComercialActivies"].map((x) =>
//                     UrlSiteComercialActiviesModel.fromJsonForListComercial(x))),
//         city: json["city"] == null
//             ? null
//             : CityModel.fromjsonComercial(json["city"]),
//
//         typeComercialactiviessecondary:
//             json["TypeComercialActiviesSecondary"] == null
//                 ? []
//                 : List<TypeComercialActivieSecondary>.from(
//                     json["TypeComercialActiviesSecondary"].map((x) =>
//                         TypeComercialActivieSecondary.fromJsonForListComercial(
//                             x))),
//
//         typeComercialactivieprimery:
//             json["TypeComercialActiviesPrimary"] != null
//                 ? TypeComercialActiviePrimery.fromJsonForListComercial(
//                     json["TypeComercialActiviesPrimary"])
//                 : null,
//         typecomercial: json["TypesComercial"] == null
//             ? []
//             : List<TypeComercial>.from(
//                 json["TypesComercial"].map((x) => TypeComercial.fromJson(x))),
//         comentdata: json["comentdata"] == null
//             ? []
//             : List<ComentdataComercial>.from(
//                 json["comentdata"].map((x) => ComentdataComercial.fromJson(x))),
//         created_by: json["created_by"] == null
//             ? null
//             : Users.fromJsonListComercial(json["created_by"]),
//         // phoneNoTwo: json["PhoneNo_two"],
//         //  phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //  phoneNoLandline: json["PhoneNo_landline"],
//
//         // is_riting: List<IsRitingComercial>.from(
//         //     json["isRiting"].map((x) => IsRitingComercial.fromJson(x))),
//
//         is_riting: json["isRiting"] == null
//             ? []
//             : List<IsRitingComercial>.from(
//                 json["isRiting"].map((x) => IsRitingComercial.fromJson(x))),
//
//         Activ_Time: json["Activ_Time"] == null
//             ? null
//             : ActivTime.fromJson(json["Activ_Time"]),
//         ratingdata: json["ratingdata"] == null
//             ? []
//             : List<RatingdataComercial>.from(
//                 json["ratingdata"].map((x) => RatingdataComercial.fromJson(x))),
//         // countNoView: json["countNoView"],
//         countNoView: json["countNoView"] == null ? 0 : json["countNoView"],
//         countNoViewUniq:
//             json["countNoViewUniq"] == null ? 0 : json["countNoViewUniq"],
//         countNoOnTapLinkOrPhone: json["countNoOnTapLinkOrPhone"] == null
//             ? null
//             : json["countNoOnTapLinkOrPhone"],
//         countNoViewWithProdact: json["countNoViewWithProdact"] == null
//             ? null
//             : json["countNoViewWithProdact"],
//
//         //isfavorit: json["isfavorit"]==null?false:json["isfavorit"],
//
//         isfollow: json["isfollow"] == null ? false : json["isfollow"],
//         NoProdact: json["NoProdact"] == null ? null : json["NoProdact"],
//         NoFollow: json["NoFollow"] == null ? null : json["NoFollow"],
//
//         dialCode_Phone_Number: json["dialCode_Phone_Number"] == null
//             ? ''
//             : json["dialCode_Phone_Number"],
//         isoCode_Phone_Number: json["isoCode_Phone_Number"] == null
//             ? ''
//             : json["isoCode_Phone_Number"],
//
//         isfavorit: json["isfavorit"] == null ? null : json["isfavorit"],
//
//         dialCode_whatsapp:
//             json["dialCode_whatsapp"] == null ? '' : json["dialCode_whatsapp"],
//         isoCode_whatsapp:
//             json["isoCode_whatsapp"] == null ? null : json["isoCode_whatsapp"],
//         Phone_Number:
//             json["Phone_Number"] == null ? null : json["Phone_Number"],
//         Phone_Number_whatsapp: json["Phone_Number_whatsapp"] == null
//             ? null
//             : json["Phone_Number_whatsapp"],
//         Phone_Number_whatsapp_with_out_kay:
//             json["Phone_Number_whatsapp_with_out_kay"] == null
//                 ? null
//                 : json["Phone_Number_whatsapp_with_out_kay"],
//         Phone_Number_with_out_kay: json["Phone_Number_with_out_kay"] == null
//             ? null
//             : json["Phone_Number_with_out_kay"],
//       );
//
//   factory ComercialActivieModel.fromJsonForResponseAddNewActivTime(
//           Map<String, dynamic> json) =>
//       ComercialActivieModel(
//         id: json["id"],
//
//         // url: json["url"],
//         // Name: json["Name"],
//         // Detial_AR: json["Detial_AR"],
//         // dateUpdate: DateTime.parse(json["Date_Update"]),
//         // dateAdded: DateTime.parse(json["Date_Added"]),
//         // imagesMain: json["images_main"]==null?null:json["images_main"],
//         // city: json["city"]==null?null:CityModel(
//         //     id: json["city"]
//         // ),
//
//         // city: json["city"]==null?null: json["city"],,
//         // phoneNoOne: json["PhoneNo_one"],
//         //  phoneNoTwo: json["PhoneNo_two"],
//         // phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //  phoneNoLandline: json["PhoneNo_landline"],
//         //   latitude: json["latitude"],
//         //   longitude: json["longitude"],
//         // location_Name: json["location_Name"]!=null?json["location_Name"]:null,
//         // Detial_EN:   json["Detial_EN"]!=null?json["Detial_EN"]:json["Detial_AR"],
//         // Name_EN:   json["Name_EN"]!=null?json["Name_EN"]:json["Name"],
//         //  typeComercialactiviessecondary:
//         //  json["TypeComercialActiviesSecondary"]!=null? List<TypeComercialActivieSecondary>.from(
//         //      json["TypeComercialActiviesSecondary"]
//         //          .map((x) => TypeComercialActivieSecondary.fromJsonForListComercial(x))):null,
//         // // typeComercialactivieprimery:
//         // json["TypeComercialActiviesPrimary"]!=null?
//         // TypeComercialActivieSecondary.fromJsonForListComercial(
//         //     json["TypeComercialActiviesPrimary"]):null,
//         // typecomercial: json["TypesComercial"]!=null?  List<TypeComercial>.from(
//         //     json["TypesComercial"].map((x) => TypeComercial.fromJson(x))):null,
//         //Activ_Time: ActivTime.fromJson(json["Activ_Time"]),
//       );
//
//   factory ComercialActivieModel.fromJsonForResponseSaveNew(
//           Map<String, dynamic> json) =>
//       ComercialActivieModel(
//         id: json["id"],
//         url: json["url"],
//         Name: json["Name"],
//         Detial_AR: json["Detial_AR"],
//         dateUpdate: DateTime.parse(json["Date_Update"]),
//         dateAdded: DateTime.parse(json["Date_Added"]),
//         imagesMain: json["images_main"] == null ? null : json["images_main"],
//         city: json["city"] == null ? null : CityModel(id: json["city"]),
//
//         // city: json["city"]==null?null: json["city"],,
//         // phoneNoOne: json["PhoneNo_one"],
//         //  phoneNoTwo: json["PhoneNo_two"],
//         // phoneNoWhatsapp: json["PhoneNo_whatsapp"],
//         //  phoneNoLandline: json["PhoneNo_landline"],
//         //   latitude: json["latitude"],
//         //   longitude: json["longitude"],
//         location_Name:
//             json["location_Name"] != null ? json["location_Name"] : null,
//         // Detial_EN:   json["Detial_EN"]!=null?json["Detial_EN"]:json["Detial_AR"],
//         Name_EN: json["Name_EN"] != null ? json["Name_EN"] : json["Name"],
//         //  typeComercialactiviessecondary:
//         //  json["TypeComercialActiviesSecondary"]!=null? List<TypeComercialActivieSecondary>.from(
//         //      json["TypeComercialActiviesSecondary"]
//         //          .map((x) => TypeComercialActivieSecondary.fromJsonForListComercial(x))):null,
//         // // typeComercialactivieprimery:
//         // json["TypeComercialActiviesPrimary"]!=null?
//         // TypeComercialActivieSecondary.fromJsonForListComercial(
//         //     json["TypeComercialActiviesPrimary"]):null,
//         // typecomercial: json["TypesComercial"]!=null?  List<TypeComercial>.from(
//         //     json["TypesComercial"].map((x) => TypeComercial.fromJson(x))):null,
//         //Activ_Time: ActivTime.fromJson(json["Activ_Time"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "Name": Name,
//         "Detial_AR": Detial_AR,
//         "Detial_EN": Detial_EN,
//         "Date_Update": dateUpdate.toIso8601String(),
//         "Date_Added": dateAdded.toIso8601String(),
//         "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         "latitude": latitude,
//         "longitude": longitude,
//         // 'city': city,
//       };
//
//   Map<String, dynamic> toJsonForAddNewComercial() => {
//         // "id": id,
//         // "url": url,
//         "Name": Name,
//         "Detial_AR": Detial_AR,
//         "Detial_EN": Detial_AR,
//         "Name_EN": Name,
//         "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         "latitude": latitude,
//         "longitude": longitude,
//         'city': city.id,
//         'created_by': AppData.UserAccountData.first.id,
//         "is_completed": true,
//         "is_hidden": false,
//         "is_deleted": false,
//
//         "TypeComercialActiviesPrimary": typeComercialactivieprimery.id,
//         "TypesComercial": typecomercial.map((x) => x.id).toList(),
//         "TypeComercialActiviesSecondary":
//             typeComercialactiviessecondary.map((e) => e.id).toList(),
//
//         "Phone_Number_with_out_kay": Phone_Number_with_out_kay,
//         "Phone_Number": Phone_Number,
//         "Phone_Number_whatsapp_with_out_kay":
//             Phone_Number_whatsapp_with_out_kay,
//
//         "Phone_Number_whatsapp": Phone_Number_whatsapp,
//         "isoCode_whatsapp": isoCode_whatsapp,
//         "isoCode_Phone_Number": isoCode_Phone_Number,
//         "dialCode_whatsapp": dialCode_whatsapp,
//         "dialCode_Phone_Number": dialCode_Phone_Number,
//
//
//
//
//
//     // "Name": "فلافل المعلم - فرع رقم3",
//     // "Detial_AR": "فلافل المعلم\r\nالعنوان الفرع الرئيسي : حدة المدينة مقابل جامع سنان هاتف771077757\r\nالفرع الثاني :الحي السياسي شارع عمان جانب جامع العاقل هاتف 771077705\r\nالفرع الثالث :اليمن صنعاء‎ شارع القاهرة، هاتف 771077799",
//     // "TypeComercialActiviesPrimary": null,
//     // "TypeComercialActiviesSecondary": [],
//     // "location_Name": "شارع القاهرة، صنعاء‎،اليمن",
//     // "Detial_EN": "فلافل المعلم\r\nالعنوان الفرع الرئيسي : حدة المدينة مقابل جامع سنان هاتف771077757\r\nالفرع الثاني :الحي السياسي شارع عمان جانب جامع العاقل هاتف 771077705",
//     // "Name_EN": "فلافل المعلم - فرع رقم3",
//     // "Date_Update": "2022-04-10T19:41:53.229480Z",
//     // "Date_Added": "2022-04-10T19:41:53.229457Z",
//     // "images_main": "https://www.rowadmarketing.app/media/Image/ComercialActivies/main/2022/04/10/19/41/53/16836619_254565451655686_88927842144794_pNbixBF.jpg",
//     // "latitude": 15.36963204731882,
//     // "longitude": 44.19683666254358,
//     // "TypesComercial": [],
//     // "created_by": 1,
//     // "city": 1,
//     // "is_completed": true,
//     // "is_hidden": false,
//     // "is_deleted": false,
//     // "Phone_Number_whatsapp": null,
//     // "Phone_Number_with_out_kay": null,
//     // "Phone_Number": null,
//     // "Phone_Number_whatsapp_with_out_kay": null,
//     // "isoCode_whatsapp": null,
//     // "isoCode_Phone_Number": null,
//     // "dialCode_whatsapp": null,
//     // "dialCode_Phone_Number": null
//       };
//
//   Map<String, dynamic> toJsonForOpdateOldDataComercial() => {
//         // "id": id,
//         // "url": url,
//         "Name": Name,
//         "Detial_AR": Detial_AR,
//         "Detial_EN": Detial_AR,
//         "Name_EN": Name_EN,
//         "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
//   Map<String, dynamic> toJsonForDelete() => {
//         // "id": id,
//         // "url": url,
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         // "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         "is_deleted": true,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
//
//   Map<String, dynamic> toJsonForUpdateComercialAddActiveTime() => {
//         // "id": id,
//         // "url": url,
//         "Name": Name,
//         "Detial_AR": Detial_AR,
//         "Detial_EN": Detial_AR,
//         "Name_EN": Name_EN,
//         "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         "latitude": latitude,
//         "longitude": longitude,
//         'city': city.id,
//         'created_by': AppData.UserAccountData.first.id,
//         "is_completed": true,
//         "is_hidden": false,
//         "is_deleted": false,
//         "TypeComercialActiviesPrimary": typeComercialactivieprimery.id,
//
//         "TypeComercialActiviesSecondary":
//             typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
//
//   Map<String, dynamic> toJsonForSaveNew() => {
//         "id": id,
//
//         'Activ_Time': Activ_Time.toJsonForSaveNew(),
//
//         "Name": Name,
//         "Detial_AR": Detial_AR,
//         "Detial_EN": Detial_AR,
//         "Name_EN": Name_EN,
//         "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         "latitude": latitude,
//         "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         "is_completed": true,
//         "is_hidden": false,
//         "is_deleted": false,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//         // "url": url,
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         // "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "longitude": longitude,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
//
//   Map<String, dynamic> toJsonForAddLocation() => {
//         "id": id,
//         //
//         // 'Activ_Time':Activ_Time.toJsonForSaveNew(),
//         //
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         "latitude": latitude,
//         "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "longitude": longitude,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//         // "url": url,
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         // "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "longitude": longitude,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
//   Map<String, dynamic> toJsonForSaveNewID() => {
//         "id": id,
//
//         'Activ_Time': Activ_Time.id,
//         //
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         // "location_Name": location_Name,
//         // // "Date_Update": dateUpdate.toIso8601String(),
//         // // "Date_Added": dateAdded.toIso8601String(),
//         // // "images_main": imagesMain,
//         // // "PhoneNo_one": phoneNoOne,
//         // // "PhoneNo_two": phoneNoTwo,
//         // // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // // 'city': city.id,
//         // // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "longitude": longitude,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//         // "url": url,
//         // "Name": Name,
//         // "Detial_AR": Detial_AR,
//         // "Detial_EN": Detial_EN,
//         // "Name_EN": Name_EN,
//         // "location_Name": location_Name,
//         // "Date_Update": dateUpdate.toIso8601String(),
//         // "Date_Added": dateAdded.toIso8601String(),
//         // "images_main": imagesMain,
//         // "PhoneNo_one": phoneNoOne,
//         // "PhoneNo_two": phoneNoTwo,
//         // "PhoneNo_whatsapp": phoneNoWhatsapp,
//         // "PhoneNo_landline": phoneNoLandline,
//         // "latitude": latitude,
//         // "longitude": longitude,
//         // 'city': city.id,
//         // 'created_by':AppData.UserAccountData.first.id,
//         // "is_completed": true,
//         // "is_hidden": false,
//         // "is_deleted": false,
//         // "longitude": longitude,
//         // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
//         // "TypesComercial":typecomercial.map((x) => x.id).toList(),
//         // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
//       };
// }
