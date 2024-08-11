import 'dart:async';

import 'package:main/classes/validator.dart';
import 'package:main/services/authentication.dart';

class LoginBloc with Validators {
  final Authentication _authentication;
  // String _phoneNumber;
  // bool _validatePhoneNumber;

  LoginBloc(
    this._authentication,
  ) {
    // _startListenerPhoneNumberValid();
  }

  final StreamController<String> _phoneNumberController =
      StreamController<String>.broadcast();
  Sink<String> get phoneNumberChange => _phoneNumberController.sink;
  Stream<String> get phoneNumber =>
      _phoneNumberController.stream.transform(validators);

  // void _startListenerPhoneNumberValid() {
  //   phoneNumber.listen((phoneNumber) {
  //     _phoneNumber = phoneNumber;
  //     _validatePhoneNumber = true;
  //   }).onError((err) {
  //     _phoneNumber = '';
  //     _validatePhoneNumber = false;
  //   });
  // }

  Future<String> logIn(String _numberPhone) async {
    String _result = '';
    await _authentication.phoneNumberVerification(_numberPhone).then((user) {
      _result = 'Success';
    });
    return _result;
  }
}
