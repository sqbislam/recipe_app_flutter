import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key key,
    this.profileImage,
    this.email,
    this.name,
  }) : super(key: key);

  final String email, name, profileImage;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defaultSize * 24,
      child: Stack(
        children: <Widget>[
          ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: defaultSize * 15,
                color: kPrimaryColor,
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: defaultSize),
                    width: defaultSize * 14,
                    height: defaultSize * 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white, width: defaultSize * 0.8),
                      image: DecorationImage(
                          image: AssetImage(profileImage), fit: BoxFit.cover),
                    )),
                Text(name,
                    style: TextStyle(
                        color: kTextColor, fontSize: defaultSize * 1.8)),
                SizedBox(height: defaultSize / 2),
                Text(
                  email,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black54),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
