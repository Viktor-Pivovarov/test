import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiProfileAppBarCard extends StatelessWidget {
  const UiProfileAppBarCard({
    this.size = 40.0,
    this.isOnline = false,
    this.showStatus = false,
    this.name,
    this.content,
    this.photo,
    this.status,
    super.key,
  });

  final double size;
  final bool isOnline;
  final Widget? name;
  final Widget? content;
  final bool showStatus;
  final String? photo;
  final String? status;

  @override
  Widget build(BuildContext context) {
    final ThemeColors color = Theme.of(context).extension<ThemeColors>()!;
    final TextExtension text = Theme.of(context).extension<TextExtension>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: <Widget>[
              if (photo == null)
                UiImage(
                  Assets.media.avatarJOJO,
                  width: size,
                  height: size,
                ),
              if (photo != null)
                CacheImage(
                  url: photo,
                  width: size,
                  height: size,
                  radius: 100,
                ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.green,
                      border: Border.all(
                        width: 2,
                        color: color.fillBgColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (content != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (name != null) name! else const SizedBox(),
                  if (showStatus)
                    Text(
                      showStatus ? status ?? 'Online' : '',
                      style: context.texts.caption.caption.copyWith(
                        color: isOnline
                            ? context.colors.text.green
                            : context.colors.text.secondary,
                      ),
                    ),
                  if (content != null)
                    Padding(
                      padding: const EdgeInsets.only(top: Insets.xs),
                      child: content,
                    ),
                ],
              ),
            ),
          ),
        if (content == null)
          Padding(
            padding: const EdgeInsets.only(left: Insets.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (name != null) name! else const SizedBox(),
                Text(
                  showStatus ? status ?? 'Online' : '',
                  style: text.smallText.copyWith(
                    color: isOnline ? color.green : color.smallTextColor,
                  ),
                ),
                if (content != null)
                  Padding(
                    padding: const EdgeInsets.only(top: Insets.xs),
                    child: content,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
