// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobile_bangking/app/core/core.dart';

class InitTransaksi {
  final String? id;
  final DocumentReference? userLogin;
  final DocumentReference? toUser;
  final int amount;
  final Timestamp uploadDate;
  final bool? isRequest;
  InitTransaksi({
    this.id,
    this.userLogin,
    this.toUser,
    required this.amount,
    required this.uploadDate,
    this.isRequest,
  });
}
