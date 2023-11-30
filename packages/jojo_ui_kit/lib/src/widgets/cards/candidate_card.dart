import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({
    required this.avatar,
    required this.age,
    required this.name,
    required this.type,
    this.status = '',
    this.score = 0,
    this.onPressed,
    super.key,
  });

  final ImageProvider avatar;
  final String age;
  final String name;
  final String status;

  final int score;
  final CandidateCardType type;

  final void Function()? onPressed;

  static const double _avatarRadius = 36;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      padding: const EdgeInsets.only(left: Insets.l),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Insets.m),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundImage: avatar,
              radius: _avatarRadius,
            ),
          ),
          const SizedBox(
            width: Insets.m,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: Insets.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    age,
                    style: context.text.smallText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.color.smallTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.mainTitle.copyWith(
                            height: 32 / 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Insets.xs,
                          left: Insets.xs,
                        ),
                        child: UiIcon(
                          Assets.icons.iParkSolidProtect,
                          width: Insets.l,
                          height: Insets.l,
                          useColor: false,
                        ),
                      ),
                    ],
                  ),
                  type.getStatus(context, status),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: Opacity(
                  opacity: 0.5,
                  child: UiImage(
                    Assets.images.mandala,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        score.toString(),
                        style: context.text.mainText.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 20 / 24,
                          fontSize: 24,
                          color:
                              context.color.calculateScoreColor(score, context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: Insets.xs,
                          right: Insets.s,
                        ),
                        child: Text(
                          '/36',
                          style: context.text.mainText.copyWith(
                            fontWeight: FontWeight.w300,
                            height: 24 / 14,
                            fontSize: 12,
                            color: context.color.smallTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color calculateScoreColor(BuildContext context) {
    if (score < 18) {
      return context.color.mainAccentColor;
    }
    if (score >= 18 && score <= 24) {
      return context.color.smallTextColor;
    }

    return context.color.green;
  }
}

enum CandidateCardType {
  mutual,
  waiting,
  liked;

  Color getColor(BuildContext context) {
    switch (this) {
      case CandidateCardType.mutual:
        return context.color.mainAccentColor;
      case CandidateCardType.waiting:
        return context.color.smallTextColor;
      case CandidateCardType.liked:
        return context.color.green;
    }
  }

  UiIcon getIcon(BuildContext context) {
    switch (this) {
      case CandidateCardType.mutual:
        return UiIcon(
          Assets.icons.iHeartFilled,
          width: 10,
          height: 10,
          color: getColor(context),
        );
      case CandidateCardType.waiting:
        return UiIcon(
          Assets.icons.loading,
          color: getColor(context),
        );
      case CandidateCardType.liked:
        return UiIcon(
          Assets.icons.iHeart,
          width: 10,
          height: 10,
          color: getColor(context),
        );
    }
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (this) {
      case CandidateCardType.mutual:
        return context.text.ultraSmallText
            .copyWith(color: context.color.mainAccentColor);
      case CandidateCardType.waiting:
        return context.text.ultraSmallText
            .copyWith(color: context.color.smallTextColor);
      case CandidateCardType.liked:
        return context.text.ultraSmallText.copyWith(color: context.color.green);
    }
  }

  Widget getStatus(BuildContext context, String status) {
    switch (this) {
      case CandidateCardType.mutual:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.xxs),
              child: getIcon(context),
            ),
            const SizedBox(
              width: Insets.xs,
            ),
            Text(
              status,
              style: getTextStyle(context),
            ),
          ],
        );
      case CandidateCardType.waiting:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Insets.xxs),
              child: getIcon(context),
            ),
            const SizedBox(
              width: Insets.xs,
            ),
            Text(
              status,
              style: getTextStyle(context),
            ),
          ],
        );
      case CandidateCardType.liked:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.xxs),
              child: getIcon(context),
            ),
            const SizedBox(
              width: Insets.xs,
            ),
            Text(
              status,
              style: getTextStyle(context),
            ),
          ],
        );
    }
  }
}
