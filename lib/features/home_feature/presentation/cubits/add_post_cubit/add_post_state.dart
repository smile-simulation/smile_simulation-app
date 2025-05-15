part of 'add_post_cubit.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {}

final class AddPostSuccess extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostFailture extends AddPostState {
  final String fail;

  AddPostFailture({required this.fail});
}

final class ImagePickedSuccess extends AddPostState {}

final class ImagePickedFailture extends AddPostState {}
