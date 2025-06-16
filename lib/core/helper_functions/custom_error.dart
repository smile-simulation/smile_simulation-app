import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../widgets/custom_button.dart';

Future<void> customError(
  BuildContext context, {
  required String massage,
}) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    title: S.of(context).error,
    desc: massage,
    btnOk: CustomButton(
      title: S.of(context).ok,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ).show();
}

Future<void> customSuccess(
  BuildContext context, {
  required String massage,
}) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    title: S.of(context).success,
    desc: massage,
    btnOk: CustomButton(
      title: S.of(context).ok,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ).show();
}

Future<void> customWarning(
  BuildContext context, {
  required String massage,
}) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.warning,
    title: S.of(context).warning,
    desc: massage,
    btnOk: CustomButton(
      isMinWidth: true,
      title: S.of(context).ok,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    btnCancel: CustomButton(
      isMinWidth: true,
      isSecondary: true,
      title: S.of(context).cancel,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ).show();
}

Future<void> comingSoon(BuildContext context) async {
  await AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.scale,
    title: S.of(context).comingSoon,
    desc: S.of(context).thisFeatureIsComingSoon,
    btnOkOnPress: () {},
  ).show();
}

