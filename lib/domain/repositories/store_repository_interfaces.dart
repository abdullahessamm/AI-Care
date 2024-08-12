abstract class IStoreRepository<Model> {
  Future<StoreResult<Model>> get all;
  Future<StoreResult<Model>> getById(String uid);
  Future<StoreResult<Model>> getByKey(String key, String? value);
  // Future<StoreResult<Model>> search(String query);
  Future<StoreResult<Model>> create(Model model);
  Future<StoreResult<Model>> update(Model model);
  Future<StoreResult> delete(String uid);
}

class StoreResult<T extends Object?> {
  final bool success;
  final String? errorMessage;
  final List<T>? data;

  StoreResult({required this.success, this.errorMessage, this.data});

  factory StoreResult.success({List<T>? data}) =>
      StoreResult<T>(success: true, data: data);

  factory StoreResult.failure({required String? error}) =>
      StoreResult<T>(success: false, errorMessage: error);
}
