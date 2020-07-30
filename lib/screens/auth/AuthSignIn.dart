import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/services/auth.dart';
import 'package:beautiful_app/shared/loading.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';

class AuthSignIn extends StatefulWidget {
  final Function toggleView;

  const AuthSignIn({Key key, this.toggleView}) : super(key: key);

  @override
  _AuthSignInState createState() => _AuthSignInState();
}

class _AuthSignInState extends State<AuthSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // Text field State
  String email = '';
  String pass = '';
  String err = '';

  bool isEmail(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      child: Container(
          color: Colors.redAccent,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * 2,
              vertical: SizeConfig.defaultSize * 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("Register"),
                  color: Colors.white54,
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 5,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) =>
                      isEmail(val) ? 'Enter a valid email' : null,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                  onChanged: (val) {
                    setState(() {
                      pass = val;
                    });
                  },
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Enter a Password 6 character long'
                      : null,
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 1.5,
                ),
                loading
                    ? LoadingIndicator()
                    : FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic res = await _auth.signIn(email, pass);

                            if (res == null) {
                              setState(() {
                                loading = false;
                                err =
                                    "Could not sign in with those credentials.";
                              });
                            }
                          }
                        },
                        child: Text("Sign In"),
                        color: Colors.yellow[700],
                      ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  err,
                  style: TextStyle(color: Colors.red[800], fontSize: 18.0),
                )
              ],
            ),
          )),
    ));
  }
}
