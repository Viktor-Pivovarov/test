// ignore_for_file: lines_longer_than_80_chars

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSystemDialog extends StatefulWidget {
  const UiSystemDialog({
    required this.manager,
    required this.router,
    this.useFastRegistration = false,
    super.key,
  });

  final AuthManager<AuthenticatedUser> manager;

  final AuthRouter router;

  final bool useFastRegistration;

  @override
  State<UiSystemDialog> createState() => _UiSystemDialogState();
}

class _UiSystemDialogState extends State<UiSystemDialog> {
  bool isLoading = false;

  AuthenticatedUser get user => widget.manager.user;

  bool get useFastRegistration => widget.useFastRegistration;

  Future<void> _onPressedCopy(String value) async {
    await FlutterClipboard.copy(value);

    _showMessage('Значение $value скопировано в буфер');

    // CoreSL.sl<NotifyService>()
    //     .showSuccess('Значение $value скопировано в буфер');
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            isError ? context.color.mainAccentColor : context.color.textColor,
      ),
    );
  }

  void _hideDialog() {
    DialogService.hide<void>(identifier: FullScreenDialog.identifier());
  }

  Future<void> _onPressedFastRegistration() async {
    setState(() {
      isLoading = true;
    });

    try {
      final _repository = SignUpInjection.sl<SignUpRepository>();

      await _repository.setFirstName('Александр');
      await _repository.setBirthday(DateTime(1990).toString());
      await _repository.setHeight(160);
      await _repository.setBirthTime('12:07');
      await _repository.setCityBorn(
        const LocationModel(
          coordinate:
              CoordinateModel(longitude: 73.1026622, latitude: 49.8161282),
          city:
              'Казахстан, Карагандинская обл, Карагандинская Г.А., г Караганда',
        ),
      );
      await _repository.setLanguages([33, 37]);

      final male =
          (await rootBundle.load('assets/male.png')).buffer.asUint8List();

      final female =
          (await rootBundle.load('assets/female.png')).buffer.asUint8List();

      await _repository.setPhoto(male);
      await _repository.setPhoto(female);
      await _repository.setPhotosIncrement();
      await _repository.setSearchAge(20, 40);
      await _repository.setBiometrics(male);
      await _repository.setBiometricsIncrement();
      await _repository.setComplete();

      await widget.router.replaceNamed('/');

      _hideDialog();
    } catch (_) {
      _showMessage(_.toString(), isError: true);
    } finally {
      setState(() {
        isLoading = true;
      });
    }
  }

  Future<void> _onPressedDeleteUser() async {
    try {
      await AuthInjection.sl<DioApiClient>().dio.get<void>(
        '/v1/danger/truncate-user',
        queryParameters: {'email': user.account.email},
      );

      await widget.manager.verify();

      _hideDialog();
    } catch (_) {
      await widget.manager.verify();

      _hideDialog();
    }
  }

  Future<void> _onPressedModerateUser() async {
    try {
      await AuthInjection.sl<DioApiClient>().dio.get<void>(
        '/v1/danger/moderate-user',
        queryParameters: {'email': user.account.email},
      );

      await CoreSL.sl<AuthManager<AuthenticatedUser>>().verify();

      _hideDialog();
    } catch (_) {
      _hideDialog();
    }
  }

  Future<void> _onPressedCreateStack() async {
    try {
      await AuthInjection.sl<DioApiClient>().dio.get<void>(
        '/v1/danger/match-pairs-for-me',
        queryParameters: {'email': user.account.email},
      );

      // await CoreSL.sl<AuthManager<AuthenticatedUser>>()
      //     .verify();

      // _hideDialog();
    } catch (_) {
      _hideDialog();
    }
  }

  Future<void> _onPressedCreateStackNow() async {
    try {
      await AuthInjection.sl<DioApiClient>().dio.get<void>(
        '/v1/danger/refresh-offers-stack-for-me',
        queryParameters: {'email': user.account.email},
      );

      // await CoreSL.sl<AuthManager<AuthenticatedUser>>()
      //     .verify();

      // _hideDialog();
    } catch (_) {
      _hideDialog();
    }
  }

  Future<void> _onPressedClearStack() async {
    try {
      await AuthInjection.sl<DioApiClient>().dio.get<void>(
        '/v1/danger/revert-offers-stack-for-me',
        queryParameters: {'email': user.account.email},
      );

      // await CoreSL.sl<AuthManager<AuthenticatedUser>>()
      //     .verify();

      // _hideDialog();
    } catch (_) {
      _hideDialog();
    }
  }

  Future<void> _onPressedSignOutUser() async {
    try {
      _hideDialog();

      await AuthInjection.sl<AuthManager<AuthenticatedUser>>().signOut();
    } catch (_) {
      _hideDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        actions: [
          IconButton(
            onPressed: () => DialogService.hide<dynamic>(
              identifier: FullScreenDialog.identifier(),
            ),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(user.account.email),
                  onTap: () => _onPressedCopy(user.account.email),
                  trailing: const Icon(Icons.copy),
                ),
                FutureBuilder(
                  future: AuthInjection.sl<
                          AuthRepository<AuthResponseModel,
                              AuthenticatedUser>>()
                      .getAccessToken(),
                  builder: (context, snapshot) {
                    return ListTile(
                      title: const Text('Access token'),
                      subtitle: Text(
                        snapshot.data ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => _onPressedCopy(snapshot.data ?? ''),
                      trailing: const Icon(Icons.copy),
                    );
                  },
                ),
                if (!useFastRegistration && user.profile.isModeration)
                  ListTile(
                    title: const Text('Отмодерировать'),
                    subtitle: Text(
                      'id: ${user.userId} - Status: ${user.profile.status.name}',
                    ),
                    onTap: _onPressedModerateUser,
                    trailing: const Icon(Icons.person),
                  ),
                ListTile(
                  title: const Text('Сформировать общий стек'),
                  subtitle: const Text(
                    'Это общий набор, данные кандидаты предлагаются порционно при формировании offer-stack-а',
                  ),
                  onTap: _onPressedCreateStack,
                  trailing: const Icon(Icons.person),
                ),
                ListTile(
                  title: const Text('Сформировать стек кандидатов'),
                  subtitle: const Text(
                    'Каждая итерация сокращает кол-во возможных подборов в течение дня на единицу',
                  ),
                  onTap: _onPressedCreateStackNow,
                  trailing: const Icon(Icons.person),
                ),
                ListTile(
                  title: const Text('Обнулить стек'),
                  subtitle: const Text(
                    '"Обнуляет статусы пар, предложений и зачищает стек, позволяя тем самым выполнить снова refresh stack-offer-ов"',
                  ),
                  onTap: _onPressedClearStack,
                  trailing: const Icon(Icons.person),
                ),
                const UiDivider(margin: EdgeInsets.all(Insets.l)),
                ListTile(
                  title: const Text('Удалить пользователя'),
                  subtitle: Text(
                    'id: ${user.userId} - ${user.profile.firstName ?? ''}',
                  ),
                  onTap: _onPressedDeleteUser,
                  trailing: const Icon(Icons.delete),
                ),
                ListTile(
                  title: const Text('Выйти из аккаунта'),
                  subtitle: Text(
                    'id: ${user.userId} - ${user.profile.firstName}',
                  ),
                  onTap: _onPressedSignOutUser,
                  trailing: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          if (useFastRegistration)
            ListTile(
              title: const Text('Быстрая регистрация'),
              contentPadding: const EdgeInsets.all(Insets.xl),
              onTap: isLoading ? null : _onPressedFastRegistration,
              leading: isLoading ? const CupertinoActivityIndicator() : null,
              trailing: const Icon(Icons.fast_forward),
            ),
        ],
      ),
    );
  }
}
