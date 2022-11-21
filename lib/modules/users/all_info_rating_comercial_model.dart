class RatingdataHospital {
  RatingdataHospital({
    this.rating,
    this.countUserRate,
    this.totalStarRate,
    this.avrageRate,
    this.countRateOne,
    this.percentageRateOne,
    this.countRateTow,
    this.percentageRateTow,
    this.countRateThree,
    this.percentageRateThree,
    this.countRateFour,
    this.percentageRateFour,
    this.countRateFive,
    this.percentageRateFive,
    this.sumRiting,
  });

  List<Rating>? rating;
  int? countUserRate;
  int? totalStarRate;
  double? avrageRate;
  int? countRateOne;
  double? percentageRateOne;
  int? countRateTow;
  double? percentageRateTow;
  int? countRateThree;
  double? percentageRateThree;
  int? countRateFour;
  double? percentageRateFour;
  int? countRateFive;
  double? percentageRateFive;
  int? sumRiting;

  factory RatingdataHospital.fromJson(Map<String, dynamic> json) =>
      RatingdataHospital(
      //   rating:
      //       List<Rating>.from(json["Rating"].map((x) => Rating.fromJson(x))),
        countUserRate: json["CountUserRate"],
        totalStarRate: json["TotalStarRate"],
        avrageRate: json["avrageRate"],
        countRateOne: json["countRateOne"],
        percentageRateOne: json["percentageRateOne"],
        countRateTow: json["countRateTow"],
        percentageRateTow: json["percentageRateTow"],
        countRateThree: json["countRateThree"],
        percentageRateThree: json["percentageRateThree"],
        countRateFour: json["countRateFour"],
        percentageRateFour: json["percentageRateFour"],
        countRateFive: json["countRateFive"],
        percentageRateFive: json["percentageRateFive"],
        sumRiting: json["sumRiting"],
      );

  Map<String, dynamic> toJson() => {
        "Rating": List<dynamic>.from(rating!.map((x) => x.toJson())),
        "CountUserRate": countUserRate,
        "TotalStarRate": totalStarRate,
        "avrageRate": avrageRate,
        "countRateOne": countRateOne,
        "percentageRateOne": percentageRateOne,
        "countRateTow": countRateTow,
        "percentageRateTow": percentageRateTow,
        "countRateThree": countRateThree,
        "percentageRateThree": percentageRateThree,
        "countRateFour": countRateFour,
        "percentageRateFour": percentageRateFour,
        "countRateFive": countRateFive,
        "percentageRateFive": percentageRateFive,
        "sumRiting": sumRiting,
      };
}

class Rating {
  Rating({
    this.id,
    this.users,
    this.noRating,
    this.prodact,
  });

  int? id;
  int? users;
  int? noRating;
  int? prodact;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        users: json["users"],
        noRating: json["no_rating"],
        prodact: json["ComercialActivie"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users": users,
        "no_rating": noRating,
        "ComercialActivie": prodact,
      };
}
