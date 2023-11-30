import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_sign_up_photo_data_source.g.dart';

@RestApi()
abstract class RestSignUpPhotoDataSource implements PhotosDataSource {
  factory RestSignUpPhotoDataSource(Dio dio, {String baseUrl}) =
      _RestSignUpPhotoDataSource;

  @override
  @POST(ProfileApiMethods.worksheetPhotos)
  @MultiPart()
  Future<PhotoModel> uploadPhoto(
    @Part(name: 'image', fileName: 'image.jpg') List<int> image, {
    @SendProgress() ProgressCallback? sendProgress,
  });

  @override
  @DELETE(ProfileApiMethods.worksheetDeletePhotos)
  Future<void> deletePhoto(@Path('id') int id);

  @override
  @POST(ProfileApiMethods.worksheetSortPhotos)
  Future<void> sortPhotos(@Body() SortPhotosRequestDTO data);

  @override
  @GET(ProfileApiMethods.personalPhotos)
  Future<PhotosResponseDTO> getPhotos();
}
