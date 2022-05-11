import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';

abstract class AuthenticationRemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity userEntity);
  Future<void> signUp(UserEntity userEntity);
  Future<void> singOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity userEntity);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthenticationRemoteDataSourceImpl(
      {required this.auth, required this.firestore});

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async {
    final userCollectionRef = firestore.collection('users');
    final uid = await getCurrentUId();

    userCollectionRef.doc(uid).get().then((value) {
      final newUser = UserModel(
        uid: uid,
        firstName: userEntity.firstName,
        surName: userEntity.surName,
        email: userEntity.email,
        role: userEntity.role,
      ).toDocument();

      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }

      return;
    });
  }

  @override
  Future<void> signIn(UserEntity userEntity) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: userEntity.email!.toString(),
        password: userEntity.password!.toString(),
      );
    } on FirebaseAuthException catch (_) {
      return;
    }
  }

  @override
  Future<void> signUp(UserEntity userEntity) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: userEntity.email!.toString(),
        password: userEntity.password!.toString(),
      );
    } on FirebaseAuthException catch (_) {
      return;
    }
  }

  @override
  Future<void> singOut() async => auth.signOut();
}
