import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ProfileEditBirthTimePage extends StatefulWidget {
  const ProfileEditBirthTimePage({super.key});

  @override
  State<ProfileEditBirthTimePage> createState() =>
      _ProfileEditBirthTimePageState();
}

class _ProfileEditBirthTimePageState extends State<ProfileEditBirthTimePage> {
  late int hours;
  late int minutes;

  ProfileCubit get _cubit => ProfileInjection.sl();

  @override
  void initState() {
    super.initState();

    hours = int.tryParse(
          _cubit.state.user.vedic.birthtimeFormat?.split(':').first ?? '0',
        ) ??
        0;
    minutes = int.tryParse(
          _cubit.state.user.vedic.birthtimeFormat?.split(':').last ?? '0',
        ) ??
        0;
  }

  void _onPressedSave() {
    _cubit.onPressedSaveBirthTime(
      DateFormat.Hm().format(DateTime(1, 1, 1, hours, minutes)),
    );
  }

  void _onChanged(String value) {
    setState(() {
      hours = int.parse(value.split(':').first);
      minutes = int.parse(value.split(':').last);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      bloc: _cubit,
      listenWhen: (previous, current) =>
          previous.status.isFetchingInProgress &&
          current.status.isFetchingSuccess,
      listener: (context, state) {
        context.router.pop();
      },
      builder: (context, state) {
        return Scaffold(
          appBar: UiAppBar(
            useColor: true,
            useShadow: true,
            title: Text(ProfileI18n.editProfileBirthTime),
          ),
          body: Padding(
            padding: const EdgeInsets.all(Insets.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.l),
                  child: Text(
                    ProfileI18n.birthTimeDescription,
                    style: context.text.smallTitle,
                  ),
                ),
                UiTimePicker(
                  hours: hours,
                  minutes: minutes,
                  onChange: _onChanged,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Insets.l),
                  child: Text(
                    ProfileI18n.editDescription,
                    style: context.text.mainText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: UiBottomSheet(
            child: UiButton(
              text: CoreI18n.save,
              onPressed: _onPressedSave,
            ),
          ),
        );
      },
    );
  }
}
