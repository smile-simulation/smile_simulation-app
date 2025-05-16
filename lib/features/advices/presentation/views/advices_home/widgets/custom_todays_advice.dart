import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/my_launch_url.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/presentation/views/widgets_skeletons/todays_advice_skeleton.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../advices/advice_view.dart';

class CustomTodaysAdvice extends StatefulWidget {
  const CustomTodaysAdvice({super.key, required this.advice});

  final Advice advice;

  @override
  State<CustomTodaysAdvice> createState() => _CustomTodaysAdviceState();
}

class _CustomTodaysAdviceState extends State<CustomTodaysAdvice> {
  bool isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isImageLoaded ? AppColors.whiteColor : AppColors.transparent,
      shadowColor: isImageLoaded ? AppColors.whiteColor : AppColors.transparent,
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AdviceView.routeName,
            arguments: widget.advice,
          );
        },
        child: Container(
          padding: EdgeInsets.all(0),
          width: double.infinity,
          height: 150,
          // ✅ حدد ارتفاع صريح
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.25,
                child: CachedNetworkImage(
                  imageUrl: widget.advice.image!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => const SizedBox.shrink(),
                  imageBuilder: (context, imageProvider) {
                    // ✅ أضمن إن setState يحصل بعد build
                    if (!isImageLoaded) {
                      Future.microtask(() {
                        if (mounted) {
                          setState(() {
                            isImageLoaded = true;
                          });
                        }
                      });
                    }

                    return Image(image: imageProvider, fit: BoxFit.fill);
                  },
                  errorWidget: (_, __, ___) {
                    // ✅ برضه نعتبر الصورة "محملة" في حالة الخطأ علشان نعرض المحتوى
                    if (!isImageLoaded) {
                      Future.microtask(() {
                        if (mounted) {
                          setState(() {
                            isImageLoaded = true;
                          });
                        }
                      });
                    }
                    return Image.asset(
                      Assets.imagesAdviceBackground,
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              // ✅ Main content
              Visibility(
                visible: isImageLoaded,
                replacement: TodaysAdviceSkeleton(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.advice.title ??
                                S.of(context).adviceTitleError,
                            style: AppTextStyles.subTitle2(
                              context,
                            ).copyWith(color: AppColors.blackColor),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.advice.description ??
                                S.of(context).adviceContentError,
                            style: AppTextStyles.listItem(context),
                            maxLines: widget.advice.link == null ? 5 : 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      Visibility(
                        visible: widget.advice.link != null,
                        child: InkWell(
                          onTap: () => myLaunchUrl(url: widget.advice.link),
                          child: Text(
                            "🔗 فيديو نصائح العناية اليومية بالأسنان",
                            style: AppTextStyles.formLabel(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
