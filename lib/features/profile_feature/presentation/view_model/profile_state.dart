part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}
class GetProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  GetProfileSuccess(this.profileModel);
}
class GetProfileError extends ProfileState {}
class EditProfileLoading extends ProfileState {}
class EditProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  EditProfileSuccess(this.profileModel);
}
class EditProfileError extends ProfileState {}

