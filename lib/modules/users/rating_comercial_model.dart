// import 'dart:convert';
//
// /// ClientModel.dart
// // import 'dart:convert';
//
// RatingComercialActivieModel ratingComercialFromJson(String str) {
//   final jsonData = json.decode(str);
//   return RatingComercialActivieModel.fromMap(jsonData);
// }
//
// String ratingComercialToJson(RatingComercialActivieModel data) {
//   final dyn = data.toMap();
//   return json.encode(dyn);
// }
//
// class RatingComercialActivieModel {
//   int? id;
//   int? ComercialActivie;
//   int? users;
//   int? noRating;
//   DateTime? dateUpdate;
//   DateTime? dateAdded;
//   String? iMEIDevice;
//
//   RatingComercialActivieModel({
//     this.id,
//     this.ComercialActivie,
//     this.users,
//     this.noRating,
//     this.dateUpdate,
//     this.dateAdded,
//     this.iMEIDevice,
//   });
//
//   int? get getId => id;
//
//   int? get getComercialActivie => ComercialActivie;
//
//   int? get getUsers => users;
//
//   int? get getNoRating => noRating;
//
//   String? get getIMEI_device => iMEIDevice;
//
//   set setIMEI_device(String) => iMEIDevice;
//
//   // set setIMEI_device(String? imei) {
//   //   IMEI_device = imei;
//   // }
//   DateTime? get getDateUpdate => dateUpdate;
//
//   DateTime? get getDate_Added => dateAdded;
//
//   factory RatingComercialActivieModel.fromMap(Map<String, dynamic> json) =>
//       new RatingComercialActivieModel(
//         id: json["id"],
//         ComercialActivie: json["ComercialActivie"],
//         users: json["users"],
//         noRating: json["no_rating"],
//         // sortRules?.getSortTitle() ?? ''
//         iMEIDevice: json["IMEI_device"]!=null ? json["IMEI_device"]:'',
//         dateAdded: json["Date_Added"] != null ? DateTime.parse(json["Date_Update"]):DateTime.now(),
//         dateUpdate: json["Date_Update"] != null
//             ? DateTime.parse(json["Date_Update"]):DateTime.now(),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "ComercialActivie": ComercialActivie,
//         "users": users,
//         "no_rating": noRating,
//         "IMEI_device": iMEIDevice
//       };
//
// /*
//
//   factory Customer.fromJson(Map<String, dynamic> data) => new Customer(
//     id: data["id"],
//     firstdate_view: data["first_date_view"],
//     lastdate_view: data["last_date_view"],
//     email: data["email"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "first_date_view": firstdate_view,
//     "last_date_view": lastdate_view,
//     "email": email,
//   };
// */
// }
