
// import 'table_activ_time.dart';



import 'package:project/modules/users/table_activ_time.dart';

class ActivTime {
  ActivTime({
    this.id,
    this.url,
    this.dateUpdate,
    this.dateAdded,

    this.Fri_Activ_From,
    this.Fri_Activ_To,
    this.Fri_Type_Activ=false,

    this.Fri_Activ_From_Scond,
    this.Fri_Activ_To_Scond,

    this.Mon_Activ_From='08:00 AM',
    this.Mon_Activ_To='04:00 PM',
    this.Mon_Type_Activ=true,

    this.Mon_Activ_From_Scond,
    this.Mon_Activ_To_Scond,

    this.Sat_Activ_From='08:00 AM',
    this.Sat_Activ_To='04:00 PM',
    this.Sat_Type_Activ=true,
    this.Sat_Activ_From_Scond,
    this.Sat_Activ_To_Scond,

    this.Table_Activ_Time,

    this.Sun_Activ_From='08:00 AM',
    this.Sun_Activ_To='04:00 PM',
    this.Sun_Type_Activ=true,

    this.Sun_Activ_From_Scond,
    this.Sun_Activ_To_Scond,

    this.Thurs_Activ_From='08:00 AM',
    this.Thurs_Activ_To='04:00 PM',
    this.Thurs_Type_Activ=true,

    this.Thurs_Activ_From_Scond,
    this.Thurs_Activ_To_Scond,

    this.Tue_Activ_From='08:00 AM',
    this.Tue_Activ_To='04:00 PM',
    this.Tue_Type_Activ=true,

    this.Tue_Activ_From_Scond   ,//='08:00 PM',
    this.Tue_Activ_To_Scond      ,//='04:00 AM',


    this.Wed_Activ_From='08:00 AM',
    this.Wed_Activ_To='04:00 PM',
    this.Wed_Type_Activ=true,

    this.Wed_Activ_From_Scond,
    this.Wed_Activ_To_Scond,
  }){
    if(this.Table_Activ_Time==null){
      this.Table_Activ_Time==TableActivTime(
          id: 1,
          Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"
      );
    }

  }

  TableActivTime? Table_Activ_Time=TableActivTime(
  id: 1,
  Tables_Type_Activ_From: "مفتوح حسب ساعات محدود"
  );
  bool? Sat_Type_Activ;
  bool? Sun_Type_Activ;
  bool? Mon_Type_Activ;
  bool? Tue_Type_Activ;

  bool? Wed_Type_Activ;
  bool? Thurs_Type_Activ;
  bool? Fri_Type_Activ;

  // DateTime Sat_Activ_From;
  // DateTime Thurs_Activ_To;
  // DateTime Thurs_Activ_From;
  // DateTime Wed_Activ_To;
  // DateTime Wed_Activ_From;
  // DateTime Tue_Activ_To;
  // DateTime Tue_Activ_From;
  // DateTime Mon_Activ_To;
  // DateTime Sun_Activ_To;
  // DateTime Mon_Activ_From;
  // DateTime Sat_Activ_To;
  // DateTime Sun_Activ_From;
  // DateTime Fri_Activ_To;
  // DateTime Fri_Activ_From;

  String? Sat_Activ_From;
  String? Sat_Activ_To;
  String? Thurs_Activ_To;
  String? Thurs_Activ_From;
  String? Wed_Activ_To;
  String? Wed_Activ_From;
  String? Tue_Activ_To;
  String? Tue_Activ_From;
  String? Mon_Activ_To;
  String? Sun_Activ_To;
  String? Mon_Activ_From;
  String? Sun_Activ_From;
  String? Fri_Activ_To;
  String? Fri_Activ_From;

  String? Sat_Activ_From_Scond;
  String? Sat_Activ_To_Scond;
  String? Thurs_Activ_To_Scond;
  String? Thurs_Activ_From_Scond;
  String? Wed_Activ_To_Scond;
  String? Wed_Activ_From_Scond;
  String? Tue_Activ_To_Scond;
  String? Tue_Activ_From_Scond;
  String? Mon_Activ_To_Scond;
  String? Sun_Activ_To_Scond;
  String? Mon_Activ_From_Scond;
  String? Sun_Activ_From_Scond;
  String? Fri_Activ_To_Scond;
  String? Fri_Activ_From_Scond;

  int? id;
  String? url;

  DateTime? dateUpdate;
  DateTime? dateAdded;

