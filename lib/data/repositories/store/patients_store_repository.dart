import 'package:ai_care/data/models/users/patients_model.dart';
import 'package:ai_care/domain/repositories/store_repository_interfaces.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientsStoreRepository implements IStoreRepository<PatientsModel> {
  final _store = FirebaseFirestore.instance;
  final _collectionName = "patients";

  @override
  Future<StoreResult<PatientsModel>> get all async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      QuerySnapshot querySnapshot = await collection.get();
      return StoreResult<PatientsModel>.success(
          data: querySnapshot.docs
              .map(
                (doc) =>
                    PatientsModel.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList());
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during fetching user");
    }
  }

  @override
  Future<StoreResult<PatientsModel>> create(PatientsModel model) async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      await collection.doc(model.uid).set(model.toMap());
      return StoreResult.success(data: [model]);
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during creating user");
    }
  }

  @override
  Future<StoreResult> delete(String uid) async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      await collection.doc(uid).delete();
      return StoreResult.success();
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during deleting user");
    }
  }

  @override
  Future<StoreResult<PatientsModel>> getById(String uid) async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      DocumentSnapshot docSnapshot = await collection.doc(uid).get();
      return StoreResult.success(
        data: [
          PatientsModel.fromMap(docSnapshot.data() as Map<String, dynamic>)
        ],
      );
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during fetching user");
    }
  }

  @override
  Future<StoreResult<PatientsModel>> getByKey(String key, String? value) async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      QuerySnapshot querySnapshot =
          await collection.where(key, isEqualTo: value).get();
      return StoreResult.success(
          data: querySnapshot.docs
              .map((doc) =>
                  PatientsModel.fromMap(doc.data() as Map<String, dynamic>))
              .toList());
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during fetching user");
    }
  }

  @override
  Future<StoreResult<PatientsModel>> update(PatientsModel model) async {
    try {
      final CollectionReference collection = _store.collection(_collectionName);
      await collection.doc(model.uid).update(model.toMap());
      return StoreResult.success();
    } on FirebaseException catch (e) {
      return StoreResult.failure(error: e.message);
    } catch (e) {
      return StoreResult.failure(
          error: "Something went wrong during updating user");
    }
  }
}
