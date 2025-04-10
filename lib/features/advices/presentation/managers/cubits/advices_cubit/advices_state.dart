part of 'advices_cubit.dart';

sealed class AdvicesState extends Equatable {
  const AdvicesState();

  @override
  List<Object> get props => [];
}

final class AdvicesInitial extends AdvicesState {}

final class GetCategoriesAndAdvicesLoading extends AdvicesState {}

final class AdvicesFetchSuccessWithCategoriesError extends AdvicesState {
  final List<Advice> advices;
  final String? gettingCategoriesErrorMsg;
  AdvicesFetchSuccessWithCategoriesError({
    required this.advices,
    this.gettingCategoriesErrorMsg,
  });
}

final class CategoriesFetchSuccessWithAdvicesError extends AdvicesState {
  final List<AdvicesCategory> advicesCategory;
  final String? gettingAdvicesErrorMsg;

  CategoriesFetchSuccessWithAdvicesError({
    required this.advicesCategory,
    this.gettingAdvicesErrorMsg,
  });
}

final class GetCategoriesAndAdvicesSuccess extends AdvicesState {
  final List<AdvicesCategory> categories;
  final List<Advice> advices;

  GetCategoriesAndAdvicesSuccess({
    required this.categories,
    required this.advices,
  });
}

final class GetCategoriesAndAdvicesFail extends AdvicesState {
  final String gettingCategoriesErrorMsg;
  final String gettingAdvicesErrorMsg;
  GetCategoriesAndAdvicesFail({
    required this.gettingCategoriesErrorMsg,
    required this.gettingAdvicesErrorMsg,
  });
}

final class GetAdvicesSuccess extends AdvicesState {
  final List<Advice> advices;
  GetAdvicesSuccess({required this.advices});
}

final class GetAdvicesFail extends AdvicesState {
  final String errorMsg;
  GetAdvicesFail(this.errorMsg);
}

final class GetAllAdvicesCategoriesSuccess extends AdvicesState {
  final List<AdvicesCategory> advicesCategory;
  GetAllAdvicesCategoriesSuccess({required this.advicesCategory});
}

final class GetAllAdvicesCategoriesFail extends AdvicesState {
  final String errorMsg;
  GetAllAdvicesCategoriesFail(this.errorMsg);
}

final class GetTodaysAdviceLoading extends AdvicesState {}

final class GetTodaysAdviceSuccess extends AdvicesState {
  final Advice advice;

  const GetTodaysAdviceSuccess(this.advice);
}

final class GetTodaysAdviceFailture extends AdvicesState {
  final String error;

  const GetTodaysAdviceFailture(this.error);
}
