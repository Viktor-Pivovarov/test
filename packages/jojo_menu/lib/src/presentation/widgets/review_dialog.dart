import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (context) => MenuInjection.sl<ReviewCubit>()..init(),
      child: Dialog.fullscreen(
        backgroundColor: Colors.white,
        child: BlocConsumer<ReviewCubit, ReviewState>(
          listener: (context, state) {
            if (state.status.isFinish) {
              Navigator.of(context).pop(true);
            }
          },
          builder: (context, state) {
            if (!state.status.isFetchingSuccess) {
              return UiCircleProgressIndicator(
                color: context.color.mainAccentColor,
              );
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: UiIcon(Assets.icons.iCross),
                          onTap: () => Navigator.of(context).pop(false),
                        ),
                      ],
                    ),
                    Expanded(
                      child: _ReviewWidget(state.form!, state.reasons),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ReviewWidget extends StatefulWidget {
  const _ReviewWidget(this.form, this.reasons);

  final FormGroup form;

  final List<DictModel> reasons;

  @override
  State<_ReviewWidget> createState() => __ReviewWidgetState();
}

class __ReviewWidgetState extends State<_ReviewWidget> {
  final ScrollController scrollController = ScrollController();

  StreamSubscription<Object?>? subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.form.controls['text']?.valueChanges.listen((event) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.xxxl,
                    vertical: Insets.l,
                  ),
                  child: UiImage(
                    Platform.isIOS
                        ? Assets.images.reviewIos
                        : Assets.images.reviewAndroid,
                  ),
                ),
                ReactiveValueListenableBuilder(
                  formControl: widget.form.controls['rating'],
                  builder: (context, control, child) {
                    final rating = (control as FormControl<int>).value!;
                    return Text(
                      MenuI18n.reviewDescription(rating),
                      style: context.text.bigTitle,
                    );
                  },
                ),
                const SizedBox(
                  height: Insets.l,
                ),
                ReactiveValueListenableBuilder(
                  formControl: widget.form.controls['rating'],
                  builder: (context, control, child) {
                    final rating = (control as FormControl<int>).value!;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        if (index + 1 <= rating) {
                          return GestureDetector(
                            child: UIShadow(
                              boxShadow: [
                                BoxShadow(
                                  color: context.color.starColor.withAlpha(110),
                                  blurRadius: 10,
                                  spreadRadius: -8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              child: UiIcon(
                                Assets.icons.starFilled,
                                color: context.color.starColor,
                              ),
                            ),
                            onTap: () {
                              control.value = index + 1;
                            },
                          );
                        }
                        return GestureDetector(
                          child: UiIcon(
                            Assets.icons.starOutlined,
                            color: context.color.smallTextColor,
                          ),
                          onTap: () {
                            control.value = index + 1;
                          },
                        );
                      }),
                    );
                  },
                ),
                ReactiveValueListenableBuilder(
                  formControl: widget.form.controls['rating'],
                  builder: (context, control, child) {
                    final rating = (control as FormControl<int>).value!;
                    if (rating == 0 || rating >= 4) {
                      return Padding(
                        padding: const EdgeInsets.only(top: Insets.m),
                        child: Text(
                          MenuI18n.reviewDescription2,
                          textAlign: TextAlign.center,
                          style: context.text.mainText
                              .copyWith(color: context.color.smallTextColor),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                ReactiveValueListenableBuilder(
                  formControl: widget.form.controls['rating'],
                  builder: (context, control, child) {
                    final rating = (control as FormControl<int>).value!;
                    if (rating == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: Insets.xxxl),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            UiImage(
                              Assets.images.ava1,
                              width: 41,
                              height: 41,
                            ),
                            const SizedBox(
                              width: Insets.l,
                            ),
                            Text(
                              MenuI18n.reviewHint,
                              style: context.text.mainTextMedium.copyWith(
                                fontStyle: FontStyle.italic,
                                color: context.color.mainAccentColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
                ReactiveValueListenableBuilder(
                  formControl: widget.form.controls['rating'],
                  builder: (context, control, child) {
                    final rating = (control as FormControl<int>).value!;

                    if (rating >= 1 && rating <= 3) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: Insets.xl),
                        child: Column(
                          children: [
                            Wrap(
                              runSpacing: Insets.s,
                              spacing: Insets.s,
                              alignment: WrapAlignment.center,
                              children: [
                                for (final reasons in widget.reasons)
                                  UiChipField(
                                    formControl:
                                        widget.form.controls['${reasons.id}']!
                                            as FormControl<bool>,
                                    title: reasons.name,
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ReactiveTextField(
                              maxLines: null,
                              maxLength: 1000,
                              decoration: InputDecoration(
                                hintText: '${MenuI18n.yourComment} ...',
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Insets.l),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Insets.l),
                                ),
                              ),
                              formControl: widget.form.controls['text']!
                                  as FormControl<String>,
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
        ReactiveValueListenableBuilder(
          formControl: widget.form.controls['rating'],
          builder: (context, control, child) {
            final rating = (control as FormControl<int>).value!;

            return UiButton(
              text: MenuI18n.send,
              onPressed:
                  rating != 0 ? context.read<ReviewCubit>().submit : null,
            );
          },
        ),
      ],
    );
  }
}
