
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/profile_feature/data/profile_model/profile_model.dart';
import 'package:ketab/features/profile_feature/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);


  final ProfileRepo profileRepo;


  /*get data for profile*/
  ProfileModel? profileModel;
  String image = '';
  String name = '';
  String email = '';
  String phone = '';
  String city = '';
  String address = '';
  Future<void> getDataProfile()async{
    emit(GetProfileLoading());
    var result = await profileRepo.getDataProfile();

    result.fold(
            (failure) {
              emit(GetProfileError());
            },
            (profileModel) {
              this.profileModel=profileModel;
              putDataInVar();
              emit(GetProfileSuccess(profileModel));
            }
    );
  }

  putDataInVar(){
    image = profileModel!.data!.image ?? '';
    name = profileModel!.data!.name!;
    email = profileModel!.data!.email!;
    phone = profileModel!.data!.phone ?? 'No phone Here';
    city = profileModel!.data!.city ?? 'No City Here';
    address = profileModel!.data!.address ?? 'No Address Here';
  }
}
