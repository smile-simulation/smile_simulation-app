part of 'edit_post_cubit.dart';

sealed class EditPostState extends Equatable {
  const EditPostState();

  @override
  List<Object> get props => [];
}

final class EditPostInitial extends EditPostState {}

final class EditPostSuccess extends EditPostState {
  final String message;

  EditPostSuccess({required this.message});
}

final class EditPostLoading extends EditPostState {}

final class EditPostFailture extends EditPostState {
  final String message;

  EditPostFailture({required this.message});
}

final class ImagePickedSuccess extends EditPostState {}

final class ImagePickedFailture extends EditPostState {}

final class ImagePickedLoading extends EditPostState {}
