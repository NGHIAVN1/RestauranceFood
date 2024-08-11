import 'dart:async';

mixin Validators {
  final validators = StreamTransformer<String, String>.fromHandlers(
    handleData: (phoneNumber, sink) => {
      if(phoneNumber.length < 11){
        sink.add(phoneNumber)
      }
      else if(phoneNumber.isEmpty){
        sink.addError('Phone Number not wrong')
      }},
  );
}
