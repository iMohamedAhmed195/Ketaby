import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo_impl.dart';
import 'package:ketab/features/cart_feature/presentation/view_model/cart_cubit.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo_impl.dart';
import 'package:ketab/features/favorite_feature/presentation/view_model/favorite_cubit.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo_impl.dart';
import 'package:ketab/features/login_feature/presentation/view_model/login_cubit.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo_impl.dart';
import 'package:ketab/features/register_feature/presentation/view_model/register_cubit.dart';
import 'package:ketab/features/search_feature/data/repos/search_repo.dart';
import 'package:ketab/features/search_feature/data/repos/search_repo_impl.dart';
import 'package:ketab/features/search_feature/presentation/view_model/search_cubit.dart';

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
    sl.registerLazySingleton<SearchRepo>(() => SearchRepoImpl());
    sl.registerLazySingleton(() => SearchCubit(sl()));
    sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl());
    sl.registerLazySingleton(() => FavoriteCubit(sl()));
    sl.registerLazySingleton<CartRepo>(() => CartRepoImpl());
    sl.registerLazySingleton(() => CartCubit(sl()));




  }
}