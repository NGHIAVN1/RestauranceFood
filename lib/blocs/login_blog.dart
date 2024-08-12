import 'dart:async';

import 'package:main/classes/validator.dart';
import 'package:main/services/authentication.dart';

class LoginBloc with Validators {
  final Authentication _authentication;
  late String _phoneNumber;
  late bool _validatePhoneNumber;
  final StreamController<String> _phoneNumberController =
      StreamController<String>.broadcast();

  LoginBloc(this._authentication) {
    _startListenerPhoneNumberValid();
  }
  Sink<String> get phoneNumberChange => _phoneNumberController.sink;
  Stream<String> get phoneNumber =>
      _phoneNumberController.stream.transform(validators);

  final StreamController<String> _otpCodeController =
      StreamController.broadcast();
  Sink<String> get changeOtpCode => _otpCodeController.sink;
  Stream<String> get OtpCode => _otpCodeController.stream;
  void _startListenerPhoneNumberValid() {
    phoneNumber.listen((phoneNumber) {
      _phoneNumber = phoneNumber;
      _validatePhoneNumber = true;
    }).onError((err) {
      _phoneNumber = '';
      _validatePhoneNumber = false;
    });
  }

  Future<void> logIn(String phone) async {
    await _authentication.phoneNumberVerification(phone);
  }
  Future<void> verifyOtp(String smsCode) async {
    await _authentication.verifyOTP(smsCode);
  }
}
