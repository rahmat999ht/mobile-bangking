// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobile_bangking/app/core/core.dart';

class UserModel {
  final String id;
  final String? image;
  final String? fName;
  final String? lName;
  final String? status;
  final String? typeBank;
  final int? noRek;
  final int? savings;

  UserModel({
    required this.id,
    this.image,
    required this.fName,
    required this.lName,
    required this.status,
    required this.typeBank,
    required this.noRek,
    required this.savings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'fName': fName,
      'lName': lName,
      'status': status,
      'typeBank': typeBank,
      'noRek': noRek,
      'savings': savings,
    };
  }

  factory UserModel.fromMapById(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      image: map['image'] != null ? map['image'] as String : null,
      fName: map['fName'] != null ? map['fName'] as String : null,
      lName: map['lName'] != null ? map['lName'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      typeBank: map['typeBank'] != null ? map['typeBank'] as String : null,
      noRek: map['noRek'] != null ? map['noRek'] as int : null,
      savings: map['savings'] != null ? map['savings'] as int : null,
    );
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      UserModel.fromMapById(
        snapshot.data() as Map<String, dynamic>,
        snapshot.id,
      );
}
