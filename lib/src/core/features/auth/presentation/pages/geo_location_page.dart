import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingGeoLocationPage extends StatefulWidget {
  const OnboardingGeoLocationPage({super.key});

  @override
  State<OnboardingGeoLocationPage> createState() =>
      _OnboardingGeoLocationPageState();
}

class _OnboardingGeoLocationPageState extends State<OnboardingGeoLocationPage>
    with WidgetsBindingObserver {
  final AuthCubit cubit = AuthInjection.sl<AuthCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (AppLifecycleState.paused == state) {
      cubit.clearGeoLocation();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const UiAppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (state.geoLocationEnabled == false)
                  Text(
                    SignInI18n.geoLocationDisabled,
                    textAlign: TextAlign.center,
                    style: context.text.smallTitle,
                  ),
                Expanded(
                  child: UiImage(
                    Assets.images.map,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(Insets.l),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: Insets.l),
                              child: Text(
                                (state.geoLocationEnabled == false)
                                    ? SignInI18n.geoLocationDisabledTitle
                                    : SignInI18n.enableGeoLocationTitle,
                                textAlign: TextAlign.center,
                                style: context.text.bigTitle,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                (state.geoLocationEnabled == false)
                                    ? SignInI18n.geoLocationDisabledDescription
                                    : SignInI18n.enableGeoLocationDescription,
                                textAlign: TextAlign.center,
                                style: context.text.mainText.copyWith(
                                  color: context.color.smallTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.geoLocationEnabled == false)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Insets.l,
                      Insets.l,
                      Insets.l,
                      Insets.zero,
                    ),
                    child: UiButton.outline(
                      disabled: state.status.isFetchingInProgress,
                      text: SignInI18n.enableGeoLocationBtn,
                      padding: EdgeInsets.zero,
                      onPressed:
                          context.read<AuthCubit>().onPressedEnableGeoLocation,
                      suffixIcon: UiIcon(Assets.icons.iTurnOn),
                    ),
                  ),
                if (state.geoLocationEnabled == null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Insets.l,
                      Insets.l,
                      Insets.l,
                      Insets.l,
                    ),
                    child: UiMainButton(
                      disabled: state.status.isFetchingInProgress,
                      text: SignInI18n.enableGeoLocationBtn,
                      onPressed: context.read<AuthCubit>().onPressedGeoLocation,
                    ),
                  ),
                if (state.geoLocationEnabled == false)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Insets.l,
                      Insets.l,
                      Insets.l,
                      Insets.l,
                    ),
                    child: UiButton(
                      text: SignInI18n.selectCity,
                      onPressed: context.read<AuthCubit>().onPressedSelectCity,
                      suffixIcon: UiIcon(
                        Assets.icons.iMapStroke,
                        color: context.color.fillBgColor,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
