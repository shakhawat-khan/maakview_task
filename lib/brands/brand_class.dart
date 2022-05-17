// To parse this JSON data, do
//
//     final allBrands = allBrandsFromJson(jsonString);

import 'dart:convert';

AllBrands allBrandsFromJson(String str) => AllBrands.fromJson(json.decode(str));

String allBrandsToJson(AllBrands data) => json.encode(data.toJson());

class AllBrands {
  AllBrands({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory AllBrands.fromJson(Map<String, dynamic> json) => AllBrands(
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
    required this.id,
    required this.slug,
    required this.name,
    required this.logo,
  });

  int id;
  String slug;
  String name;
  String logo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "logo": logo,
      };
}
