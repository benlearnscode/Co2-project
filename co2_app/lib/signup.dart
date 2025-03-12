import "package:flutter/material.dart";

class signupPage extends StatelessWidget {
   static const routeName = "SignupPage";
  const signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 23, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Add your sign up logic here
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate back
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
