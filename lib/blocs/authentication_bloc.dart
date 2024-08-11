import 'package:main/services/auth-service.dart';
import 'dart:async';

class AuthenticationBloc {
  late AuthenticationService authenticationService;
  final StreamController<String> _authentificationController =
      StreamController<String>();
  Sink<String> get addUser => _authentificationController.sink;
  Stream<String> get user => _authentificationController.stream;

  final StreamController<bool> _logoutController = StreamController<bool>();
  Sink<bool> get logoutUser => _logoutController.sink;
  Stream<bool> get listlogoutUser => _logoutController.stream;

  AuthenticationBloc(this.authenticationService) {
    void onAuthChanged() {
      authenticationService.getFirebaseAuth()
      .authStateChanges()
      .listen((user) {
        final uid = user != null ? user.uid : null;
        addUser.add(uid!);
      });

      _logoutController.stream.listen((logout) {
        if (logout == true) {
          _signOut();
        }
      });
    }

    ;
  }
  void dispose() {
    _logoutController.close();
    _authentificationController.close();
  }

  _signOut() {
    _logoutController.close();
  }
}
