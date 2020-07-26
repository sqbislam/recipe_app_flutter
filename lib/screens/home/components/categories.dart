// Category Stateful Widget
import 'package:beautiful_app/constants.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> categories = [
    "All",
    "Indian",
    "Chinese",
    "Arabian",
    "Mexican",
    "Bengali",
    "Thai",
    "Continental",
    "Lebanese",
    "Turkish",
    "Japanese"
  ];
  // Default first one selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
          height: SizeConfig.defaultSize * 3.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => _buildCategory(index),
          )),
    );
  }

  Widget _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize * 2,
            vertical: SizeConfig.defaultSize * 0.5),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Color(0xFFF3BFBF) : Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
              color: selectedIndex == index ? kPrimaryColor : Color(0xFFFCDBD7),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
