// To parse this JSON data, do
//
//     final allOffers = allOffersFromJson(jsonString);

import 'dart:convert';

AllOffers allOffersFromJson(String str) => AllOffers.fromJson(json.decode(str));

String allOffersToJson(AllOffers data) => json.encode(data.toJson());

class AllOffers {
  AllOffers({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory AllOffers.fromJson(Map<String, dynamic> json) => AllOffers(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "status": status,
      };
}

class Datum {
  Datum({
    required this.title,
    required this.slug,
    required this.banner,
    required this.startDate,
    required this.endDate,
  });

  String title;
  String slug;
  String banner;
  String startDate;
  String endDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        slug: json["slug"],
        banner: json["banner"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "banner": banner,
        "start_date": startDate,
        "end_date": endDate,
      };
}
