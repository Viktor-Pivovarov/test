import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'remote_account_status_datasource.g.dart';

@RestApi()
abstract class RemoteAccountStatusDataSource {
  factory RemoteAccountStatusDataSource(Dio dio, {String baseUrl}) =
      _RemoteAccountStatusDataSource;

  @PUT(MenuApiMethods.freezeAccount)
  Future<void> freezeAccount();

  @PUT(MenuApiMethods.unfreezeAccount)
  Future<void> unfreezeAccount();

  @DELETE(MenuApiMethods.deleteAccount)
  Future<void> deleteAccount(
    @Body() DeletionRequestDto request,
  );

  @GET(MenuApiMethods.bonuses)
  Future<BonusesDto> getBonuses();

  @GET(MenuApiMethods.feedbackAvailableInfo)
  Future<FeedbackAvailableInfoDto> getFeedbackBonusStatus();

  @GET(MenuApiMethods.reasonsForDeletion)
  Future<DeletionReasonsDto> getReasonsForDeletion();
}
