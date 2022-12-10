import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ManageSession{
  // Login with email and password
  /// It takes in an email and password and returns a UserCredential object.
  ///
  /// Args:
  ///   email (String): The email address of the user.
  ///   password (String): The user's password.
  ///
  /// Returns:
  ///   A future of type UserCredential.
  static Future<UserCredential> signInWithEmailPassword(String email, String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }on FirebaseAuthException catch(e){
      //show toast
      return Future.error(e.code);
    }
  }

  /// It signs in the user with Google.
  ///
  /// Returns:
  ///   A UserCredential object.
  static Future<UserCredential> signInWithGoogle() async{
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }on FirebaseAuthException catch(e){
      return Future.error(e.code);
    }
  }

  // Sign in with Facebook
  /// It signs in the user with Facebook.
  ///
  /// Returns:
  ///   A Future<UserCredential>
  static Future<UserCredential> signInWithFacebook() async{
    try{
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }on FirebaseAuthException catch(e){
      return Future.error(e);
    }
  }

  /// `createUserWithEmailPassword` creates a new user with the given email and
  /// password
  ///
  /// Args:
  ///   email (String): The email address of the user to create.
  ///   password (String): The user's password.
  ///
  /// Returns:
  ///   A Future<UserCredential>
  static Future<UserCredential> createUserWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }
}