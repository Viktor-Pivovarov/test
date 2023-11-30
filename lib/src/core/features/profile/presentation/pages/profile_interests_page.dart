import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ProfileInterestsPage extends StatelessWidget {
  const ProfileInterestsPage({super.key});

  ProfileCubit get _cubit => ProfileInjection.sl();

  @override
  Widget build(BuildContext context) {
    final String currentRoute = context.router.currentSegments.last.name;

    return BlocConsumer<ProfileCubit, ProfileState>(
      bloc: _cubit,
      listenWhen: (previous, current) =>
          previous.status.isFetchingInProgress &&
          current.status.isFetchingSuccess,
      listener: (context, state) {
        final String? nextRoute = state.getNextFillPage(currentRoute);

        if (nextRoute == null) {
          context.router.pop();
        } else {
          context.router.replaceNamed(nextRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: UiAppBar(
            backgroundColor: Colors.white,
            title: Text(ProfileI18n.interests),
            useColor: true,
            actions: [
              UiButton.action(
                text: CoreI18n.save,
                disabled: state.status.isFetchingInProgress,
                onPressed: () {
                  _cubit.onPressedSaveInterest(state.profile.interests);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(Insets.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Insets.s),
                      child: Text(
                        ProfileI18n.selectInterests,
                        style: context.text.smallTitle
                            .copyWith(color: context.color.smallTextColor),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: state.profile.interests.length.toString(),
                            style: context.text.mainText.copyWith(
                              color: context.color.mainAccentColor,
                              height: 28 / 24,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '/${_cubit.maxInterests}',
                            style: context.text.mainText.copyWith(
                              color: context.color.textColor,
                              height: 24 / 16,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ...state.interests.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Insets.l,
                          bottom: Insets.s,
                        ),
                        child: Text(e.node.name, style: context.text.mainText),
                      ),
                      Wrap(
                        spacing: Insets.s,
                        children: [
                          ...e.items.map((e) {
                            final bool isSelected =
                                state.profile.interests.contains(e.node);

                            return GestureDetector(
                              onTap: () => _cubit.onPressedInterest(e.node),
                              child: Chip(
                                visualDensity: VisualDensity.compact,
                                side: BorderSide(
                                  color: isSelected
                                      ? Colors.transparent
                                      : context.color.smallTextColor,
                                ),
                                backgroundColor: isSelected
                                    ? context.color.mainAccentColor
                                    : Colors.transparent,
                                padding: const EdgeInsets.all(Insets.s),
                                label: Text(
                                  e.node.name,
                                  style: context.text.mainTextMedium.copyWith(
                                    color: isSelected
                                        ? context.color.fillBgColor
                                        : context.color.smallTextColor,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
