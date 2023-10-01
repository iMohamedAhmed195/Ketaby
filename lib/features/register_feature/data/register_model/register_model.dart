class RegisterModel {
  Data? data;
  String? message;

  int? status;

  RegisterModel({this.data, this.message, this.status});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }


}

class User {
  int? id;
  String? name;
  String? email;
  bool? emailVerified;
  String? image;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerified,
        this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    image = json['image'];
  }


}
