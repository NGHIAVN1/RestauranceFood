
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main/blocs/signup_bloc.dart';
import 'package:main/models/user.dart';
import 'package:main/services/firestore_db.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpBloc signUpBloc;
    
    @override
   void initState() {
      super.initState();
      signUpBloc = SignUpBloc(DbstroreService());
    }

    @override
    void dispose() {
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Sign Up'),
        ),

      body: Center(
        child: Card(
          child: Container(
            width: 500,
            height: 500,
            alignment: Alignment.center,
            child: Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                    
                    child: Text('Sign Up')),
                 ),
                StreamBuilder<String>(
                  initialData: '',
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changeEmail.add(value),
                          decoration: InputDecoration(
                            
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  initialData: '',
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                            width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changeName.add(value),
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  initialData: '',
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changePhone.add(value),
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  initialData: '',
                  stream: null,
                  builder: (context, snapshot) {

                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changeAddress.add(value),
                          decoration: InputDecoration(
                            hintText: 'Address',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  initialData: '',
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                          
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changePassword.add(value),
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                
                 StreamBuilder<String>(
                  initialData: '',
                   stream: null,
                   builder: (context, snapshot) {
                     return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => signUpBloc.changePassword.add(value),
                          decoration: const InputDecoration(
                            hintText: 'Repeat Password',
                          ),
                        ),
                      ),
                                     );
                   }
                 ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: StreamBuilder<Object>(
                      initialData: '',
                      stream: null,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        return ElevatedButton(
                          onPressed: () async{
                            try {
                             await signUpBloc.onSubmits(User(
                                email: 'dnghia1632001@gmail.com ',
                                fullName: 'Nghia Doan',
                                phoneNumber: '',
                                address: '',
                                password: '',
                                
                              ));
                              print('Sign Up');
                            } catch (e) {
                              print('Exception: ${e.toString()}');
                            }
                          }, 
                          child: Text('Sign Up'),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 207, 37, 37)),
                          ),
                          );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
      
    
  }
}
