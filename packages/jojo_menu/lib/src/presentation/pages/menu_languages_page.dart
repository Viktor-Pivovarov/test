import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuLanguagesPage extends StatelessWidget {
  const MenuLanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final supportedLocales = context
            .findAncestorWidgetOfExactType<MaterialApp>()
            ?.supportedLocales as List<Locale>? ??
        <Locale>[];

    final currentLocale = Localizations.localeOf(context);

    final formGroup = FormGroup(
      {'locale': FormControl<Locale>(value: currentLocale)},
    );

    return Scaffold(
      appBar: UiAppBar(
        title: Text(
          MenuI18n.language,
          style: context.text.mainTitle,
        ),
        useColor: true,
        actions: [
          UiButton.action(
            text: CoreI18n.save,
            onPressed: () {
              context
                  .read<AppSettingsCubit>()
                  .setLocale(formGroup.value['locale']! as Locale);
              Future.delayed(
                const Duration(milliseconds: 200),
                () => Navigator.of(context).pop(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Insets.l,
          right: Insets.l,
          top: Insets.l,
          bottom: Insets.l,
        ),
        child: ReactiveForm(
          key: UniqueKey(),
          formGroup: formGroup,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: supportedLocales.length,
                  itemBuilder: (context, index) {
                    return UiCard(
                      //margin: EdgeInsets.zero,

                      padding: const EdgeInsets.only(
                        top: Insets.s,
                        left: Insets.l,
                      ),
                      titleWidget: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: Insets.xs),
                            child: Text(
                              AppSettingsI18n.languageFlag(
                                supportedLocales[index].languageCode,
                              ),
                              style: context.text.mainTitle,
                            ),
                          ),
                          const SizedBox(
                            width: Insets.s,
                          ),
                          Expanded(
                            child: Text(
                              AppSettingsI18n.languageType(
                                supportedLocales[index].languageCode,
                              ),
                              style: context.text.mainTitle,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                            width: 34,
                            child: UiRadioField<Locale>(
                              key: UniqueKey(),
                              label: '',
                              value: supportedLocales[index],
                              formControl: formGroup.controls['locale']!
                                  as FormControl<Locale>,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
