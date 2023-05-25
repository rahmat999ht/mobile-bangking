// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../app/core/core.dart';

class RequestModel {
  final String? id;
  final DocumentReference? userLogin;
  final DocumentReference? toUser;
  final String descriptions;
  final int amount;
  final Timestamp uploadDate;
  RequestModel({
    this.id,
    this.userLogin,
    this.toUser,
    required this.descriptions,
    required this.amount,
    required this.uploadDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userLogin': userLogin,
      'toUser': toUser,
      'descriptions': descriptions,
      'amount': amount,
      'uploadDate': uploadDate,
    };
  }

  factory RequestModel.fromMapById(Map<String, dynamic> map, String id) {
    final dataUserLogin = map['userLogin'] as DocumentReference;
    DocumentReference<UserModel> userLogin = dataUserLogin.withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    final dataUser = map['toUser'] as DocumentReference;
    DocumentReference<UserModel> toUser = dataUser.withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return RequestModel(
      id: id,
      userLogin: userLogin,
      toUser: toUser,
      descriptions: map['descriptions'] as String,
      amount: map['amount'] as int,
      uploadDate: map['uploadDate'] as Timestamp,
    );
  }

  factory RequestModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      RequestModel.fromMapById(
        snapshot.data() as Map<String, dynamic>,
        snapshot.id,
      );
}
