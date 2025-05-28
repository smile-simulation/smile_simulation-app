import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../../../generated/l10n.dart';

class CustomPoliciesAndConditionsDialog extends StatelessWidget {
  final double radius;
  final String title;
  final String path;
  const CustomPoliciesAndConditionsDialog({
    this.radius = 8,
    super.key,
    required this.title,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,


          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.headline2(context).copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal:  8.0),
                  child: FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context).loadString(path),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError || !snapshot.hasData) {
                          log('Error loading file: ${snapshot.error}');
                          return const Center(
                            child: Text('Error loading policy'),
                          );
                        }

                        return MarkdownWidget(
                          padding: EdgeInsets.all(8),
                          data: snapshot.data!,
                          shrinkWrap: true,
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    S.of(context).close,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
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
