import 'package:beautiful_app/screens/home/HomePage.dart';
import 'package:beautiful_app/components/RandomWords.dart';
import 'package:beautiful_app/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

class NavItem {
  final int id;
  final IconData icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: Icons.home,
      destination: HomePage(),
    ),
    NavItem(
      id: 2,
      icon: Icons.list,
      destination: RandomWords(),
    ),
    NavItem(
      id: 3,
      icon: Icons.camera,
    ),
    NavItem(
      id: 4,
      icon: Icons.cake,
    ),
    NavItem(id: 5, icon: Icons.person, destination: ProfileScreen()),
  ];
}
