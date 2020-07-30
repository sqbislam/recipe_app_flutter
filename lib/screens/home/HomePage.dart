import 'package:beautiful_app/components/MyBottomNavBar.dart';
import 'package:beautiful_app/screens/home/components/body.dart';
import 'package:beautiful_app/services/auth.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class HomePage extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(_auth),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(AuthService _auth) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.list,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset(
        "assets/images/recipeBox.png",
        width: 80,
        height: 80,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.2,
        ),
        IconButton(
          icon: Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }
}
