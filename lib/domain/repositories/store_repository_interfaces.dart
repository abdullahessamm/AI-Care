abstract class IStoreRepository {
  Future<StoreResult> get all;
  Future<StoreResult> getById(String uid);
  Future<StoreResult> getByKey(String key, String? value);
  Future<StoreResult> search(String query);
  Future<StoreResult> create(Map<String, dynamic> data);
  Future<StoreResult> update(String uid, Map<String, dynamic> data);
  Future<StoreResult> delete(String uid);
}

class StoreResult {
  final bool success;
  final String? errorMessage;
  final List<Map<String, dynamic>>? data;

  StoreResult({required this.success, this.errorMessage, this.data});
}
