import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _iconSize = Size(20, 20);

class UiProfileCard extends StatelessWidget {
  const UiProfileCard({
    required this.items,
    this.label = '',
    this.useShadow = true,
    this.showAdditionalLabel = true,
    this.hasError = false,
    super.key,
  });

  final String label;

  final List<ProfileCardItem> items;

  final bool useShadow;

  final bool showAdditionalLabel;

  final bool hasError;

  EdgeInsetsGeometry get _margin => const EdgeInsets.only(bottom: Insets.l);

  EdgeInsetsGeometry get _padding =>
      const EdgeInsets.symmetric(horizontal: Insets.xl, vertical: Insets.m);

  BorderRadius get _borderRadius => BorderRadius.circular(Insets.l);

  int get errors => items.where((element) => !element.valid).length;

  int get current => items.length - errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: useShadow
            ? <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).cardTheme.shadowColor ??
                      const Color.fromRGBO(115, 145, 166, 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : <BoxShadow>[],
        borderRadius: _borderRadius,
      ),
      margin: _margin,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.l),
        ),
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          splashColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          highlightColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          borderRadius: _borderRadius,
          child: Padding(
            padding: _padding,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: Insets.s),
                            child: Text(
                              label,
                              style: context.text.mainTitle,
                            ),
                          ),
                          if (hasError && showAdditionalLabel)
                            const AttentionIcon(
                              padding: EdgeInsets.only(
                                left: Insets.s,
                                top: Insets.xs,
                              ),
                              useBorder: false,
                              size: 15,
                            ),
                          if (!hasError && showAdditionalLabel)
                            UiIcon(
                              Assets.icons.iEdit,
                              color: Theme.of(context).primaryColor,
                            ),
                        ],
                      ),
                    ),
                    if (showAdditionalLabel)
                      ProfileCardStatus(
                        current: current,
                        all: items.length,
                      ),
                  ],
                ),
                const SizedBox(
                  height: Insets.s,
                ),
                for (int i = 0; i < items.length; i++)
                  ProfileCardListTile(
                    item: items[i],
                    last: i == items.length - 1,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCardListTile extends StatelessWidget {
  const ProfileCardListTile({required this.item, this.last = false, super.key});

  final ProfileCardItem item;

  final bool last;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          highlightColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          onTap: item.onPressed,
          child: Row(
            children: [
              UiIcon(
                item.iconAsset ?? Assets.icons.ruler1,
                width: _iconSize.width,
                height: _iconSize.height,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: context.text.smallTitle,
                      ),
                      Text(
                        item.description,
                        overflow: TextOverflow.ellipsis,
                        style: item.valid
                            ? context.text.mainText
                                .copyWith(color: context.color.smallTextColor)
                            : context.text.mainText
                                .copyWith(color: context.color.mainAccentColor),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!item.valid)
                    Padding(
                      padding: const EdgeInsets.only(right: Insets.s),
                      child: Container(
                        padding: const EdgeInsets.all(Insets.xs),
                        decoration: BoxDecoration(
                          color: context.color.mainAccentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (item.onPressed != null)
                    CrossPlatformSvg.asset(
                      Assets.icons.iChevronRight,
                      color: context.color.smallTextColor,
                    ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: !last,
          child: const Divider(),
        ),
      ],
    );
  }
}

class ProfileCardStatus extends StatelessWidget {
  const ProfileCardStatus({
    required this.current,
    required this.all,
    super.key,
  });

  final int current;
  final int all;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          current.toString(),
          style: current == all
              ? context.text.mainText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: context.color.textColor,
                )
              : context.text.mainText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: context.color.mainAccentColor,
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Insets.xs),
          child: Text(
            '/$all',
            style: context.text.mainText.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: context.color.textColor,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileCardItem {
  ProfileCardItem({
    this.title = '',
    this.description = '',
    this.iconAsset,
    this.onPressed,
    this.valid = true,
  });

  final String title;
  final String description;
  final String? iconAsset;

  final VoidCallback? onPressed;

  final bool valid;
}

class AttentionCounter extends StatelessWidget {
  const AttentionCounter({
    super.key,
    this.useBorder = true,
    this.size = 23.0,
    this.padding,
    this.count = 0,
  });

  final bool useBorder;

  final double size;

  final int count;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count != 0,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              border:
                  useBorder ? Border.all(color: Colors.white, width: 2) : null,
              borderRadius: BorderRadius.circular(15),
              color: context.color.mainAccentColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: Text(
                  count.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
