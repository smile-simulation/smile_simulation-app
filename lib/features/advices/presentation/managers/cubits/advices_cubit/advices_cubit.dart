import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  final AdvicesRepo advicesRepo;
  List<Advice> advices = [];
  List<AdvicesCategory> advicesCategories = [];

  List<Advice> getAdvicesSubset({required advicesAll}) {
    return advicesAll.length < 6 ? advicesAll : advicesAll.sublist(0, 6);
  }

  List<AdvicesCategory> getAdvicesCategorySubset({
    required advicesCategoriesAll,
  }) {
    return advicesCategoriesAll.length < 6
        ? advicesCategoriesAll
        : advicesCategoriesAll.sublist(0, 6);
  }

  AdvicesCubit(this.advicesRepo) : super(AdvicesInitial());
  Future<AdvicesState?> getAdvices() async {
    var done = await advicesRepo.getGeneralAdvices();
    return done.fold(
      (fail) {
        return GetAdvicesFail(fail.errorMessage);
      },
      (success) {
        advices = success;
        return GetAdvicesSuccess(advices: advices);
      },
    );
  }

  Future<AdvicesState?> getAllAdvicesCategories() async {
    var done = await advicesRepo.getAllAdvicesCategories();
    return await done.fold(
      (fail) {
        return (GetAllAdvicesCategoriesFail(fail.errorMessage));
      },
      (success) {
        advicesCategories = success;
        return (GetAllAdvicesCategoriesSuccess(
          advicesCategory: advicesCategories,
        ));
      },
    );
  }

  Future<void> getCategoriesAndAdvices() async {
    emit(GetCategoriesAndAdvicesLoading());

    try {
      // Fetch categories and advices concurrently
      var gettingAdvicesCategoriesState = await getAllAdvicesCategories();
      var gettingAdvicesState = await getAdvices();

      // Check if both fetch operations were successful
      if (gettingAdvicesState is GetAdvicesSuccess &&
          gettingAdvicesCategoriesState is GetAllAdvicesCategoriesSuccess) {
        emit(
          GetCategoriesAndAdvicesSuccess(
            categories: advicesCategories,
            advices: advices,
          ),
        );
      }
      // Handle case where advices fetch failed but categories fetch succeeded
      else if (gettingAdvicesState is GetAdvicesFail &&
          gettingAdvicesCategoriesState is GetAllAdvicesCategoriesSuccess) {
        emit(
          CategoriesFetchSuccessWithAdvicesError(
            advicesCategory: gettingAdvicesCategoriesState.advicesCategory,
            gettingAdvicesErrorMsg: gettingAdvicesState.errorMsg,
          ),
        );
      }
      // Handle case where categories fetch failed but advices fetch succeeded
      else if (gettingAdvicesState is GetAdvicesSuccess &&
          gettingAdvicesCategoriesState is GetAllAdvicesCategoriesFail) {
        emit(
          AdvicesFetchSuccessWithCategoriesError(
            advices: gettingAdvicesState.advices,
            gettingCategoriesErrorMsg: gettingAdvicesCategoriesState.errorMsg,
          ),
        );
      }
      // Handle case where both fetch operations failed
      else {
        emit(
          GetCategoriesAndAdvicesFail(
            gettingCategoriesErrorMsg:
                gettingAdvicesCategoriesState is GetAllAdvicesCategoriesFail
                    ? gettingAdvicesCategoriesState.errorMsg
                    : '',
            gettingAdvicesErrorMsg:
                gettingAdvicesState is GetAdvicesFail
                    ? gettingAdvicesState.errorMsg
                    : '',
          ),
        );
      }
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      emit(
        GetCategoriesAndAdvicesFail(
          gettingCategoriesErrorMsg: 'حدث خطأ في استعادة الفئات',
          gettingAdvicesErrorMsg: e.errorModel.message ?? 'حدث خطأ غير متوقع',
        ),
      );
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      emit(
        GetCategoriesAndAdvicesFail(
          gettingCategoriesErrorMsg: 'حدث خطأ غير متوقع في استعادة الفئات',
          gettingAdvicesErrorMsg: 'حدث خطأ غير متوقع في استعادة النصائح',
        ),
      );
    }
  }
}
