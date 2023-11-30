import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

typedef UpdateDictCallback = List<DictModel> Function(
  List<DictModel> dict,
);

abstract class DictsCacheDataSource {
  Future<void> init();

  Future<void> saveDict(DictEnum name, List<DictModel> dict);

  Future<Map<DictEnum, List<DictModel>>> getAllDicts();

  Future<List<DictModel>> getDict(DictEnum name);

  Future<void> clear();

  Stream<Map<DictEnum, List<DictModel>>> get stream;

  Stream<List<DictModel>> watch(DictEnum name);

  Future<List<DictModel>> updateDict(
    DictEnum name,
    UpdateDictCallback onUpdate,
  );
}
