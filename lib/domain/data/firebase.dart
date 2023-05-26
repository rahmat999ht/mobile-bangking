import '../../app/core/core.dart';

class FirebaseMethod {
  Future addTransaction({
    Map<String, dynamic>? data,
  }) async {
    await Utils.firebaseFirestore
        .collection(Utils.transactionCollection)
        .add(data!);
  }

  void updateUser({
    String? id,
    Map<String, dynamic>? data,
  }) {
    Utils.firebaseFirestore
        .collection(Utils.usersCollection)
        .doc(id)
        .update(data!);
  }

  CollectionReference<Map<String, dynamic>> getUser() {
    return Utils.firebaseFirestore.collection(Utils.usersCollection);
  }

  CollectionReference<Map<String, dynamic>> getRequest() {
    return Utils.firebaseFirestore.collection(Utils.transactionCollection);
  }

  CollectionReference<Map<String, dynamic>> getTransaction() {
    return Utils.firebaseFirestore.collection(Utils.transactionCollection);
  }

  DocumentReference<Map<String, dynamic>> getUserIdFromMap(String idUser) {
    return Utils.firebaseFirestore
        .collection(Utils.usersCollection)
        .doc(idUser);
  }

  DocumentReference<UserModel> getUserByID(String idUser) {
    return Utils.firebaseFirestore
        .collection(Utils.usersCollection)
        .doc(idUser)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  DocumentReference<RequestModel> getRequestByID(String idRequest) {
    return Utils.firebaseFirestore
        .collection(Utils.transactionCollection)
        .doc(idRequest)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              RequestModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  DocumentReference<TransaksiModel> getTransactionByID(String idTransaksi) {
    return Utils.firebaseFirestore
        .collection(Utils.transactionCollection)
        .doc(idTransaksi)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              TransaksiModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }
}
