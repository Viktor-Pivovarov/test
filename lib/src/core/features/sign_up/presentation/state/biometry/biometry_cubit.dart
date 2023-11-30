import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';
import 'package:neo_image_editor/optimize_settings.dart';
import 'package:permission_handler/permission_handler.dart';

part 'biometry_cubit.freezed.dart';
part 'biometry_state.dart';

class BiometryCubit extends Cubit<BiometryState>
    implements AbstractRegisterStep {
  BiometryCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
    required AuthRouter router,
    required AuthManager<AuthenticatedUser> authManager,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _authManager = authManager,
        _router = router,
        _notifyService = notifyService,
        super(const BiometryState.initial());

  static StepEnum id = StepEnum.biometry;

  final SignUpRepository _repository;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final AuthManager<AuthenticatedUser> _authManager;
  final AuthRouter _router;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[Validators.required],
  );

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  late void Function(
    List<StepWidget>? children, {
    bool useDuration,
  }) _addChildren;

  Future<void> _save() async {
    emit(
      state.copyWith(isEditing: false),
    );
    final user = state.user;
    final result = await _repository.setBiometricsIncrement();

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
      emit(
        state.copyWith(isEditing: true),
      );
    }, (r) {
      if (user != null) {
        _onFinish(
          user.copyWith(
            biometric: state.biometric,
          ),
          id,
        );
      }
    });
  }

  void setIsPassVerification(bool isPassVerification) {
    if (!state.isPassVerification) {
      emit(state.copyWith(isPassVerification: isPassVerification));
    }
  }

  Future<void> logout() async {
    await _authManager.signOut();
    await _router.replaceNamed(RoutePath.initial);
  }

  Future<void> _makeSelfie() async {
    final result = await SelectImagesHelper.selectImages(
          maxPhotos: 1,
          aspectRatio: JoJoSDKConstants.defaultPhotoAspectRatio,
          sourceType: NeoImageSourceType.camera,
          useFrontCamera: true,
          onPermissionDenied: (type, onClose) {
            return PermissionFullScreenDialog(
              title: SignUpI18n.permissionCameraTitle,
              description: SignUpI18n.permissionCameraDescription,
              mainButtonTitle: SignUpI18n.openSettingsBtn,
              secondaryButtonTitle: SignUpI18n.abortRegistrationBtn,
              onClose: onClose,
              permission: Permission.camera,
              onSecondaryTap: logout,
            );
          },
          optimizeSettings: const OptimizeSettings(
            quality: 70,
          ),
        ) ??
        [];

    if (result.isEmpty) {
      return;
    }

    emit(
      state.copyWith(),
    );

    // final result = [
    //   (await rootBundle.load('assets/launcher_icon.jpg')).buffer.asUint8List(),
    // ];

    await _uploadPhoto(result.first);
  }

  Future<void> _uploadPhoto(List<int> image) async {
    final hasImage = state.biometric != null;

    final result = await _repository.setBiometrics(image);

    result.fold(
      (error) {
        _notifyService.showError(error.message ?? '');
      },
      (response) {
        emit(state.copyWith(biometric: response));

        if (!hasImage) {
          _addImages();
        }
      },
    );
  }

  void _passVerification({bool useDuration = true}) {
    if (!state.isPassVerification) {
      _addChildren(
        [
          StepWidget(
            typingDuration: 1000,
            readingDuration: 0,
            child: const UiMessage(isTyping: true),
            replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
              bloc: this,
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.examination != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Insets.l),
                        child: Image.network(state.examination!.image),
                      ),
                  ],
                );
              },
            ),
          ),
          StepWidget(
            typingDuration: 0,
            readingDuration: 0,
            child: const UiMessage(isTyping: true),
            replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
              bloc: this,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Insets.l,
                      ),
                      child: UiMessage(
                        content: SignUpI18n.correctSelfiePoseMessage,
                      ),
                    ),
                    if (state.biometric == null)
                      UiButton(
                        text: SignUpI18n.takeSelfieBtn,
                        suffixIcon: UiIcon(Assets.icons.iPhoto),
                        onPressed: _makeSelfie,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
        useDuration: useDuration,
      );

      setIsPassVerification(true);
    }
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 3000,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
            bloc: this,
            builder: (context, state) {
              return UiMessage(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: SignUpI18n.checkUserMessage,
                        style: context.text.chatText
                            .copyWith(color: context.color.textColor),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: Insets.xxs),
                          child: UiIcon(
                            Assets.icons.iParkSolidProtect,
                            useColor: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.selfieMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
            bloc: this,
            builder: (context, state) {
              return !state.isPassVerification
                  ? UiButton(
                      disabled: state.isPassVerification,
                      text: SignUpI18n.passVerificationBtn,
                      suffixIcon:
                          UiIcon(Assets.icons.iParkSolidProtectWithoutFill),
                      onPressed: _passVerification,
                    )
                  : Container();
            },
          ),
        ),
      ];

  void _addImages({bool useDuration = true}) {
    _addChildren(
      [
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
            bloc: this,
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.examination != null)
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Insets.l),
                        child: Image.network(state.examination!.image),
                      ),
                    ),
                  const SizedBox(width: Insets.l),
                  if (state.biometric != null)
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Insets.l),
                        child: Image.network(state.biometric!.image),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: Padding(
            padding: const EdgeInsets.only(
              top: Insets.l,
            ),
            child: UiMessage(
              content: SignUpI18n.poseMatchingCheckMessage,
            ),
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BiometryCubit, BiometryState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isEditing) ...[
                    UiButton.outline(
                      text: SignUpI18n.retakePhotoBtn,
                      suffixIcon: UiIcon(Assets.icons.iPhoto),
                      onPressed: _makeSelfie,
                    ),
                    UiButton(
                      text: SignUpI18n.submitPhotoReviewBtn,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      onPressed: _save,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.submitPhotoReviewEditModeMessage,
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ],
      useDuration: useDuration,
    );
  }

  @override
  Future<void> init(
    StepEnum? initStep,
    void Function(
      List<StepWidget>? children, {
      bool useDuration,
    }) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  ) async {
    _addChildren = addChildren;
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());

    _stream = result.listen(
      (user) {
        if (state.status.isPure) {
          final value = user.biometric;
          final isInitValue = value == null;

          addChildren(
            children(),
            useDuration: isInitValue,
          );

          if (!isInitValue) {
            _passVerification(useDuration: isInitValue);
            _addImages(useDuration: isInitValue);
            if (initStep != id) {
              onFinish();
            }
          }

          emit(
            state.copyWith(
              user: user,
              isPassVerification: !isInitValue,
              examination: user.examination,
              biometric: user.biometric,
              isEditing: isInitValue || initStep == id,
              status: StateStatus.fetchingSuccess,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
