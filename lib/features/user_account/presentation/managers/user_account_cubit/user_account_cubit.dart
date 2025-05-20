import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/features/user_account/data/repos/user_details/user_details_repo_impl.dart';

part 'user_account_state.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit({required this.userDetailsRepo})
    : super(UserAccountInitial());
  final UserDetailsRepoImpl userDetailsRepo;
 
}
