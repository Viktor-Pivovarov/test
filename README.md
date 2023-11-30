# JoJo

## Начало

Скопировать содержимое `android/local.properties.example` в `android/local.properties`

Для запуска проекта в dev режимен введите команду

```bash
flutter run --flavor=dev --dart-define=flavor=dev --dart-define=API_URL=https://api.jojo-dating.com/api --dart-define=WS_URL=ws://api.jojo-dating.com:8000/connection/websocket --dart-define=APP_METRICA_KEY=8b32070a-64d6-4069-9880-a7c891c0b569
```

Для запуска проекта в prod режимен введите команду

```bash
flutter run --flavor=prod --dart-define=flavor=prod --dart-define=API_URL=https://api.jojo-dating.com/api --dart-define=WS_URL=ws://api.jojo-dating.com:8000/connection/websocket --dart-define=APP_METRICA_KEY=2be2049b-d3c7-4677-b18c-070c96adbaeb
```

## Запустить генерацию моделей

dart pub global activate flutter_gen

```bash
dart init_project.dart
```

```bash
dart pub global activate mason_cli
```

```bash
mason get
```

зайти в папку где нужно сгенерировать фичу

mason make flow_feature --name название фичи (SignIn или sign_in)
example: mason make flow_feature --name sign_in

Получить сертификаты

cd android

./gradlew signingReport

Установить глобально пакет для генерации переводов

Запустить генерацию arb файла

```bash
dart helpers/gen_arb.dart
```

Проверить отсутствие переводов

```bash
dart helpers/check_intl_translates.dart
```

после генерации файла intl*messages.arb скопировать и добавить файлы с нужными локализациями intl_messages*{locale}.arb (intl_messages_ru.arb)
Внутри файла добавить строчку "@@locale": "ru",

Из файла assets/l10n/intl_messages.arb скопировать сгенерированные значения в файлы переводов и запустить генерацию кода

```bash
dart helpers/gen_from_arb.dart
```

flutterfire configure --project=jojo-authenticate-dev --ios-bundle-id=com.dating.jojo.dev --android-package-name=com.dating.jojo.dev

## Генерация launcher_icon

```bash
flutter pub run flutter_launcher_icons
```

# Сборка и старт проекта

## Run app in `dev` environment

```bash
flutter run  --flavor=dev
```

## Run app in debug mode (Picks up debug signing config)

```bash
flutter run --debug --flavor=dev
```

## Create APK for dev flavor. Runs in release mode by default.

```bash
flutter build apk --flavor=dev --dart-define=API_URL=https://api.jojo-dating.com/api
flutter build ipa --flavor=dev --dart-define=API_URL=https://api.jojo-dating.com/api
```

## Create appBundle for Android platform. Runs in release mode by default.

```bash
flutter build appbundle --flavor=dev --dart-define=API_URL=https://api.jojo-dating.com/api
```

## Run app in release mode (Picks up release signing config)

```bash
flutter run --release --flavor=prod
```

## Create apk for Android platform. Runs in release mode by default.

```bash
flutter build apk --flavor=prod --dart-define=API_URL=https://api.jojo-dating.com/api
```

## Create appBundle for Android platform. Runs in release mode by default.

```bash
flutter build appbundle --flavor=prod --dart-define=API_URL=https://api.jojo-dating.com/api
```
