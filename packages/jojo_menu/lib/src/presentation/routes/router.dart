import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

class MenuRouter extends AppRouter {
  MenuRouter(super.router);

  void goToMenu() {
    pushNamed(MenuRoutePath.menu);
  }

  void goToDeleteAccount() {
    pushNamed(MenuRoutePath.deleteAccount);
  }

  void goToDeleteAccountConfirm() {
    pushNamed(MenuRoutePath.deleteAccountConfirm);
  }

  void goToAbout() {
    pushNamed(MenuRoutePath.about);
  }

  void goToAlgorithm() {
    pushNamed(MenuRoutePath.algorithm);
  }

  void goToBlacklist() {
    pushNamed(MenuRoutePath.blacklist);
  }

  void goToFreeDates() {
    pushNamed(MenuRoutePath.freeDates);
  }

  void goToFreezeAccount() {
    pushNamed(MenuRoutePath.freezeAccount);
  }

  void goToLanguages() {
    pushNamed(MenuRoutePath.languages);
  }

  void goToNotifications() {
    pushNamed(MenuRoutePath.notifications);
  }

  void goToSettings() {
    pushNamed(MenuRoutePath.settings);
  }

  void goToStatistics() {
    pushNamed(MenuRoutePath.statistics);
  }

  void goToSupport() {
    pushNamed(MenuRoutePath.support);
  }

  void goToTariffs() {
    pushNamed(MenuRoutePath.tariffs);
  }

  void goToPrivacyPolicy() {
    pushNamed(MenuRoutePath.privacyPolicy);
  }

  void gotToTermsOfUse() {
    pushNamed(MenuRoutePath.terms);
  }

  void goToPersonalDataProcessing() {
    pushNamed(MenuRoutePath.personalDataProcessing);
  }

  Future<bool?> goToSupportingForm() {
    return push<bool>(const SupportingRoute());
  }

  void goToInitial() {
    pushNamed(MenuRoutePath.initial);
  }

  void goToSelection() {
    //TODO: move all routes into a common package
    navigateNamed('/main/selection');
  }

  void goToProfile() {
    //TODO: move all routes into a common package
    navigateNamed('/main/profile');
  }
}
