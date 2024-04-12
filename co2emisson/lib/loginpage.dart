import "package:co2emisson/Homepage.dart";
import "package:co2emisson/signup.dart";

import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  static const routeName = "loginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome Back",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 70),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your login logic here
                        Navigator.of(context)
                            .popAndPushNamed(Homepage.routename);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Navigate to the signup page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signupPage()),
                          );
                        },
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate back
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
