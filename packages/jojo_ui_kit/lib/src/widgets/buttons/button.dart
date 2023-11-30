import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

enum _ButtonType {
  primary,
  outline,
  text,
  tg,
  google,
  dialog,
  apple,
  action;

  bool get isPrimary => this == primary;

  bool get isOutline => this == outline;

  bool get isText => this == text;

  bool get isTg => this == tg;

  bool get isGoogle => this == google;

  bool get isApple => this == apple;

  bool get isDialog => this == dialog;

  bool get isAction => this == action;
}

@Deprecated('Use UiMainButton or UiIconedButton!')
class UiButton extends StatelessWidget {
  const UiButton({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.primary;

  const UiButton.outline({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.outline;

  const UiButton.text({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.text;

  const UiButton.tg({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.tg;

  const UiButton.google({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.google;

  const UiButton.apple({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.apple;

  const UiButton.dialog({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.dialog;

  const UiButton.action({
    required this.text,
    this.onPressed,
    this.suffixIcon,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.disabled = false,
    this.fullWidth = false,
    this.padding,
    this.textStyle,
    this.primaryColor,
  }) : _type = _ButtonType.action;

  final String text;
  final VoidCallback? onPressed;
  final Widget? suffixIcon;
  final MainAxisAlignment mainAxisAlignment;
  final bool disabled;
  final EdgeInsetsGeometry? padding;
  final bool fullWidth;
  final TextStyle? textStyle;

  final Color? primaryColor;

  final _ButtonType _type;

  @override
  Widget build(BuildContext context) {
    final ThemeColors color = Theme.of(context).extension<ThemeColors>()!;
    final TextExtension textExtension =
        Theme.of(context).extension<TextExtension>()!;
    EdgeInsetsGeometry localPadding =
        padding ?? const EdgeInsets.only(bottom: Insets.l);

    if (_type.isAction) {
      localPadding = padding ?? EdgeInsets.zero;
    }

    return Padding(
      padding: localPadding,
      child: SizedBox(
        width: fullWidth ? double.infinity : null,
        child: Builder(
          builder: (BuildContext context) {
            if (_type.isOutline) {
              return OutlinedButton(
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: <Widget>[
                    if (suffixIcon != null)
                      Expanded(
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      )
                    else
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (suffixIcon != null)
                      Theme(
                        data: ThemeData(
                          iconTheme: Theme.of(context).iconTheme.copyWith(
                                color: primaryColor ?? color.mainAccentColor,
                              ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: Insets.s),
                          child: suffixIcon,
                        ),
                      ),
                  ],
                ),
              );
            }

            if (_type.isAction) {
              return UiButton.text(
                text: text,
                fullWidth: false,
                padding: EdgeInsets.zero,
                textStyle: textStyle ??
                    textExtension.mainTextMedium.copyWith(
                      color: primaryColor ?? context.color.mainAccentColor,
                    ),
                disabled: disabled,
                onPressed: onPressed,
              );
            }

            if (_type.isTg) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.tgColor,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                ),
                onPressed: disabled ? null : onPressed,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: Insets.l),
                      child: UiIcon(Assets.icons.iTg, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle ?? textExtension.smallTitle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: Insets.l),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (_type.isApple) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.appleColor,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                ),
                onPressed: disabled ? null : onPressed,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: Insets.l),
                      child: UiIcon(Assets.icons.iApple, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle ?? textExtension.smallTitle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: Insets.l),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (_type.isGoogle) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.googleColor,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                ),
                onPressed: disabled ? null : onPressed,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: color.fillBgColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(Insets.s),
                      margin: const EdgeInsets.fromLTRB(
                        Insets.xs,
                        Insets.xs,
                        Insets.l,
                        Insets.xs,
                      ),
                      child: UiIcon(
                        Assets.icons.iGoogle,
                        useColor: false,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: textStyle ?? textExtension.smallTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (_type.isText) {
              return Center(
                child: GestureDetector(
                  onTap: disabled ? null : onPressed,
                  child: Padding(
                    padding: localPadding,
                    child: DefaultTextStyle(
                      style: textStyle ??
                          textExtension.smallTitle.copyWith(
                            color: disabled
                                ? color.disabledColor
                                : color.mainAccentColor,
                          ),
                      child: Text(
                        text,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              );
            }

            if (_type.isDialog) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  fixedSize: const Size(double.infinity, 48),
                ),
                onPressed: disabled ? null : onPressed,
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: <Widget>[
                    if (suffixIcon != null)
                      Expanded(
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    else
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (suffixIcon != null)
                      Theme(
                        data: ThemeData(
                          iconTheme: Theme.of(context).iconTheme.copyWith(
                                color: color.btnIconColor,
                              ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: Insets.s),
                          child: suffixIcon,
                        ),
                      ),
                  ],
                ),
              );
            }

            return UIShadow.button(
              boxShadow: (disabled || onPressed == null)
                  ? []
                  : <BoxShadow>[
                      BoxShadow(
                        color: primaryColor?.withOpacity(0.3) ??
                            ThemeConfig.mainAccentShadowColor,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
              child: ElevatedButton(
                onPressed: disabled ? null : onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: <Widget>[
                    if (suffixIcon != null)
                      Expanded(
                        child: Text(
                          text,
                          textAlign: TextAlign.left,
                          style: textStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    else
                      Text(
                        text,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (suffixIcon != null)
                      Theme(
                        data: ThemeData(
                          iconTheme: Theme.of(context).iconTheme.copyWith(
                                color: color.btnIconColor,
                              ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: Insets.s),
                          child: suffixIcon,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
