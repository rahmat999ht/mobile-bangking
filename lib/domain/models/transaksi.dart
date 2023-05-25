// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobile_bangking/app/core/core.dart';

class TransaksiModel {
  final String? id;
  final DocumentReference? userLogin;
  final DocumentReference? toUser;
  final int amount;
  final Timestamp uploadDate;
  TransaksiModel({
    this.id,
    this.userLogin,
    this.toUser,
    required this.amount,
    required this.uploadDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userLogin': userLogin,
      'toUser': toUser,
      'amount': amount,
      'uploadDate': uploadDate,
    };
  }

  factory TransaksiModel.fromMapById(Map<String, dynamic> map, String id) {
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
    return TransaksiModel(
      id: id,
      userLogin: userLogin,
      toUser: toUser,
      amount: map['amount'] as int,
      uploadDate: map['uploadDate'] as Timestamp,
    );
  }

  factory TransaksiModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      TransaksiModel.fromMapById(
        snapshot.data() as Map<String, dynamic>,
        snapshot.id,
      );
}
