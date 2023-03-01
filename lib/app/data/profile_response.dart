class ProfileResponse {
  bool? success;
  List<Data>? data;
  String? message;
  int? code;

  ProfileResponse({this.success, this.data, this.message, this.code});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? title;
  String? image;
  String? desc;
  String? type;
  String? endpoint;

  Data({this.title, this.image, this.desc, this.type, this.endpoint});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    desc = json['desc'];
    type = json['type'];
    endpoint = json['endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['endpoint'] = this.endpoint;
    return data;
  }
}