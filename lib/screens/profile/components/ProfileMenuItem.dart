import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.icon,
    this.title,
    this.onPress,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: defaultSize * 3,
            ),
            Text(
              title,
              style: TextStyle(
                  color: kTextLigntColor, fontSize: defaultSize * 1.8),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              size: defaultSize * 4,
            )
          ],
        ),
      ),
    );
  }
}
