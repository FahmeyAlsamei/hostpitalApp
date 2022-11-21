
class IsRitingHospital {
  IsRitingHospital({
    this.isriting,
    this.no_rating,
  });

  int? no_rating;
  bool? isriting;


  factory IsRitingHospital.fromJson(Map<String, dynamic> json) => IsRitingHospital(
    no_rating: json["no_rating"],
    isriting: json["no_rating"]!=null?json["isRiting"]:null,
  );

  Map<String, dynamic> toJson() => {
    "isRiting": isriting,
    "no_rating": no_rating,




  };
}