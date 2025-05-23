part of 'set_user_accoun_image_cubit.dart';

sealed class SetUserAccounImageState extends Equatable {
  const SetUserAccounImageState();

  @override
  List<Object> get props => [];
}

final class SetUserAccounImageInitial extends SetUserAccounImageState {}

final class ImagePickedSuccess extends SetUserAccounImageState {}

final class ImagePickedFailture extends SetUserAccounImageState {}

final class ImagePickedLoading extends SetUserAccounImageState {}

final class SetUserAccounImageSuccess extends SetUserAccounImageState {}

final class SetUserAccounImageFail extends SetUserAccounImageState {
  final String errorMsg;

  SetUserAccounImageFail({required this.errorMsg});
}

final class SetUserAccounImageLoading extends SetUserAccounImageState {}
