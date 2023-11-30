import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UiAppBar({
    super.key,
    this.toolbarHeight = 56.0,
    this.title,
    this.actions = const <Widget>[],
    this.leading,
    this.elevation = 0,
    this.centerTitle = false,
    this.useColor = false,
    this.useShadow = false,
    this.backgroundColor,
    this.bottom,
    this.shape,
  });

  final bool centerTitle;
  final double toolbarHeight;
  final double? elevation;
  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;
  final bool useColor;
  final bool useShadow;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? newLeading = leading;

    if (canPop) {
      newLeading = useCloseButton
          ? const CloseButton() // TODO: Переделать иконку
          : Column(
              children: [
                const Expanded(child: SizedBox.shrink()),
                IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.only(bottom: Insets.s),
                  onPressed: () => Navigator.maybePop(context),
                  visualDensity: VisualDensity.comfortable,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ],
            );

      // if (useCloseButton) {
      //   _actions = <Widget>[..._actions, const CloseButton()];
      // }
    }

    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: useColor
                  ? (backgroundColor ?? Colors.white)
                  : Colors.transparent,
              titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            ),
      ),
      child: useShadow
          ? UIShadow(child: _buildAppBar(context, newLeading))
          : _buildAppBar(context, newLeading),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    Widget? newLeading,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: newLeading,
      title: Padding(
        padding:
            EdgeInsets.only(left: newLeading != null ? Insets.zero : Insets.l),
        child: title,
      ),
      actions: actions.map((Widget e) {
        final bool isLast = actions.last == e;

        return Padding(
          padding: EdgeInsets.only(
            right: isLast ? Insets.m : Insets.s,
          ),
          child: e,
        );
      }).toList(),
      centerTitle: centerTitle,
      elevation: elevation,
      shape: shape,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //   bottomLeft: Radius.circular(BorderRadiusInsets.l),
          //   bottomRight: Radius.circular(BorderRadiusInsets.l),
          // ),
          color: useColor
              ? backgroundColor ?? Colors.white
              : Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
