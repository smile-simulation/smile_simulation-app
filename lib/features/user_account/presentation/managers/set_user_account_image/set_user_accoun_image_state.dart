part of 'set_user_accoun_image_cubit.dart';

abstract class SetUserAccounImageState extends Equatable {
  const SetUserAccounImageState();

  @override
  List<Object> get props => [];
}

class SetUserAccounImageInitial extends SetUserAccounImageState {}

class SetUserAccounImageLoading extends SetUserAccounImageState {}

class SetUserAccounImageSuccess extends SetUserAccounImageState {
  final String imageLink;

  const SetUserAccounImageSuccess({required this.imageLink});

  @override
  List<Object> get props => [imageLink];
}

class SetUserAccounImageFail extends SetUserAccounImageState {
  final String errorMsg;

  const SetUserAccounImageFail({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ImagePickedFailture extends SetUserAccounImageState {}