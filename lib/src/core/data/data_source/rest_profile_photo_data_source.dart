import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_profile_photo_data_source.g.dart';

@RestApi()
abstract class RestProfilePhotoDataSource implements PhotosDataSource {
  factory RestProfilePhotoDataSource(Dio dio, {String baseUrl}) =
      _RestProfilePhotoDataSource;

  @override
  @POST(ProfileApiMethods.personalCabinetPhotos)
  @MultiPart()
  Future<PhotoModel> uploadPhoto(
    @Part(name: 'image', fileName: 'image.jpg') List<int> image, {
    @SendProgress() ProgressCallback? sendProgress,
  });

  @override
  @DELETE(ProfileApiMethods.personalCabinetDeletePhotos)
  Future<void> deletePhoto(@Path('id') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetSortPhotos)
  Future<void> sortPhotos(@Body() SortPhotosRequestDTO data);

  @override
  @GET(ProfileApiMethods.personalPhotos)
  Future<PhotosResponseDTO> getPhotos();
}
