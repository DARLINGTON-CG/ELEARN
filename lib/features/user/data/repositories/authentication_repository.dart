import 'package:e_learn/features/user/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class LogInWithGoogleFailure implements Exception {}

class LogOutFailure implements Exception {}

class ResetPasswordFailure implements Exception {}

class AuthenticationRepository {
  final FirebaseAuth? firebaseAuth;
  AuthenticationRepository({required this.firebaseAuth});

  Stream<UserModel> get user {
    return firebaseAuth!.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null
          ? UserModel.empty
          : UserModel(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName,
            );
      return user;
    });
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth!
          .createUserWithEmailAndPassword(email: email, password: password);
    } on Exception {
      throw SignupFailure();
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth!.sendPasswordResetEmail(email: email);
    } on Exception {
      throw ResetPasswordFailure();
    }
  }

  Future<void> confirmPasswordReset({required String code,required newPassword}) async
  {
     try {
      await firebaseAuth!.confirmPasswordReset(code: code, newPassword: newPassword);
    } on Exception {
      throw ResetPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        firebaseAuth!.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}
