import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (text) {
                        email = text;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {
                        password = text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      // color: Colors.green,
                      onPressed: () {
                        if (email == 'psiu@gmail.com' && password == 'psiu') {
                          // print('correto');
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          print('errado');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Entrar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      // color: Colors.white,

                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Entrar sem conta',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.1)),
          _body(),
        ],
      ),
    );
  }
}
