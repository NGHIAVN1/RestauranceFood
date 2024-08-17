import 'package:flutter/widgets.dart';
import 'package:main/blocs/signup_bloc.dart';

class SignupProvider extends InheritedWidget {
  final SignUpBloc signUpBloc;
  const SignupProvider(
      {required Key key, required Widget child, required this.signUpBloc})
      : super(key: key, child: child);
  static SignupProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SignupProvider>()
        as SignupProvider);
  }
  @override
  bool updateShouldNotify(covariant SignupProvider oldWidget) =>
      oldWidget.signUpBloc != signUpBloc;
}
