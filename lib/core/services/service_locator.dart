import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/make_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/repo/make_favorite_repo.dart';
import 'package:ketab/features/book_details_feature/data/repo/make_favorite_repo_impl.dart';
import 'package:ketab/features/book_details_feature/presentation/view_model/details_cubit.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo_impl.dart';
import 'package:ketab/features/cart_feature/presentation/view_model/cart_cubit.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo_impl.dart';
import 'package:ketab/features/favorite_feature/presentation/view_model/favorite_cubit.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';
import 'package:ketab/features/layout_feature/presentation/view_model/layout_cubit.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo_impl.dart';
import 'package:ketab/features/login_feature/presentation/view_model/login_cubit.dart';
import 'package:ketab/features/profile_feature/data/repo/profile_repo.dart';
import 'package:ketab/features/profile_feature/data/repo/profile_repo_impl.dart';
import 'package:ketab/features/profile_feature/presentation/view_model/profile_cubit.dart';
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
    /// LAYOUT
    sl.registerLazySingleton(() => LayoutCubit());
    ///
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
    sl.registerFactory(() => HomeCubit(sl()));

    sl.registerLazySingleton<SearchRepo>(() => SearchRepoImpl());
    sl.registerFactory(() => SearchCubit(sl()));
    sl.registerLazySingleton<MakeAnDRemoveFavoriteRepo>(() => MakeAndRemoveFavoriteRepoImpl());
    sl.registerFactory(() => DetailsCubit(sl()));
    sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl());
    sl.registerFactory(() => FavoriteCubit(sl()));
    sl.registerLazySingleton<CartRepo>(() => CartRepoImpl());
    sl.registerFactory(() => CartCubit(sl()));
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());
    sl.registerFactory(() => ProfileCubit(sl()));





  }
}