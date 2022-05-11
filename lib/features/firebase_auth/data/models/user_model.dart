import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? uid,
    final String? firstName,
    final String? surName,
    final String? email,
    final String? role,
    final String? password,
    // final String? photo;
  }) : super(
          uid: uid,
          firstName: firstName,
          surName: surName,
          email: email,
          role: role,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      uid: documentSnapshot.get('uid'),
      firstName: documentSnapshot.get('firstName'),
      surName: documentSnapshot.get('surName'),
      email: documentSnapshot.get('email'),
      role: documentSnapshot.get('role'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "firstName": firstName,
      "surName": surName,
      "email": email,
      "role": role,
    };
  }
}
