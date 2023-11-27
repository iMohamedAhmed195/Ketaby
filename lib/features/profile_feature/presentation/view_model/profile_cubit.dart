
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/profile_feature/data/profile_model/profile_model.dart';
import 'package:ketab/features/profile_feature/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  var nameController = TextEditingController() ;
  var phoneController = TextEditingController() ;
  var cityController = TextEditingController() ;
  var addressController = TextEditingController() ;

  var formKey = GlobalKey<FormState>() ;

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

  Future<void> editDataProfile()async{
    emit(EditProfileLoading());
    var result = await profileRepo.editDataProfile(name : nameController.text  , phone : phoneController.text, city : cityController.text, address : addressController.text);

    result.fold(
            (failure) {
              emit(EditProfileError());
            },
            (profileModel) {
              this.profileModel=profileModel;
              putDataInVar();
              emit(EditProfileSuccess(profileModel));
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
