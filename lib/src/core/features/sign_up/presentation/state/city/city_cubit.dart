import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'city_cubit.freezed.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> implements AbstractRegisterStep {
  CityCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required GeoLocationRouter geoLocationRouter,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _geoLocationRouter = geoLocationRouter,
        _notifyService = notifyService,
        super(const CityState.initial());

  static StepEnum id = StepEnum.cityBorn;

  final SignUpRepository _repository;

  final GeoLocationRouter _geoLocationRouter;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[Validators.required],
  );

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final user = state.user;
    final location = state.location;

    final result = await _repository.setCityBorn(location);

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );

      if (user?.searcher != null) {
        _onFinish(
          user?.copyWith(
            searcher: user.searcher.copyWith(location: location),
          ),
          id,
        );
      }
    });
  }

  void onChanged(LocationModel location) {
    emit(state.copyWith(location: location));
    formControl.value = location.city;
  }

  Future<void> openDialog(BuildContext context) async {
    final geoLocation = await _geoLocationRouter.goToGeoLocation(
      title: SignUpI18n.placeBirthEditModeMessage,
    );

    if (geoLocation != null) {
      final location = LocationModel(
        coordinate: CoordinateModel(
          latitude: geoLocation.latitude,
          longitude: geoLocation.longitude,
        ),
        city: geoLocation.name,
      );

      onChanged(location);

      await _save();
    }
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.enterCityMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<CityCubit, CityState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  if (state.isEditing) ...[
                    UiTextField<String>(
                      hintText: SignUpI18n.cityFieldHint,
                      autofocus: true,
                      readOnly: true,
                      formControl: formControl,
                      onTap: (FormControl<String> control) =>
                          openDialog(context),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_right,
                        color: context.color.smallTextColor,
                        size: 28,
                      ),
                      isDense: true,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.placeBirthEditModeMessage,
                      content: state.location.city ?? '',
                      onPressed: () {
                        emit(
                          state.copyWith(isEditing: true),
                        );
                      },
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ];

  @override
  Future<void> init(
    StepEnum? initStep,
    void Function(
      List<StepWidget>? children, {
      bool useDuration,
    }) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  ) async {
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());

    _stream = result.listen(
      (user) {
        if (state.status.isPure) {
          final value = user.vedic.birthLocation;
          final isInitValue = value?.city == null;

          addChildren(
            children(),
            useDuration: isInitValue,
          );

          if (!isInitValue) {
            onChanged(value!);
            if (initStep != id) {
              onFinish();
            }
          }

          emit(
            state.copyWith(
              user: user,
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
