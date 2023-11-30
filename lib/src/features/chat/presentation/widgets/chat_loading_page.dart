import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ChatLoadingPage extends StatelessWidget {
  const ChatLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: Insets.s),
          child: Text(ChatI18n.newPairs),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.xl),
            child: SizedBox(
              height: 159,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: Insets.s),
                    child: SizedBox(
                      width: 104,
                      height: 159,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(Insets.xs),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: Insets.s),
                    child: SizedBox(
                      width: 104,
                      height: 159,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(Insets.xs),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: Insets.s),
                    child: SizedBox(
                      width: 104,
                      height: 159,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(Insets.xs),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: Insets.s),
                    child: SizedBox(
                      width: 104,
                      height: 159,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(Insets.xs),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.color.fillBgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Insets.l),
                  topRight: Radius.circular(Insets.l),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.only(left: Insets.l, top: Insets.s),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Insets.zero,
                      Insets.s,
                      Insets.l,
                      Insets.l,
                    ),
                    child: Text(ChatI18n.chats, style: context.text.mainTitle),
                  ),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                  const _ChatRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatRow extends StatelessWidget {
  const _ChatRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Insets.s),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: 64,
              height: 64,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Insets.s,
                  bottom: Insets.m,
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    randomWidth: true,
                    height: 27,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.l),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    randomWidth: true,
                    height: 11,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: context.color.greyLight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
