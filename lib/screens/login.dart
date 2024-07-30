
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.white,  
      body: Padding(
        padding: EdgeInsetsDirectional.all(8.0),
        child: SafeArea(
            child: Column(
            
          children: <Widget>[
            Center(
              widthFactor: 2.0,
              heightFactor: 5.0,
              child: Row(children: [Image.asset('assets/images/logo.png',
              width: 600,
              height: 300,
              
              )])
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Number Phone',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Number Phone';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Process data
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
          ],
        )),
      ),
    );
  }
}
