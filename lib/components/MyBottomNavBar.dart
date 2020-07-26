import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/models/NavItems.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
        builder: (context, navItems, child) => Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, -7),
                  blurRadius: 30,
                  color: Color(0x00FF8686).withOpacity(0.2)),
            ]),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    navItems.items.length,
                    (index) => _buildNavBarItem(
                        iconData: navItems.items[index].icon,
                        press: () {
                          navItems.changeNavIndex(index: index);

                          // Change route based on click
                          if (navItems.items[index].destinationChecker())
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        navItems.items[index].destination));
                        },
                        isActive:
                            navItems.selectedIndex == index ? true : false)),
              ),
            )));
  }

  IconButton _buildNavBarItem(
      {IconData iconData, Function press, bool isActive = false}) {
    return IconButton(
      icon: Icon(
        iconData,
        color: isActive ? kPrimaryColor : Color(0xFFD1D4D4),
        size: 22,
      ),
      onPressed: press,
    );
  }
}
