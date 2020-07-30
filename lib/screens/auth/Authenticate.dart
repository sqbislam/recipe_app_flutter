import 'package:beautiful_app/screens/auth/AuthSignIn.dart';
import 'package:beautiful_app/screens/auth/RegisterForm.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return AuthSignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
