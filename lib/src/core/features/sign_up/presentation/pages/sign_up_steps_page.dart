import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class SignUpStepsPage extends StatefulWidget {
  const SignUpStepsPage({super.key, this.onResult});

  final OnResult? onResult;

  @override
  State<SignUpStepsPage> createState() => _SignUpStepsPageState();
}

class _SignUpStepsPageState extends State<SignUpStepsPage> {
  final GlobalKey<AnimatedListState> messagesKey =
      GlobalKey<AnimatedListState>();

  late SignUpStepsCubit signUpStepsCubit;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpStepsCubit.init(messagesKey);
    });
  }

  int? get _getCurrentStepId =>
      signUpStepsCubit.state.currentStep == StepEnum.complete
          ? signUpStepsCubit.state.steps.keys.length - 1
          : signUpStepsCubit.state.steps.keys
              .firstWhereOrNull(
                (item) => item == signUpStepsCubit.state.currentStep,
              )
              ?.index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpStepsCubit>(
      create: (context) =>
          signUpStepsCubit = SignUpInjection.sl<SignUpStepsCubit>(),
      child: BlocBuilder<SignUpStepsCubit, SignUpStepsState>(
        builder: (BuildContext context, SignUpStepsState state) {
          final cubit = context.read<SignUpStepsCubit>();

          return WillPopScope(
            onWillPop: () => cubit.onWillPop(widget.onResult),
            child: Scaffold(
              appBar: UiAppBar(
                useColor: true,
                backgroundColor: Colors.white,
                title: Row(
                  children: <Widget>[
                    GestureDetector(
                      onLongPress: () => AuthInjection.sl<AuthCubit>()
                          .onPressedSystemDialog(useFastRegistration: true),
                      child: UiProfileAppBarCard(
                        isOnline: true,
                        showStatus: true,
                        name: Text(
                          SignUpI18n.botName,
                          style: context.text.smallTitle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Insets.xxl,
                          right: Insets.xxl,
                          top: Insets.xs,
                        ),
                        child: UiLinearIndicator(
                          key: ValueKey(_getCurrentStepId),
                          percent: (_getCurrentStepId ?? 0) * 10,
                          radius: 5,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  UiButton.action(
                    text: SignUpI18n.helpBtn,
                    textStyle: context.text.mainTextMedium
                        .copyWith(color: context.color.mainAccentColor),
                    padding: const EdgeInsets.only(top: Insets.xs),
                    onPressed: () {
                      //TODO(amerzliakov): fix
                      context.router.push(const SupportingRoute());
                    },
                  ),
                ],
              ),
              body: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedList(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Insets.xxl,
                        horizontal: Insets.l,
                      ),
                      key: messagesKey,
                      initialItemCount: state.items.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                        Animation<double> animation,
                      ) {
                        return AnimatedItem(
                          index: index,
                          animation: animation,
                          items: state.items,
                        );
                      },
                    ),
                  ),
                  if (state.showLoader) const UiLoader(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
