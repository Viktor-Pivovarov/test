import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:jojo/src/app.dart';
import 'package:xander9112/xander9112.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      await App.init(await Env.getCurrentEnv());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}
