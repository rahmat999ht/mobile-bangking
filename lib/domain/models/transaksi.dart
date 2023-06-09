// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobile_bangking/app/core/core.dart';

class TransaksiModel extends InitTransaksi {
  TransaksiModel({
    super.id,
    super.userLogin,
    super.toUser,
    super.isRequest,
    required super.amount,
    required super.uploadDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userLogin': userLogin,
      'toUser': toUser,
      'isRequest': false,
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
      isRequest: map['isRequest'] != null ? map['isRequest'] as bool : null,
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
