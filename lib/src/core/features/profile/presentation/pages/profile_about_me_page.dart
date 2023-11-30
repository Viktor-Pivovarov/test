import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ProfileAboutMePage extends StatefulWidget {
  const ProfileAboutMePage({super.key});

  @override
  State<ProfileAboutMePage> createState() => _ProfileAboutMePageState();
}

class _ProfileAboutMePageState extends State<ProfileAboutMePage> {
  late FormControl<String> _control;

  Color appBarColor = Colors.white;

  ProfileCubit get _cubit => ProfileInjection.sl();

  @override
  void initState() {
    super.initState();

    _control = FormControl<String>(value: _cubit.state.profile.formattedBio);
  }

  Future<void> _onSave(String defaultValue) {
    return _cubit.onPressedSaveAboutMe(_control.value ?? defaultValue);
  }

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
            backgroundColor: appBarColor,
            title: Text(ProfileI18n.aboutMeCardTitle),
            useColor: true,
            actions: [
              UiButton.action(
                text: CoreI18n.save,
                disabled: state.status.isFetchingInProgress,
                onPressed: () {
                  _onSave(state.profile.formattedBio);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: UiTextAreaField(
              formControl: _control,
              useShadow: false,
              fillColor: Colors.transparent,
              hintText: ProfileI18n.bioHint,
              hintMaxLines: 4,
              hintStyle: context.text.mainTitle
                  .copyWith(color: context.color.smallTextColor),
              keyboardType: TextInputType.multiline,
              autofocus: true,
              textInputAction: TextInputAction.go,
              maxLength: 500,
              style: context.text.smallText,
            ),
          ),
        );
      },
    );
  }
}
