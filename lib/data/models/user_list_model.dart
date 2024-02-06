import 'dart:convert';

class UserListResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserData>? data;
  Support? support;

  UserListResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserListResponse.fromRawJson(String str) =>
      UserListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserListResponse.fromJson(Map<String, dynamic> json) => UserListResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<UserData>.from(
                json["data"]!.map((x) => UserData.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class UserData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
