import 'package:beautiful_app/models/RecipeBundle.dart';
import 'package:beautiful_app/screens/home/components/categories.dart';
import 'package:beautiful_app/screens/home/components/recipe_card.dart';
import 'package:beautiful_app/size_config.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLandscape = SizeConfig.orientation == Orientation.landscape;
    return SafeArea(
      child: Column(
        children: <Widget>[
          CategoryList(),
          Expanded(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
            child: GridView.builder(
              itemCount: recipeBundles.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      isLandscape ? SizeConfig.defaultSize * 2 : 0,
                  childAspectRatio: 1.65),
              itemBuilder: (context, index) => RecipeCard(
                recipeBundle: recipeBundles[index],
                onPress: () {},
              ),
            ),
          ))
        ],
      ),
    );
  }
}
