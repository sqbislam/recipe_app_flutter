import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/screens/profile/components/ProfileInfo.dart';
import 'package:beautiful_app/screens/profile/components/ProfileMenuItem.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ProfileInfo(
          name: "John Doe",
          email: "john_doe@gmail.com",
          profileImage: "assets/images/user.png",
        ),
        SizedBox(
          height: defaultSize * 2,
        ),
        ProfileMenuItem(
          icon: Icons.save,
          title: "Saved Items",
          onPress: () {},
        ),
        ProfileMenuItem(
          icon: Icons.card_giftcard,
          title: "Super Plan",
          onPress: () {},
        ),
        ProfileMenuItem(
          icon: Icons.language,
          title: "Change Language",
          onPress: () {},
        ),
        ProfileMenuItem(
          icon: Icons.help,
          title: "Help",
          onPress: () {},
        )
      ]),
    );
  }
}
