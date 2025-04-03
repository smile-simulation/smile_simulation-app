part of 'advices_cubit.dart';

sealed class AdvicesState extends Equatable {
  const AdvicesState();

  @override
  List<Object> get props => [];
}

final class AdvicesInitial extends AdvicesState {}
final class GetAdvicesSuccess extends AdvicesState {}
final class GetAdvicesFail extends AdvicesState {}
final class GetAdvicesLoading extends AdvicesState {}
