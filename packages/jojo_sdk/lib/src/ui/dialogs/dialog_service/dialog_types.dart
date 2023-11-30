import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class DialogTypes {
  static CongratulationsDialog congratulations({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      CongratulationsDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static AccountDeletedDialog accountDeleted({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      AccountDeletedDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static BalanceDialog balance({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      BalanceDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static BlacklistDialog blacklist({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      BlacklistDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static BonusDialog bonus({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      BonusDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static FreeDateDialog freeDate({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      FreeDateDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static ModerationDialog moderation({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      ModerationDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static OneButtonDialog oneButtonDialog({
    required Widget image,
    required Widget title,
    required Widget description,
    required UiButton button,
    Key? key,
  }) =>
      OneButtonDialog(
        image: image,
        title: title,
        description: description,
        button: button,
        key: key,
      );

  static ProfileDialog profile({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      ProfileDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static RequestAcceptedDialog requestAccepted({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      RequestAcceptedDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static SupportingDialog supporting({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      SupportingDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static TariffDialog tariff({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      TariffDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static UpdateDialog update({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      UpdateDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static UserUnlockedDialog userUnlocked({
    String? title,
    String? description,
    String? btnTitle,
    Key? key,
  }) =>
      UserUnlockedDialog(
        title: title,
        description: description,
        btnTitle: btnTitle,
        key: key,
      );

  static ViolationRulesDialog violationRules({
    String? btnTitle,
    VoidCallback? onTapRules,
    VoidCallback? onTapSupport,
    Key? key,
  }) =>
      ViolationRulesDialog(
        onTapRules: onTapRules,
        onTapSupport: onTapSupport,
        btnTitle: btnTitle,
        key: key,
      );

  static TwoButtonDialog twoButtonDialog({
    required Widget title,
    required Widget description,
    required UiButton leftButton,
    required UiButton rightButton,
    Widget? image,
    Key? key,
  }) =>
      TwoButtonDialog(
        image: image,
        title: title,
        description: description,
        leftButton: leftButton,
        rightButton: rightButton,
        key: key,
      );

  static LogoutDialog logout({
    String? title,
    String? description,
    String? btnOkTitle,
    String? btnCancelTitle,
    Key? key,
  }) =>
      LogoutDialog(
        title: title,
        description: description,
        btnOkTitle: btnOkTitle,
        btnCancelTitle: btnCancelTitle,
        key: key,
      );

  static PhotoDialog photo({
    final List<String> photos = const [],
    final int selected = 0,
    Key? key,
  }) =>
      PhotoDialog(
        photos: photos,
        selected: selected,
        key: key,
      );
}
