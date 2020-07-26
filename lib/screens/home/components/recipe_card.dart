import 'package:beautiful_app/models/RecipeBundle.dart';
import 'package:beautiful_app/size_config.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function onPress;
  const RecipeCard({Key key, this.recipeBundle, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: recipeBundle.color,
            borderRadius: BorderRadius.circular(defaultSize * 2)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultSize * 0.7,
                    ),
                    Text(
                      recipeBundle.description,
                      style: TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultSize * 0.7,
                    ),
                    Spacer(),
                    buildInfoRow(defaultSize,
                        icon: Icons.info, text: "${recipeBundle.chefs} chefs"),
                    SizedBox(
                      height: defaultSize * 0.5,
                    ),
                    buildInfoRow(defaultSize,
                        icon: Icons.receipt,
                        text: "${recipeBundle.recipes} Recipes"),
                    Spacer()
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5),
            AspectRatio(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(defaultSize * 2),
                    bottomRight: Radius.circular(defaultSize * 2)),
                child: Image.asset(
                  recipeBundle.imageSrc,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
              aspectRatio: 0.85,
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {IconData icon, String text}) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: defaultSize,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
