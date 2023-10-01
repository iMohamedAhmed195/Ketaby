import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo_impl.dart';
import 'package:ketab/features/login_feature/presentation/view_model/login_cubit.dart';

final sl = GetIt.instance ;

class ServiceLocator {

  void init(){
    sl.registerLazySingleton(() =>DioHelper(sl()));
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton<LoginRepo>(() => LoginRepoImplementation());
    sl.registerLazySingleton(() => LoginCubit(sl()));




  }
}