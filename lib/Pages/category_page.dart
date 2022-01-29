import 'package:cook_lab/Cards/category_card.dart';
import 'package:cook_lab/Pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryPage extends TemplatePage {

  @override
  Widget getBody() {
    CardCategory _soup = CardCategory(
      image: AssetImage('assets/images/soupdark.png'),
      text: ('Soups'),
    );

    CardCategory _dessert = CardCategory(
      image: AssetImage('assets/images/dessert.png'),
      text: ('Desserts'),
    );

    CardCategory _salad = CardCategory(
      image: AssetImage('assets/images/saladdark.png'),
      text: ('Salads'),
    );

    CardCategory _maindish = CardCategory(
      image: AssetImage('assets/images/maindishdark.png'),
      text: ('Main Dish'),
    );

    CardCategory _sidedish = CardCategory(
      image: AssetImage('assets/images/sidedishdark.png'),
      text: ('Side Dish'),
    );

    return  SingleChildScrollView(
        child:
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 30),
                _soup,
                SizedBox(height: 30),
                _maindish,
                SizedBox(height: 30),
                _sidedish,
                SizedBox(height: 30),
                _salad,
                SizedBox(height: 30),
                _dessert,
                SizedBox(height: 18),

              ]),
        ));
  }
}
