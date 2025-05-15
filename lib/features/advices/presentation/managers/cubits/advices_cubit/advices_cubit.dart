import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/helper_functions/random_list.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  final AdvicesRepo advicesRepo;
  List<Advice> advices = [];
  List<AdvicesCategory> advicesCategories = [];
  Advice? toDaysAdvice;

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

  static Future<bool> checkGettingData() async {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    String date = "$day - $month - $year";
    String? myDate = await CacheHelper().getData(key: "date");
    bool getAPIData = false;
    if (myDate == null) {
      await CacheHelper().saveData(key: "date", value: date);
      getAPIData = true;
    } else {
      if (myDate == date) {
        getAPIData = false;
      } else {
        getAPIData = true;
        await CacheHelper().saveData(key: "date", value: date);
      }
    }
    return getAPIData;
  }

  Future<void> getTodaysAdvice({required List<Advice> myAdvices}) async {
    bool getAPIData = await checkGettingData();
    Advice advice;
    if (getAPIData) {
      advice = advices.randomItem();
      await CacheHelper().saveMap(key: "advice", value: advice.toJson());
    } else {
      String? jsonString = CacheHelper().getDataString(key: "advice");

      Map<String, dynamic> adviceJson = jsonDecode(jsonString!);

      advice = Advice.fromJson(adviceJson);
    }
    log("Todays advice: ${advice.toJson()}");
    toDaysAdvice = advice;
    if (getAPIData) {
      LocalNotificationService.sendLocalNotification(
        title: toDaysAdvice!.title!,
        body: toDaysAdvice!.description!,
      );
    }
  }
}
