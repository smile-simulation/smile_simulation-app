import '../../../data/models/edit_profile/edit_profile_model.dart';

sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final EditProfileModel editProfileModel;
  EditProfileSuccess(this.editProfileModel);

}

final class EditProfileFailure extends EditProfileState {
  final String message;
  EditProfileFailure(this.message);
}

final class EditProfileLoading extends EditProfileState {}
