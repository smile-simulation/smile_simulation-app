import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/home_view_body.dart';

import '../cubits/posts_cubit/posts_cubit.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostsCubit(
            PostsRepoImplement(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child: HomeViewBody(),
    );
  }
}
