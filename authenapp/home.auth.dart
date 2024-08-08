import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  void confirmStateUser() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User currently signed out');
      } else {
        print('User currently signed in');
      }
    });
    void confirmNumberPhoneOTP(String _numberPhone) {
      auth.verifyPhoneNumber(
          phoneNumber: _numberPhone,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resentToken) {
            String smsToken = '';
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsToken);
            auth.signInWithCredential(credential);
          },
          codeAutoRetrievalTimeout: (String verificationId) => {});
    }
  }
}