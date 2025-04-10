import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_category_repo/advices_category_repo.dart';

part 'category_advices_state.dart';

class CategoryAdvicesCubit extends Cubit<CategoryAdvicesState> {
  final AdvicesCategoryRepo advicesCategoryRepo;
  List<Advice> advices = [];
  final AdvicesCategory category;
  CategoryAdvicesCubit(this.advicesCategoryRepo, {required this.category})
    : super(CategoryAdvicesInitial());

  Future<void> getAdvicesByCategoryId({required int id}) async {
    emit(GetAdvicesByCategoryIdLoading());
    var done = await advicesCategoryRepo.getAdvicesByCategoryId(id: id);
    done.fold(
      (fail) {
        emit(GetAdvicesByCategoryIdFail(fail.errorMessage));
      },
      (success) {
        advices = success;
        emit(GetAdvicesByCategoryIdSuccess(categoryAdvices: advices));
      },
    );
  }
}
