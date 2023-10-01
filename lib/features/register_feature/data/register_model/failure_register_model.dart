class FailureRegisterModel {
  String? message;
  Errors? errors;
  int? status;

  FailureRegisterModel({ this.message, this.errors, this.status});

  FailureRegisterModel.fromJson(Map<String, dynamic> json) {

    message = json['message'];
    errors =
    json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    status = json['status'];
  }

}

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? password;

  Errors({this.name, this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    name = json['name'].cast<String>();
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }


}