  factory ActivTime.fromJson(Map<String, dynamic> json) => ActivTime(
        id: json["id"],
        // url: json["url"],
        //Fri_Activ_From: json["Fri_Activ_From"],
        //  Fri_Activ_To: json["Fri_Activ_To"],
        // dateUpdate: DateTime.parse(json["Date_Update"]),
        // dateAdded: DateTime.parse(json["Date_Update"]),

        //Mon_Activ_From:paresTime((json["Mon_Activ_From"])),

        //Sat_Activ_From:paresTime(json["Sat_Activ_From"]),
        //Sat_Activ_To: paresTime(json["Sat_Activ_To"]),
        // Table_Activ_Time: json["Table_Activ_Time"] != null
        //     ? TableActivTime.fromJson(json["Table_Activ_Time"])
        //     : null,

    Table_Activ_Time: json["Table_Activ_Time"] == null
        ? null:TableActivTime.fromJson(
        json["Table_Activ_Time"]
    ),



        Sat_Activ_From:
            json["Sat_Activ_From"] != null ? json["Sat_Activ_From"]: null,
        Sat_Type_Activ:
            json["Sat_Type_Activ"] != null ? json["Sat_Type_Activ"]: null,
        Sat_Activ_To: json["Sat_Activ_To"] != null ? json["Sat_Activ_To"]: null,
        Sat_Activ_From_Scond: json["Sat_Activ_From_Scond"] != null ?
            json["Sat_Activ_From_Scond"]: null,
        Sat_Activ_To_Scond:
            json["Sat_Activ_To_Scond"] != null ? json["Sat_Activ_To_Scond"]: null,
        Sun_Activ_From:
            json["Sun_Activ_From"] != null ? json["Sun_Activ_From"]: null,
        Sun_Activ_To: json["Sun_Activ_To"] != null ? json["Sun_Activ_To"]: null,
        Sun_Type_Activ:
            json["Sun_Type_Activ"] != null ? json["Sun_Type_Activ"]: null,
        Sun_Activ_From_Scond: json["Sun_Activ_From_Scond"] != null ?
            json["Sun_Activ_From_Scond"]: null,
        Sun_Activ_To_Scond:
            json["Sun_Activ_To_Scond"] != null ? json["Sun_Activ_To_Scond"]: null,
        Mon_Activ_To: json["Mon_Activ_To"] != null ? json["Mon_Activ_To"]: null,
        Mon_Activ_To_Scond:
            json["Mon_Activ_To_Scond"] != null ? json["Mon_Activ_To_Scond"]: null,
        Mon_Activ_From_Scond: json["Mon_Activ_From_Scond"] != null ?
            json["Mon_Activ_From_Scond"]: null,
        Mon_Activ_From:
            json["Mon_Activ_From"] != null ? json["Mon_Activ_From"]: null,
        Mon_Type_Activ:
            json["Mon_Type_Activ"] != null ? json["Mon_Type_Activ"]: null,
        Tue_Activ_From:
            json["Tue_Activ_From"] != null ? json["Tue_Activ_From"]: null,
        Tue_Activ_To: json["Tue_Activ_To"] != null ? json["Tue_Activ_To"]: null,
        Tue_Type_Activ:
            json["Tue_Type_Activ"] != null ? json["Tue_Type_Activ"]: null,
        Tue_Activ_From_Scond: json["Tue_Activ_From_Scond"] != null ?
            json["Tue_Activ_From_Scond"]: null,
        Tue_Activ_To_Scond:
            json["Tue_Activ_To_Scond"] != null ? json["Tue_Activ_To_Scond"]: null,
        Wed_Activ_From:
            json["Wed_Activ_From"] != null ? json["Wed_Activ_From"]: null,
        Wed_Activ_To: json["Wed_Activ_To"] != null ? json["Wed_Activ_To"]: null,
        Wed_Type_Activ:
            json["Wed_Type_Activ"] != null ? json["Wed_Type_Activ"]: null,
        Wed_Activ_From_Scond: json["Wed_Activ_From_Scond"] != null ?
            json["Wed_Activ_From_Scond"]: null,
        Wed_Activ_To_Scond:
            json["Wed_Activ_To_Scond"] != null ? json["Wed_Activ_To_Scond"]: null,
        Thurs_Activ_From_Scond: json["Thurs_Activ_From_Scond"] != null ?
            json["Thurs_Activ_From_Scond"]: null,
        Thurs_Activ_To_Scond: json["Thurs_Activ_To_Scond"] != null ?
            json["Thurs_Activ_To_Scond"]: null,
        Thurs_Activ_From:
            json["Thurs_Activ_From"] != null ? json["Thurs_Activ_From"]: null,
        Thurs_Activ_To:
            json["Thurs_Activ_To"] != null ? json["Thurs_Activ_To"]: null,
        Thurs_Type_Activ:
            json["Thurs_Type_Activ"] != null ? json["Thurs_Type_Activ"]: null,
        Fri_Type_Activ:
            json["Fri_Type_Activ"] != null ? json["Fri_Type_Activ"]: null,
        Fri_Activ_From:
            json["Fri_Activ_From"] != null ? json["Fri_Activ_From"]: null,
        Fri_Activ_To: json["Fri_Activ_To"] != null ? json["Fri_Activ_To"]: null,
        Fri_Activ_From_Scond: json["Fri_Activ_From_Scond"] != null ?
            json["Fri_Activ_From_Scond"]: null,
        Fri_Activ_To_Scond:
            json["Fri_Activ_To_Scond"] != null ? json["Fri_Activ_To_Scond"]: null,
      );
  factory ActivTime.fromJsonSave(Map<String, dynamic> json) => ActivTime(
    id: json["id"],
    // url: json["url"],
    //Fri_Activ_From: json["Fri_Activ_From"],
    //  Fri_Activ_To: json["Fri_Activ_To"],
    dateUpdate: DateTime.parse(json["Date_Update"]),
    dateAdded: DateTime.parse(json["Date_Update"]),

    //Mon_Activ_From:paresTime((json["Mon_Activ_From"])),

    //Sat_Activ_From:paresTime(json["Sat_Activ_From"]),
    //Sat_Activ_To: paresTime(json["Sat_Activ_To"]),
    Table_Activ_Time:  json["Table_Activ_Time"]!=null?TableActivTime(
    id:json["Table_Activ_Time"]
    ):null,

    Sat_Activ_From:
    json["Sat_Activ_From"] != null ? json["Sat_Activ_From"]: null,
    Sat_Type_Activ:
    json["Sat_Type_Activ"] != null ? json["Sat_Type_Activ"]: null,
    Sat_Activ_To: json["Sat_Activ_To"] != null ? json["Sat_Activ_To"]: null,
    Sat_Activ_From_Scond: json["Sat_Activ_From_Scond"] != null ?
    json["Sat_Activ_From_Scond"]: null,
    Sat_Activ_To_Scond:
    json["Sat_Activ_To_Scond"] != null ? json["Sat_Activ_To_Scond"]: null,
    Sun_Activ_From:
    json["Sun_Activ_From"] != null ? json["Sun_Activ_From"]: null,
    Sun_Activ_To: json["Sun_Activ_To"] != null ? json["Sun_Activ_To"]: null,
    Sun_Type_Activ:
    json["Sun_Type_Activ"] != null ? json["Sun_Type_Activ"]: null,
    Sun_Activ_From_Scond: json["Sun_Activ_From_Scond"] != null ?
    json["Sun_Activ_From_Scond"]: null,
    Sun_Activ_To_Scond:
    json["Sun_Activ_To_Scond"] != null ? json["Sun_Activ_To_Scond"]: null,
    Mon_Activ_To: json["Mon_Activ_To"] != null ? json["Mon_Activ_To"]: null,
    Mon_Activ_To_Scond:
    json["Mon_Activ_To_Scond"] != null ? json["Mon_Activ_To_Scond"]: null,
    Mon_Activ_From_Scond: json["Mon_Activ_From_Scond"] != null ?
    json["Mon_Activ_From_Scond"]: null,
    Mon_Activ_From:
    json["Mon_Activ_From"] != null ? json["Mon_Activ_From"]: null,
    Mon_Type_Activ:
    json["Mon_Type_Activ"] != null ? json["Mon_Type_Activ"]: null,
    Tue_Activ_From:
    json["Tue_Activ_From"] != null ? json["Tue_Activ_From"]: null,
    Tue_Activ_To: json["Tue_Activ_To"] != null ? json["Tue_Activ_To"]: null,
    Tue_Type_Activ:
    json["Tue_Type_Activ"] != null ? json["Tue_Type_Activ"]: null,
    Tue_Activ_From_Scond: json["Tue_Activ_From_Scond"] != null ?
    json["Tue_Activ_From_Scond"]: null,
    Tue_Activ_To_Scond:
    json["Tue_Activ_To_Scond"] != null ? json["Tue_Activ_To_Scond"]: null,
    Wed_Activ_From:
    json["Wed_Activ_From"] != null ? json["Wed_Activ_From"]: null,
    Wed_Activ_To: json["Wed_Activ_To"] != null ? json["Wed_Activ_To"]: null,
    Wed_Type_Activ:
    json["Wed_Type_Activ"] != null ? json["Wed_Type_Activ"]: null,
    Wed_Activ_From_Scond: json["Wed_Activ_From_Scond"] != null ?
    json["Wed_Activ_From_Scond"]: null,
    Wed_Activ_To_Scond:
    json["Wed_Activ_To_Scond"] != null ? json["Wed_Activ_To_Scond"]: null,
    Thurs_Activ_From_Scond: json["Thurs_Activ_From_Scond"] != null ?
    json["Thurs_Activ_From_Scond"]: null,
    Thurs_Activ_To_Scond: json["Thurs_Activ_To_Scond"] != null ?
    json["Thurs_Activ_To_Scond"]: null,
    Thurs_Activ_From:
    json["Thurs_Activ_From"] != null ? json["Thurs_Activ_From"]: null,
    Thurs_Activ_To:
    json["Thurs_Activ_To"] != null ? json["Thurs_Activ_To"]: null,
    Thurs_Type_Activ:
    json["Thurs_Type_Activ"] != null ? json["Thurs_Type_Activ"]: null,
    Fri_Type_Activ:
    json["Fri_Type_Activ"] != null ? json["Fri_Type_Activ"]: null,
    Fri_Activ_From:
    json["Fri_Activ_From"] != null ? json["Fri_Activ_From"]: null,
    Fri_Activ_To: json["Fri_Activ_To"] != null ? json["Fri_Activ_To"]: null,
    Fri_Activ_From_Scond: json["Fri_Activ_From_Scond"] != null ?
    json["Fri_Activ_From_Scond"]: null,
    Fri_Activ_To_Scond:
    json["Fri_Activ_To_Scond"] != null ? json["Fri_Activ_To_Scond"]: null,
  );

