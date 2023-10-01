class FailureLoginModel {
  String? message;
  Errors? errors;
  int? status;

  FailureLoginModel({ this.message, this.errors, this.status});

  FailureLoginModel.fromJson(Map<String, dynamic> json) {

    message = json['message'];
    errors =
    json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    status = json['status'];
  }
}

class Errors {
  List<String>? email;
  List<String>? password;

  Errors({this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

}
