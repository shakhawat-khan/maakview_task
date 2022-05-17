/*
// To parse this JSON data, do
//
//     final allCategories = allCategoriesFromJson(jsonString);

import 'dart:convert';

AllCategories allCategoriesFromJson(String str) =>
    AllCategories.fromJson(json.decode(str));

String allCategoriesToJson(AllCategories data) => json.encode(data.toJson());

class AllCategories {
  AllCategories({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
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

class Children {
  Children({
    required this.data,
  });

  List<Datum> data;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.banner,
    required this.icon,
    required this.slug,
    required this.children,
    required this.id,
  });

  String name;
  String banner;
  String icon;
  String slug;
  Children children;
  int id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        banner: json["banner"],
        icon: json["icon"],
        slug: json["slug"],
        children: json["children"] == null
            ? null
            : Children.fromJson(json["children"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "banner": banner,
        "icon": icon,
        "slug": slug,
        "children": children == null ? null : children.toJson(),
        "id": id == null ? null : id,
      };
}
*/

class AllCategories {
  List<Data>? data;
  bool? success;
  int? status;

  AllCategories({this.data, this.success, this.status});

  AllCategories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? name;
  String? banner;
  String? icon;
  String? slug;
  Children? children;

  Data({this.name, this.banner, this.icon, this.slug, this.children});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    banner = json['banner'];
    icon = json['icon'];
    slug = json['slug'];
    children = json['children'] != null
        ? new Children.fromJson(json['children'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['banner'] = this.banner;
    data['icon'] = this.icon;
    data['slug'] = this.slug;
    if (this.children != null) {
      data['children'] = this.children!.toJson();
    }
    return data;
  }
}

class Children {
  List<Data>? data;

  Children({this.data});

  Children.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  int? id;
  String? name;
  String? banner;
  String? icon;
  String? slug;

  Data1({this.id, this.name, this.banner, this.icon, this.slug});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banner = json['banner'];
    icon = json['icon'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['banner'] = this.banner;
    data['icon'] = this.icon;
    data['slug'] = this.slug;
    return data;
  }
}
