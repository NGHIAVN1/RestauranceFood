
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                        width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Address',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
      
                  child:  Container(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Repeat Password',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: (){}, child: Text('Sign Up'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 207, 37, 37)),
                      ),
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
