
class RatingHospitalModel {
  RatingHospitalModel({
    this.hospital,
    this.users,
    this.id,

    this.no_rating,
  });
  int? id;
  int? no_rating;
  int? users;


  int? hospital;


  factory RatingHospitalModel.fromJson(Map<String, dynamic> json) => RatingHospitalModel(
    no_rating: json["no_rating"],
    hospital: json["hospital"],
    users: json["users"],
    id: json["id"],


  );

  Map<String, dynamic> toJson() => {
    "users": users,
    "no_rating": no_rating,
    "hospital": hospital,
    // "id": id,




  };
}