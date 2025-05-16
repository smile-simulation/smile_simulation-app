import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_account_state.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit() : super(UserAccountInitial());
  getUserPost() {}
}
