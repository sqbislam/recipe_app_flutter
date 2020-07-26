import 'package:beautiful_app/components/MyBottomNavBar.dart';
import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/screens/profile/components/body.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: SizedBox(),
        title: Text("Profile"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.defaultSize * 1.6,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
