import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations_es.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations_fr.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations_it.dart';

import 'neo_image_editor_localizations_de.dart';
import 'neo_image_editor_localizations_en.dart';
import 'neo_image_editor_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of NeoImageEditorLocalizations
/// returned by `NeoImageEditorLocalizations.of(context)`.
///
/// Applications need to include `NeoImageEditorLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/neo_image_editor_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NeoImageEditorLocalizations.localizationsDelegates,
///   supportedLocales: NeoImageEditorLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the NeoImageEditorLocalizations.supportedLocales
/// property.
abstract class NeoImageEditorLocalizations {
  NeoImageEditorLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NeoImageEditorLocalizations of(BuildContext context) {
    return Localizations.of<NeoImageEditorLocalizations>(
        context, NeoImageEditorLocalizations)!;
  }

  static const LocalizationsDelegate<NeoImageEditorLocalizations> delegate =
      _NeoImageEditorLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('it'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;
}

class _NeoImageEditorLocalizationsDelegate
    extends LocalizationsDelegate<NeoImageEditorLocalizations> {
  const _NeoImageEditorLocalizationsDelegate();

  @override
  Future<NeoImageEditorLocalizations> load(Locale locale) {
    return SynchronousFuture<NeoImageEditorLocalizations>(
        lookupNeoImageEditorLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'ru',
        'it',
        'de',
        'es',
        'fr',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_NeoImageEditorLocalizationsDelegate old) => false;
}

NeoImageEditorLocalizations lookupNeoImageEditorLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NeoImageEditorLocalizationsEn();
    case 'ru':
      return NeoImageEditorLocalizationsRu();
    case 'de':
      return NeoImageEditorLocalizationsDe();
    case 'es':
      return NeoImageEditorLocalizationsEs();
    case 'fr':
      return NeoImageEditorLocalizationsFr();
    case 'it':
      return NeoImageEditorLocalizationsIt();
  }

  throw FlutterError(
      'NeoImageEditorLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
