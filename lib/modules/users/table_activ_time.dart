
DateTime date_defult = DateTime.now();
// const DateTime date_defult = _date_defult;

class TableActivTime {
  TableActivTime({
    this.id,
    this.url,
    this.Tables_Type_Activ_From,
    this.dateUpdate,
    this.dateAdded,

  }){
   if(   this.dateAdded==null){
     this.dateAdded=date_defult;
   }
   if(   this.dateUpdate==null){
     this.dateUpdate=date_defult;
   }
  }

  int? id;
  String? url;
  String? Tables_Type_Activ_From;

   DateTime? dateUpdate;
   DateTime? dateAdded;


  factory TableActivTime.fromJson(Map<String, dynamic> json) => TableActivTime(
    id: json["id"],
    // url: json["url"],

    Tables_Type_Activ_From: json["Tables_Type_Activ_From"],
    //dateUpdate: DateTime.parse(json["Date_Update"]),
    //dateAdded: DateTime.parse(json["Date_Added"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "Tables_Type_Activ_From": Tables_Type_Activ_From,
    "Date_Update": dateUpdate?.toIso8601String(),
    "Date_Added": dateAdded?.toIso8601String(),
  };

  Map<String, dynamic> toJsonForSave() => {
     "id": id,
    // "url": url,
    "Tables_Type_Activ_From": Tables_Type_Activ_From,
    // "Date_Update": dateUpdate.toIso8601String(),
    // "Date_Added": dateAdded.toIso8601String(),
  };
}