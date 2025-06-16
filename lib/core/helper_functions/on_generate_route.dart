import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/features/about_us/presentaion/views/about_us_view.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_category_repo/advices_category_repo.dart';
import 'package:smile_simulation/features/advices/presentation/managers/cubits/category_advices/category_advices_cubit.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices/all_advices_view.dart';
import 'package:smile_simulation/features/advices/presentation/views/category_advices/all_categories_view.dart';
import 'package:smile_simulation/features/advices/presentation/views/category_advices/category_advices_view.dart';
import 'package:smile_simulation/features/auth/login/data/repos/login_repo/login_repo.dart';
import 'package:smile_simulation/features/auth/login/presentation/manage/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:smile_simulation/features/auth/login/presentation/manage/cubits/login_cubit/login_cubit.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';

import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_doctor_cubit/sign_up_doctor_cubit.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_user_cubit/sign_up_user_cubit.dart';

import 'package:smile_simulation/features/auth/sign_up/presentation/view/manage_sign_up.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/create_post_view.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/post_view.dart';
import 'package:smile_simulation/features/more/presentation/manage/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:smile_simulation/features/more/presentation/manage/cubits/delete_account_cubit/delete_account_cubit.dart';
import 'package:smile_simulation/features/user_account/presentation/views/user_account_view.dart';

import '../../features/advices/presentation/views/advices/advice_view.dart';
import '../../features/auth/login/data/repos/forget_repos/forget_password_repo.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../features/auth/login/presentation/view/forgot_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_doctor_subsidiary_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_doctor_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_user_view.dart';
import '../../features/medical_record/data/repos/health_status_repos/health_status_repo.dart';
import '../../features/medical_record/data/repos/personal_data_repos/personal_data_repo.dart';
import '../../features/medical_record/presentation/manage/cubits/update_health_status_cubit/update_health_status_cubit.dart';
import '../../features/medical_record/presentation/manage/cubits/update_personal_data_cubit/update_personal_data_cubit.dart';
import '../../features/medical_record/presentation/views/health_status_view.dart';
import '../../features/medical_record/presentation/views/medical_record_view.dart';
import '../../features/medical_record/presentation/views/personal_data_view.dart';
import '../../features/more/data/repos/change_password_repos/change_password_repo.dart';
import '../../features/more/data/repos/delete_account_repos/delete_account_repo.dart';
import '../../features/more/presentation/views/change_password_view.dart';
import '../../features/more/presentation/views/language_view.dart';
import '../../features/more/presentation/views/setting_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../features/user_account/data/repos/edit_profile_repos/edit_profile_repo.dart';
import '../../features/user_account/presentation/managers/edit_profile_cubit/edit_profile_cubit.dart';
import '../../features/user_account/presentation/views/edit_profile.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) => LoginCubit(loginRepo: getIt.get<LoginRepo>()),

              child: LoginView(),
            ),
      );

    case ManageSignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const ManageSignUpView());

    case SignUpFromUserView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      SignUpUserCubit(signUpRepo: getIt.get<SignUpRepo>()),
              child: SignUpFromUserView(),
            ),
      );

    case SignUpFromDoctorView.routeName:
      return MaterialPageRoute(builder: (_) => SignUpFromDoctorView());

    case SignUpFromDoctorSubsidiaryView.routeName:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      SignUpDoctorCubit(signUpRepo: getIt.get<SignUpRepo>()),
              child: SignUpFromDoctorSubsidiaryView(
                name: args['name'],
                email: args['email'],
                address: args['address'],
                password: args['password'],
                confirmPassword: args['confirmPassword'],
                gender: args['gender'],
                isCorrect: args['isCorrect'],
                cardImage: args['card'],
              ),
            ),
      );

    case AdviceView.routeName:
      {
        final Advice advice = settings.arguments as Advice;

        return MaterialPageRoute(builder: (_) => AdviceView(advice: advice));
      }
    case UserAccountView.routeName:
      {
        final bool currentUser = settings.arguments as bool;

        return MaterialPageRoute(
          builder:
              (_) => UserAccountView(
                currentUser: currentUser,
                userId: CacheHelper().getMap(key: 'userData')!['userId'],
                userName: CacheHelper().getMap(key: 'userData')!['fullName'],
                userImage: CacheHelper().getMap(key: 'userData')!['image'],
              ),
        );
      }
    case PostView.routeName:
      {
        final PostModel post = settings.arguments as PostModel;

        return MaterialPageRoute(builder: (_) => PostView(post: post));
      }
    case AllAdvicesView.routeName:
      {
        final List<Advice> advices = settings.arguments as List<Advice>;

        return MaterialPageRoute(
          builder: (_) => AllAdvicesView(advices: advices),
        );
      }
    case AllCategoriesView.routeName:
      {
        final List<AdvicesCategory> categories =
            settings.arguments as List<AdvicesCategory>;

        return MaterialPageRoute(
          builder: (_) => AllCategoriesView(categories: categories),
        );
      }
    case ForgetView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      ForgetPasswordCubit(getIt.get<ForgetPasswordRepo>()),
              child: ForgetView(),
            ),
      );
    case CategoryAdvicesView.routeName:
      {
        final category = settings.arguments as AdvicesCategory;

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => CategoryAdvicesCubit(
                      getIt.get<AdvicesCategoryRepo>(),
                      category: category,
                    ),
                child: const CategoryAdvicesView(),
              ),
        );
      }
    case PersonalDataView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              child: PersonalDataView(),
              create:
                  (context) => UpdatePersonalDataCubit(
                    personalDataRepo: getIt.get<PersonalDataRepo>(),
                  ),
            ),
      );
    case HealthStatusView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              child: HealthStatusView(),
              create:
                  (context) => UpdateHealthStatusCubit(
                    healthStatusRepo: getIt.get<HealthStatusRepo>(),
                  ),
            ),
      );
    case MedicalRecordView.routeName:
      return MaterialPageRoute(builder: (_) => const MedicalRecordView());

    case BottomNavigationView.routeName:
      return MaterialPageRoute(builder: (_) => const BottomNavigationView());
    case EditMedicalRecordView.routeName:
      return MaterialPageRoute(
        builder: (_) => EditMedicalRecordView(recordData: {}),
      );
    case CreatePostView.routName:
      return MaterialPageRoute(
        builder: (_) => EditMedicalRecordView(recordData: {}),
      );
    case AddMedicalRecordView.routeName:
      return MaterialPageRoute(builder: (_) => AddMedicalRecordView());

    case SettingView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              child: SettingView(),
              create:
                  (context) =>
                      DeleteAccountCubit(getIt.get<DeleteAccountRepo>()),
            ),
      );
    case LanguageView.routeName:
      return MaterialPageRoute(builder: (_) => LanguageView());
    case ChangePasswordView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              child: ChangePasswordView(),
              create:
                  (context) =>
                      ChangePasswordCubit(getIt.get<ChangePasswordRepo>()),
            ),
      );
    case AboutUsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return AboutUsView();
        },
      );
    case EditProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return BlocProvider(
            child: EditProfileView(),
            create:
                (context) => EditProfileCubit(
                  editProfileRepo: getIt.get<EditProfileRepo>(),
                ),
          );
        },
      );
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
