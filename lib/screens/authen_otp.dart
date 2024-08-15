import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:main/blocs/authentication_bloc.dart';
import 'package:main/blocs/login_bloc.dart';
import 'package:main/blocs/login_bloc.dart';
import 'package:main/components/country_picker.dart';
import 'package:main/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:main/services/auth-service.dart';
import 'package:main/firebase_options.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  const OtpVerification({super.key, required this.verificationId});
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(AuthenticationService());
  }

  @override
  void dispose() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         
          Card(
            color: Colors.white,
            child: Container(
              height: 220,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Center(
                      child: Text('OTP Verification'),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          width: 250,
                          child: StreamBuilder(
                            initialData: '',
                            stream: _loginBloc.OtpCode,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (code) =>
                                  _loginBloc.changeOtpCode.add(code),
                              decoration: InputDecoration(
                                  // prefixIcon: Icon(_iconNation),
                                  // hintText: '000 000 000',
                                  prefixStyle: TextStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                          )),
                    ),
                    StreamBuilder(
                      initialData: '',
                      stream: _loginBloc.OtpCode,
                      builder: (BuildContext context, AsyncSnapshot snapshot) =>
                          Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.amber),
                        child: IconButton(
                            onPressed: () async {
                              try {
                                print(widget.verificationId);
                                print(snapshot.data);
                                await _loginBloc.verifyOtp(snapshot.data,
                                widget.verificationId);
                                await Navigator.push(context, (MaterialPageRoute(builder: (context) => HomePage())));

                              } on FirebaseException catch (e) {
                                print('Exception: ${e.toString()}');
                              }
                            },
                            icon: Icon(Icons.east)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  height: 36.0,
                  color: Color.fromARGB(36, 0, 0, 0),
                ),
              )),
              Text('OR'),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 10.0),
                child: const Divider(
                  height: 36.0,
                  color: Color.fromARGB(36, 0, 0, 0),
                ),
              )),
            ]),
          ),
          Center(
            child: Text(
              'Login with your social media account',
              selectionColor: Colors.blue,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Container(
                  width: 50,
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/google.jpeg',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 50,
                  child: Image.asset(
                    'assets/images/facebook.png',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 50,
                  child: Image.asset(
                    'assets/images/phone.png',
                  ),
                )
              ],
            ),
          ]),
          Center(
            child: Text(
              'You are not account! Sign in',
              selectionColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

 
}
