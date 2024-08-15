import 'dart:async';

mixin ValidatorSignUp{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }
      else{
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 6){
        sink.add(password);
      }
      else{
        sink.addError('Password must be at least 6 characters');
      }
    }
  );

  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.length > 2){
        sink.add(name);
      }
      else{
        sink.addError('Name must be at least 3 characters');
      }
    }
  );

  final validatePhone = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink){
      if(phone.length == 11){
        sink.add(phone);
      }
      else{
        sink.addError('Phone number must be 11 characters');
      }
    }
  );

}