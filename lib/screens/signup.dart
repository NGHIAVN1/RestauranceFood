
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main/blocs/signup_bloc.dart';
import 'package:main/services/firestore_db.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
   // ignore: no_leading_underscores_for_local_identifiers
   late SignUpBloc _signUpBloc;
    
    @override
    initState() {
      super.initState();
      _signUpBloc = SignUpBloc(DbstroreService());
    }

    @override
    void dispose() {
      super.initState();
    }
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
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changeEmail.add(value),
                          decoration: InputDecoration(
                            
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                            width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changeName.add(value),
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changePhone.add(value),
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  stream: null,
                  builder: (context, snapshot) {

                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changeAddress.add(value),
                          decoration: InputDecoration(
                            hintText: 'Address',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                StreamBuilder<String>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                          
                      child:  Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changePassword.add(value),
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    );
                  }
                ),
                
                 StreamBuilder<String>(
                   stream: null,
                   builder: (context, snapshot) {
                     return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _signUpBloc.changePassword.add(value),
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
                      stream: null,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        return ElevatedButton(
                          onPressed: () async{
                            await  _signUpBloc.onSubmits(snapshot.data);
                            print(snapshot.data);
                            print('Sign Up Successful');
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
