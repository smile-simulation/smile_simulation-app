part of 'category_advices_cubit.dart';

sealed class CategoryAdvicesState extends Equatable {
  const CategoryAdvicesState();

  @override
  List<Object> get props => [];
}

final class CategoryAdvicesInitial extends CategoryAdvicesState {}

final class GetAdvicesByCategoryIdSuccess extends CategoryAdvicesState {}

final class GetAdvicesByCategoryIdFail extends CategoryAdvicesState {
  final String errorMsg;
  GetAdvicesByCategoryIdFail(this.errorMsg);
}

final class GetAdvicesByCategoryIdLoading extends CategoryAdvicesState {}
