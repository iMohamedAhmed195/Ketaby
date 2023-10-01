part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel ;

  RegisterSuccess(this.registerModel);
}

class RegisterError extends RegisterState {
  final String? errMessage;
  final FailureRegisterModel? failureRegisterModel;

  RegisterError([this.errMessage , this.failureRegisterModel]);
}
