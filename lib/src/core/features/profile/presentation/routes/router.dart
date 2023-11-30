import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class ProfileRouter extends AppRouter {
  ProfileRouter(super.router);

  void goToEdit() {
    pushNamed(ProfileRoutePath.edit);
  }

  void goToEditBirthTime() {
    pushNamed(ProfileRoutePath.editBirthTime);
  }

  void goToPhotos() {
    pushNamed(ProfileRoutePath.photos);
  }

  void goToAboutMe() {
    pushNamed(ProfileRoutePath.aboutMe);
  }

  void goToQuestionnaire({String? question}) {
    pushNamed(ProfileRoutePath.questionnaire.query({'question': question}));
  }

  void goToInterests() {
    pushNamed(ProfileRoutePath.interests);
  }
}
