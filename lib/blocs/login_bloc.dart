import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main/classes/validator.dart';
import 'package:main/services/authentication.dart';

class LoginBloc with Validators {
  final Authentication _authentication;
  late String _phoneNumber;
  late bool _validatePhoneNumber;

    LoginBloc(this._authentication) {
    _startListenerPhoneNumberValid();
  }

  final StreamController<String> _phoneNumberController = StreamController<String>.broadcast();
  Sink<String> get phoneNumberChange => _phoneNumberController.sink;
  Stream<String> get phoneNumber =>_phoneNumberController.stream.transform(validators);

  final StreamController<String> _otpCodeController =StreamController.broadcast();
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

  Future<void> logIn(String phone, Function(String) uidCallBack) async {
    await _authentication.signInWithPhoneNumber(phone, uidCallBack );
  }

  Future<void> verifyOtp(String smsCode, String _verificationId) async {
    await _authentication.verifyOTP(smsCode: smsCode, token: _verificationId);
  }

  Future<String> currentUser() async {
    return await _authentication.currentUser();
  }

  Future<void> signOut() async {
    await _authentication.signout();
  }
  
  void dispose() {
    _phoneNumberController.close();
    _otpCodeController.close();
  }
}
