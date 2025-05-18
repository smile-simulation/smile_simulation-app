import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';

import '../../../../data/models/post_model.dart';
import '../../../../data/repos/comments_repo/comments_repo_impl.dart';
import '../../../cubits/comments_cubit/comments_cubit.dart';
import 'custom_buttom_model_sheet_body.dart';

class CustomCommentsBottomSheet extends StatelessWidget {
  const CustomCommentsBottomSheet({
    super.key,
    required this.post,
    required this.markEdited,
  });
  final PostModel post;
  final Function() markEdited;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CommentsCubit(
            relatedPost: post,
            commentsRepo: CommentsRepoImpl(
              dioConsumer: DioConsumer(dio: Dio()),
            ),
          ),
      child: CustomButtomModelSheetBody(markEdited: markEdited),
    );
  }
}
