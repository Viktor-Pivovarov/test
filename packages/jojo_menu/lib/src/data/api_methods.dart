class MenuApiMethods {
  static const String datingInfo = '/v1/personal/dating-info';
  static const String faq = '/v1/faq';
  static const String tariffs = '/v1/tariffs';
  static const String thirdPartyLinks = '/v1/third-party-links';
  static const String freezeAccount = '/v1/personal/freeze-account';
  static const String unfreezeAccount = '/v1/personal/antifreeze-account';
  static const String deleteAccount = '/v1/personal/remove-account';
  static const String userSettings = '/v1/personal/user-settings';
  static const String toggleNotificationMutualSympathy =
      '/v1/personal/user-settings/toggle-notification-mutual-sympathy';
  static const String toggleNotificationNewChatMessage =
      '/v1/personal/user-settings/toggle-notification-new-chat-message';
  static const String toggleNotificationNewStackOffer =
      '/v1/personal/user-settings/toggle-notification-new-stack-offer';
  static const String blacklist = '/v1/personal/blacklist';
  static const String userBlock = '/v1/user/{userId}/block';
  static const String userUnblock = '/v1/user/{userId}/unblock';
  static const String feedbackReasons = '/v1/dict/feedback-reasons';
  static const String feedbacks = '/v1/feedbacks';
  static const String feedbackAvailableInfo =
      '/v1/personal/feedback-available-info';
  static const String bonuses = '/v1/personal/bonuses';

  //TODO: not implemented on the backend
  static const String reasonsForDeletion = '/v1/dict/deletion-reasons';
}
