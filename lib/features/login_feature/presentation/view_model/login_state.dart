part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginModel loginModel ;

   LoginSuccess(this.loginModel);
}

class LoginError extends LoginState {
  final String? errMessage;
  final FailureLoginModel? failureLoginModel;

    LoginError([this.errMessage , this.failureLoginModel]);
}
