import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/_features.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage<GeoLocationModel>()
class GeoLocationPage extends StatelessWidget {
  const GeoLocationPage({
    super.key,
    @QueryParam('title') this.title,
    @QueryParam('need-help') this.needHelp,
  });

  final String? title;
  final String? needHelp;

  bool get showHelp => needHelp == 'true';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeoLocationCubit>(
      create: (context) => GeoLocationInjection.sl<GeoLocationCubit>(),
      child: BlocBuilder<GeoLocationCubit, GeoLocationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: UiAppBar(
              title: Text(title ?? GeoLocationI18n.title),
              useColor: true,
              actions: [
                if (showHelp)
                  UiButton.action(
                    text: SignUpI18n.helpBtn,
                    textStyle: context.text.mainTextMedium
                        .copyWith(color: context.color.mainAccentColor),
                    padding: const EdgeInsets.only(top: Insets.xs),
                    onPressed: () {
                      context.router.push(const SupportingRoute());
                    },
                  ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(Insets.l),
              child: Column(
                children: [
                  UiTextField(
                    autofocus: true,
                    formControl: context.read<GeoLocationCubit>().formControl,
                    hintText: GeoLocationI18n.findCity,
                    // TODO(pavlov): иконка не с макета, т.к. её раздувает, на обсуждение!
                    suffixIcon: state.status.isFetchingInProgress
                        ? const CupertinoActivityIndicator()
                        : Icon(
                            Icons.search,
                            color: context.color.smallTextColor,
                          ),
                  ),
                  if (state.geoLocation.items.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.geoLocation.items.length,
                        itemBuilder: (context, index) {
                          final item = state.geoLocation.items.elementAt(index);

                          return UiRadioField<String>(
                            label: item.name,
                            value: item.name,
                            formControl: context
                                .read<GeoLocationCubit>()
                                .selectedFormControl,
                            onChanged: (value) {
                              context
                                  .read<GeoLocationCubit>()
                                  .onChangeGeo(value);
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            bottomNavigationBar: UiBottomSheet(
              child: UiButton(
                disabled: state.selectLocation == null,
                text: CoreI18n.iConfirm,
                onPressed: context.read<GeoLocationCubit>().selectCity,
                suffixIcon: UiIcon(Assets.icons.iCheck),
              ),
            ),
          );
        },
      ),
    );
  }
}
