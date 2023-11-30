import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const int contentSize = 69;

@RoutePage()
class ProfilePhotosPage extends StatelessWidget {
  const ProfilePhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePhotosCubit>(
      create: (context) => ProfileInjection.sl(),
      child: BlocBuilder<ProfilePhotosCubit, ProfilePhotosState>(
        builder: (context, state) {
          return Scaffold(
            appBar: UiAppBar(
              useColor: true,
              title: Text(ProfileI18n.photos),
            ),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(
                Insets.l,
                Insets.l,
                Insets.l,
                Insets.bottomNavBar,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: Insets.l,
                  ),
                  child: Row(
                    children: [
                      Text(
                        ProfileI18n.newPhotoDescription,
                        style: context.text.smallText.copyWith(
                          color: context.color.smallTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.allPhotosLength != 0)
                  ProfilePhotoGallery(
                    emptyPhotos: state.emptyPhotos,
                    photos: state.photos,
                    tempPhotos: state.tempPhotos,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
