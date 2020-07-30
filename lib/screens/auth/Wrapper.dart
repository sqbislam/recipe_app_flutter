import 'package:beautiful_app/models/User.dart';
import 'package:beautiful_app/screens/auth/Authenticate.dart';
import 'package:beautiful_app/screens/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
