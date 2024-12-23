import 'package:flutter/material.dart';
import 'package:visitors_app/pages/viewv.dart'; // Assuming Viewv is the next screen for admin after login

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passcodeController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff63E5C5), Color(0xff14366F)],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'DIGILOG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Administration login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white38,
                ),
                height: 600,width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 60.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      TextField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          labelText: "USER ID",
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passcodeController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3D4D55),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _handleLogin,
                          child: Text("LOGIN"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    String username = _userIdController.text;
    String password = _passcodeController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both username and password';
      });
      return;
    }

    if (username == 'admin' && password == '12345') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Viewv()), // Navigate to Viewv page
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }
}
