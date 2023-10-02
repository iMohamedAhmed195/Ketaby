import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo_impl.dart';
import 'package:ketab/features/login_feature/presentation/view_model/login_cubit.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo_impl.dart';
import 'package:ketab/features/register_feature/presentation/view_model/register_cubit.dart';

final sl = GetIt.instance ;

class ServiceLocator {

  void init(){
    sl.registerLazySingleton(() =>DioHelper(sl()));
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton<LoginRepo>(() => LoginRepoImplementation());
    sl.registerLazySingleton(() => LoginCubit(sl()));
    sl.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl());
    sl.registerLazySingleton(() => RegisterCubit(sl()));
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
    sl.registerLazySingleton(() => HomeCubit(sl()));




  }
}