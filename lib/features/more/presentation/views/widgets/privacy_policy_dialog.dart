import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

class PolicyPoliciesDialog extends StatelessWidget {
  final double radius;
  final String title;
  final String path;
  const PolicyPoliciesDialog({
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.headline2(
                context,
              ).copyWith(decoration: TextDecoration.underline),
            ),
            Expanded(
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context).loadString(path),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      log('Error loading file: ${snapshot.error}');
                      return const Center(child: Text('Error loading policy'));
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
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Theme.of(context).colorScheme.primary,
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
                  "CLOSE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