  Map<String, dynamic> toJsonForSaveNew() => {
        // "id": id,
        "Table_Activ_Time": Table_Activ_Time!.id,
        "Sat_Activ_From": Sat_Activ_From,
        "Sat_Type_Activ": Sat_Type_Activ,
        "Sat_Activ_To": Sat_Activ_To,
        "Sat_Activ_From_Scond": Sat_Activ_From_Scond,
        "Sat_Activ_To_Scond": Sat_Activ_To_Scond,
        "Sun_Activ_From": Sun_Activ_From,
        "Sun_Activ_To": Sun_Activ_To,
        "Sun_Type_Activ": Sun_Type_Activ,
        "Sun_Activ_From_Scond": Sun_Activ_From_Scond,
        "Sun_Activ_To_Scond": Sun_Activ_To_Scond,
        "Mon_Activ_To": Mon_Activ_To,
        "Mon_Activ_To_Scond": Mon_Activ_To_Scond,
        "Mon_Activ_From_Scond": Mon_Activ_From_Scond,
        "Mon_Activ_From": Mon_Activ_From,
        "Mon_Type_Activ": Mon_Type_Activ,
        "Tue_Activ_From": Tue_Activ_From,
        "Tue_Activ_To": Tue_Activ_To,
        "Tue_Type_Activ": Tue_Type_Activ,
        "Tue_Activ_From_Scond": Tue_Activ_From_Scond,
        "Tue_Activ_To_Scond": Tue_Activ_To_Scond,
        "Wed_Activ_From": Wed_Activ_From,
        "Wed_Activ_To": Wed_Activ_To,
        "Wed_Type_Activ": Wed_Type_Activ,
        "Wed_Activ_From_Scond": Wed_Activ_From_Scond,
        "Wed_Activ_To_Scond": Wed_Activ_To_Scond,
        "Thurs_Activ_From_Scond": Thurs_Activ_From_Scond,
        "Thurs_Activ_To_Scond": Thurs_Activ_To_Scond,
        "Thurs_Activ_From": Thurs_Activ_From,
        "Thurs_Activ_To": Thurs_Activ_To,
        "Thurs_Type_Activ": Thurs_Type_Activ,
        "Fri_Type_Activ": Fri_Type_Activ,
        "Fri_Activ_From": Fri_Activ_From,
        "Fri_Activ_To": Fri_Activ_To,
        "Fri_Activ_From_Scond": Fri_Activ_From_Scond,
        "Fri_Activ_To_Scond": Fri_Activ_To_Scond,
        // "TypeComercialActiviesPrimary":typeComercialactivieprimery.id,
        // "TypesComercial":typecomercial.map((x) => x.id).toList(),
        // "TypeComercialActiviesSecondary":typeComercialactiviessecondary.map((e) => e.id).toList()
      };
}
