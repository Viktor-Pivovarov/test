import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.form,
    this.onSubmitForm,
    this.message,
    super.key,
  });

  final FormGroup form;
  final String? message;

  final VoidCallback? onSubmitForm;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: Insets.l,
            ),
            child: Text(
              AuthI18n.signIn,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Insets.l),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Insets.s),
                  child: Text(AuthI18n.login),
                ),
                Expanded(
                  child: ReactiveTextField<String>(
                    formControlName: 'login',
                    validationMessages: <String, String Function(Object)>{
                      ValidationMessage.required: (Object error) =>
                          AuthI18n.loginRequired,
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Insets.l),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Insets.s),
                  child: Text(AuthI18n.password),
                ),
                Expanded(
                  child: ReactiveTextField<String>(
                    formControlName: 'password',
                    obscureText: true,
                    validationMessages: <String, String Function(Object)>{
                      'required': (Object error) => AuthI18n.passwordRequired,
                    },
                  ),
                ),
              ],
            ),
          ),
          UiButton.outline(
            onPressed: () => form.valid ? onSubmitForm?.call() : null,
            text: AuthI18n.signIn,
          ),
          Visibility(
            visible: message != null,
            child: Text(
              message ?? '',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
