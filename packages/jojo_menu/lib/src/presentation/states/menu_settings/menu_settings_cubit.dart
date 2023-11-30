import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_settings_cubit.freezed.dart';
part 'menu_settings_cubit.g.dart';
part 'menu_settings_state.dart';

class MenuSettingsCubit extends BaseCubit<MenuSettingsState> {
  MenuSettingsCubit({
    required AuthManager<AuthenticatedUser> authManager,
    required MenuRouter router,
  })  : _authManager = authManager,
        _router = router,
        super(const MenuSettingsState.initial());

  final AuthManager<AuthenticatedUser> _authManager;

  final MenuRouter _router;

  void onPressedLanguages() {
    _router.goToLanguages();
  }

  void onPressedNotifications() {
    _router.goToNotifications();
  }

  void onPressedBlackList() {
    _router.goToBlacklist();
  }

  Future<void> onPressedLogout() async {
    await _authManager.signOut();
    _router.goToInitial();
  }

  void onPressedFreezeAccount() {
    _router.goToFreezeAccount();
  }

  void onPressedDeleteAccount() {
    _router.goToDeleteAccount();
  }
}
