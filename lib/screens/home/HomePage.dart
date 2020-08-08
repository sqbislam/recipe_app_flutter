import 'package:beautiful_app/blocs/auth_blocs/authentication_bloc.dart';
import 'package:beautiful_app/components/MyBottomNavBar.dart';
import 'package:beautiful_app/screens/home/components/body.dart';
import 'package:beautiful_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../size_config.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String name;

  HomePage({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(_auth, context),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(AuthService _auth, BuildContext context) {
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
        Center(
            child: Text(
          'Welcome $name!',
          style: TextStyle(color: Colors.black),
        )),
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
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              AuthenticationLoggedOut(),
            );
          },
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }
}
