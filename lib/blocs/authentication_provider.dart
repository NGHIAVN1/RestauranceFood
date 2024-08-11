import 'package:flutter/widgets.dart';
import 'package:main/blocs/authentication_bloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;
  AuthenticationBlocProvider(
      {required Widget child,
      required Key key,
      required this.authenticationBloc})
      : super(child: child, key: key);
  @override
  bool updateShouldNotify(covariant AuthenticationBlocProvider oldWidget) =>
      AuthenticationBloc != oldWidget.authenticationBloc;

  static AuthenticationBlocProvider of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<AuthenticationBlocProvider>()
            as AuthenticationBlocProvider;
    return widget;
  }
}
