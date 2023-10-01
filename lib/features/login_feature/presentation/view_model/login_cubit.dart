

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/login_feature/data/login_model/failure_login_model.dart';
import 'package:ketab/features/login_feature/data/login_model/login_model.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  FailureLoginModel? failureLoginModel;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void>  loginUser() async{
    emit(LoginLoading()) ;

    var result = await loginRepo.loginUser(emailController.text, passwordController.text);

    result.fold((failure) {
      failureLoginModel =  failure.failureLoginModel ;
      emit(LoginError(failure.errorMessage ,failure.failureLoginModel));
    }, (loginModel) {
      emit(LoginSuccess(loginModel));
    });
  }
}
