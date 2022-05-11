import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? firstName;
  final String? surName;
  final String? email;
  final String? role;
  final String? password;
  // final String? photo;

  const UserEntity(
      {this.uid,
      this.firstName,
      this.surName,
      this.email,
      this.role,
      this.password
      // this.photo,
      });

  // static const empty = User(id: '');

  // bool get isEmpty => this == User.empty;
  // bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [
        uid,
        firstName,
        surName,
        email,
        role,
        password,
      ];
}
