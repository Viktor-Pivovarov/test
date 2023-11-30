import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class SelectionCompatibilityPage extends StatelessWidget {
  const SelectionCompatibilityPage({
    @PathParam('id') required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final avatarSize = MediaQuery.of(context).size.width / 4.8;

    return Scaffold(
      appBar: UiAppBar(title: Text(SelectionI18n.compatibility)),
      body: BlocBuilder<OfferCubit, OfferState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Insets.l),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: avatarSize,
                        height: avatarSize,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(96),
                          child: CacheImage(
                            url: state.offer?.candidate.photos.first,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RatingBlock(
                          size: 120,
                          state.offer!.compatibility.value.toDouble(),
                        ),
                      ),
                      BlocProvider.value(
                        value: ProfileInjection.sl<ProfileCubit>(),
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: avatarSize,
                              height: avatarSize,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(96),
                                child: CacheImage(
                                  url: state.profile.photos.first.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                RatingCarousel(state.offer!.compatibility.value.toDouble()),
                const UiDivider(margin: EdgeInsets.all(Insets.l)),
                // RatingInfo(pair.vedic),
              ],
            ),
          );
        },
      ),
    );
  }
}
