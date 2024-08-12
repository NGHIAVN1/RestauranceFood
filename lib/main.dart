import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/homepage.dart';
import 'package:main/theme/theme.dart';
import 'firebase_options.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const SwitchThemes()
      // MaterialApp(
      // title: "Home",
      // debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //     useMaterial3: true,
      // ),
      // home: HomePage(),
      //  )
      );
}
