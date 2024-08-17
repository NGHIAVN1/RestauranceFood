import 'dart:async';

import 'package:main/classes/validator_signup.dart';
import 'package:main/models/user.dart';
import 'package:main/services/authentication.dart';
import 'package:main/services/firestoredb_api.dart';

class SignUpBloc  {
  final DbApi _dbApi;
  SignUpBloc(this._dbApi);
 
   final StreamController<String> _emailController = StreamController<String>.broadcast();
   final StreamController<String> _passwordController = StreamController<String>.broadcast();
   final StreamController<String> _nameController = StreamController<String>.broadcast();
   final StreamController<String> _phoneController = StreamController<String>.broadcast();
   final StreamController<String> _addressController = StreamController<String>.broadcast();
 
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get addressStream => _addressController.stream;

  Sink<String> get changeEmail => _emailController.sink;
  Sink<String> get changePassword => _passwordController.sink;
  Sink<String> get changeName => _nameController.sink;
  Sink<String> get changePhone => _phoneController.sink;
  Sink <String> get changeAddress => _addressController.sink;
   
  Future<bool>  onSubmits(User user) async{
    if(_emailController.hasListener && _passwordController.hasListener && _nameController.hasListener && _phoneController.hasListener && _addressController.hasListener){
      await _dbApi.addUser(user);
      return true;
    }
    return false;
    
  }
  void dispose(){
    _emailController.close();
    _passwordController.close();
    _nameController.close();
    _phoneController.close();
    _addressController.close();
  }
  
}