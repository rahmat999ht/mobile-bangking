// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../app/core/core.dart';

class RequestModel extends InitTransaksi {
  final String? descriptions;
  final bool? isComfir;
  RequestModel({
    super.id,
    super.userLogin,
    super.toUser,
    required super.amount,
    required super.uploadDate,
    super.isRequest,
    this.isComfir,
    this.descriptions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userLogin': userLogin,
      'toUser': toUser,
      'isRequest': true,
      'isComfir': false,
      'amount': amount,
      'uploadDate': uploadDate,
      'descriptions': descriptions,
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
      isRequest: map['isRequest'] != null ? map['isRequest'] as bool : null,
      isComfir: map['isComfir'] != null ? map['isComfir'] as bool : null,
      amount: map['amount'] as int,
      uploadDate: map['uploadDate'] as Timestamp,
      descriptions:
          map['descriptions'] != null ? map['descriptions'] as String : null,
    );
  }

  factory RequestModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      RequestModel.fromMapById(
        snapshot.data() as Map<String, dynamic>,
        snapshot.id,
      );
}
