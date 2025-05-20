part of 'user_account_cubit.dart';

sealed class UserAccountState extends Equatable {
  const UserAccountState();

  @override
  List<Object> get props => [];
}

final class UserAccountInitial extends UserAccountState {}
