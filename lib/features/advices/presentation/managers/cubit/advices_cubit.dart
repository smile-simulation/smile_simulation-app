import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  final AdvicesRepo advicesRepo;
  List<Advice> advices = [];
  List<AdvicesCategory> advicesCategories = [];

  AdvicesCubit(this.advicesRepo) : super(AdvicesInitial());
  Future<void> getAdvices() async {
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

  Future<void> getAllAdvicesCategories() async {
    emit(GetAllAdvicesCategoriesLoading());
    var done = await advicesRepo.getAllAdvicesCategories();
    done.fold(
      (fail) {
        emit(GetAllAdvicesCategoriesFail());
      },
      (success) {
        advicesCategories = success;
        emit(GetAllAdvicesCategoriesSuccess());
      },
    );
  }
}
