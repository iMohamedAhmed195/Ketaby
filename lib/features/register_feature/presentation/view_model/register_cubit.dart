import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/register_feature/data/register_model/failure_register_model.dart';
import 'package:ketab/features/register_feature/data/register_model/register_model.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo.dart';
import 'package:meta/meta.dart';



part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
 final RegisterRepo registerRepo;
 FailureRegisterModel? failureRegisterModel;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var registerKey = GlobalKey<FormState>();

   Future<void> registerInApp() async{
     emit(RegisterLoading());
     var result = await  registerRepo.registerInApp(name: nameController.text, email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text);

     result.fold(
             (failure) {
               failureRegisterModel =  failure.failureRegisterModel ;
               emit(RegisterError(failure.errorMessage ,failure.failureRegisterModel!));
             },
             (registerModel) {
               emit(RegisterSuccess(registerModel));
             });

   }
}
