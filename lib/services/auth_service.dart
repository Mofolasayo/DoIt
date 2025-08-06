import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/services/storage_service.dart';
import 'package:todo_app/util/extensions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _storageService = locator<StorageService>();
  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> saveUser(User? user) {
    return _storageService.setString("currentUserKey", currentUser.toString());
  }

  Future<void> clearUser() {
    return _storageService.clearData("currentUserKey");
  }

  Future<bool> checkAuthState() async {
    if (currentUser != null) {
      await saveUser(currentUser).tryCatch();
      return true;
    } else {
      await clearUser().tryCatch();
      return false;
    }
  }

  String? getUser() {
    return _storageService.getString("currentUserKey");
  }

  Future<void> updateDisplayName(String displayName) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updateDisplayName(displayName);

        await user.reload();
        await saveUser(_auth.currentUser);
      } catch (e) {
        throw Exception('Failed to update display name');
      }
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await saveUser(result.user);
      }
      return result;
    } on FirebaseAuthException catch (e) {
      String message = 'Sign in failed';
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled.';
          break;
        default:
          message = e.message ?? 'Sign in failed';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception('Sign in failed: ${e.toString()}');
    }
  }

  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await saveUser(result.user);

        await result.user!.updateDisplayName(displayName);
        await result.user!.reload();
      }
      return result;
    } on FirebaseAuthException catch (e) {
      String message = 'Registration failed';
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists for that email.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        default:
          message = e.message ?? 'Registration failed';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await clearUser().tryCatch();
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
