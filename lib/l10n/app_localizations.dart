import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jojo/l10n/generated/messages_all.dart';

class AppLocalizations {
  static Iterable<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ru'),
    const Locale('it'),
    const Locale('de'),
    const Locale('es'),
    const Locale('fr'),
  ];

  static Locale deviceLocale(BuildContext context) =>
      Localizations.localeOf(context);

  static Future<AppLocalizations> load(Locale locale) async {
    final String localName =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();

    final String canonicalLocaleName = Intl.canonicalizedLocale(localName);

    Intl.defaultLocale = canonicalLocaleName;

    await initializeMessages(canonicalLocaleName);

    return AppLocalizations();
  }
}
