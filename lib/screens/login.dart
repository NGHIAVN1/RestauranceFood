import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:main/blocs/authentication_bloc.dart';
import 'package:main/blocs/login_blog.dart';
import 'package:main/blocs/login_blog.dart';
import 'package:main/components/country_picker.dart';
import 'package:main/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:main/services/auth-service.dart';

import '../blocs/login_blog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
     _loginBloc = LoginBloc(AuthenticationService());
  }

  String _selectedPhoneCode = '';
  String _iconNation = '';

  void displayFlagEmoji() {
    _iconNation.isNotEmpty ? 'sssss' : 'Countries';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                'assets/images/logo.jpg',
                height: 300,
              ))
            ],
          ),

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
                      child: Text('Your phone number'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => PhoneNumberOptions(context: context),
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(
                              Size.fromWidth(250),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 200, 255, 202)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Text(
                                  ' ${_iconNation.isNotEmpty ? 'Country $_iconNation' : 'Countries'}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  width: 100,
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_circle_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          width: 250,
                          child: StreamBuilder(
                            stream: _loginBloc.phoneNumber,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (phonenumber)=>_loginBloc.phoneNumberChange.add(phonenumber),
                              decoration: InputDecoration(
                                  // prefixIcon: Icon(_iconNation),

                                  prefixText: _selectedPhoneCode.isNotEmpty
                                      ? '+($_selectedPhoneCode)'
                                      : '',
                                  hintText: '000 000 000',
                                  prefixStyle: TextStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                          )),
                    ),
                    StreamBuilder(
                      stream: null,
                      builder: (BuildContext context, AsyncSnapshot snapshot) =>
                          Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.amber),
                        child: IconButton(
                            onPressed: () => {},
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

          //  Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //       Row(
          //       children: [
          //          Container(
          //             width: 50,
          //             child: Image.asset('assets/images/google.jpeg',
          //             ),
          //           ),
          //            Container(
          //             width: 50,
          //             child: Image.asset('assets/images/facebook.png',
          //             ),
          //           ),
          //            Container(
          //             width: 50,
          //             child: Image.asset('assets/images/phone.png',
          //             ),
          //           )
          //       ],
          //     )
          //   ],)
          //  Center(
          //         child: Container(
          //           child:  ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: [
          //           Container(
          //             width: 50,
          //             child: Image.asset('assets/images/google.jpeg',
          //             ),
          //           ),
          //            Container(
          //             width: 50,
          //             child: Image.asset('assets/images/facebook.png',
          //             ),
          //           ),
          //            Container(
          //             width: 50,
          //             child: Image.asset('assets/images/phone.png',
          //             ),
          //           )
          //         ]
          //       ),
          //         )
          //        ,)
        ],
      ),
    );
  }

  void PhoneNumberOptions({required BuildContext context}) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      exclude: <String>['KN', 'MF'],
      onSelect: (Country country) {
        setState(() {
          _selectedPhoneCode = country.phoneCode;
          _iconNation = country.flagEmoji;
        });
        print(
            'Selected country: ${country.displayName} (+${country.phoneCode})');
      },
      countryListTheme: const CountryListThemeData(
        flagSize: 25,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(221, 201, 195, 195),
            ),
          ),
        ),
        searchTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
