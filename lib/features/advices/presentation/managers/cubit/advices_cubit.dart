import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo_impl.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  final AdvicesRepo advicesRepo;
  List<Advice> advices = [];
  AdvicesCubit(this.advicesRepo) : super(AdvicesInitial());
  getAdvices() async {
    emit(GetAdvicesLoading());
    var done = await advicesRepo.getGeneralAdvices();
    done.fold(
      (fail) {
        emit(GetAdvicesFail());
      },
      (success) {
        advices = success;
        emit(GetAdvicesSuccess());
      },
    );
  }
}
