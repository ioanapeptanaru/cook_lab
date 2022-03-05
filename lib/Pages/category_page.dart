import 'package:cook_lab/Cards/category_card.dart';
import 'package:cook_lab/Pages/template_page.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';

class CategoryPage extends TemplatePage {

  @override
  Widget getBody() {
    CardCategory _soup = CardCategory(
      image: const AssetImage('assets/images/soupdark.png'),
      text: ('Soups'),
    );

    CardCategory _dessert = CardCategory(
      image: const AssetImage('assets/images/dessert.png'),
      text: ('Desserts'),
    );

    CardCategory _salad = CardCategory(
      image: const AssetImage('assets/images/saladdark.png'),
      text: ('Salads'),
    );

    CardCategory _maindish = CardCategory(
      image: const AssetImage('assets/images/maindishdark.png'),
      text: ('Main Dish'),
    );

    CardCategory _sidedish = CardCategory(
      image: const AssetImage('assets/images/sidedishdark.png'),
      text: ('Side Dish'),
    );

    return  SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 30),
                _soup,
                const SizedBox(height: 30),
                _maindish,
                const SizedBox(height: 30),
                _sidedish,
                const SizedBox(height: 30),
                _salad,
                const SizedBox(height: 30),
                _dessert,
                const SizedBox(height: 18),

              ]),
        ));
  }
}
