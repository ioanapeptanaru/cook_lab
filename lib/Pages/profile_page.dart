// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cook_lab/Pages/template_page.dart';
import 'package:cook_lab/utils.dart';
import 'package:flutter/material.dart';

class ProfilePage extends TemplatePage {



  @override
  Widget getBody() {

    Text pageTitle =  Text(
        'My Profile',
        style: TextStyle(fontSize: 34),
    );

    return Stack(
        fit: StackFit.expand,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  pageTitle,
                  SizedBox(height: 22),
                  SizedBox(
                    height: 400,
                    child: _getLayoutBuilder()
                  ),
                ],
              )
          )
        ]
    );
  }

  Widget _getLayoutBuilder()
  {

    Text profileName = Text(
      'Emily Sanchez',
      style: TextStyle(fontSize: 37),
    );

    Text profileSavedRecipesTitle =  Text(
      'Saved recipes',
      style: TextStyle(fontSize: 20),
    );

    Text profileSavedRecipes = Text(
      '10',
      style: TextStyle(fontSize: 25),
    );

    Text profileTriedRecipesTitle = Text(
      'Tried recipes',
      style: TextStyle(fontSize: 20),
    );

    Text profileTriedRecipes = Text(
        '7',
        style: TextStyle(fontSize: 25)
    );

    BoxDecoration profileBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey,
    );

    BoxDecoration dividerDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.black12,
    );

    Padding profileRecipesDivider = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 8,
      ),
      child: Container(
        height: 80,
        width: 3,
        decoration: dividerDecoration,
      ),
    );

    Positioned profileIcon =  Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: CircleAvatar(
          backgroundImage:
          AssetImage('assets/images/chef.png'),
          radius: 80,
        ),
      ),
    );

    Column triedRecipesColumn = Column(
        children: [
          profileTriedRecipesTitle,
          profileSavedRecipes,
        ],
    );

    Column savedRecipesColumn = Column(
        children: [
          profileSavedRecipesTitle,
          profileSavedRecipes,
        ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        double innerHeight = constraints.maxHeight;
        double innerWidth = constraints.maxWidth;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: innerHeight * AppUtils.profilePageRatio,
                width: innerWidth,
                decoration: profileBoxDecoration,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    profileName,
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        savedRecipesColumn,
                        profileRecipesDivider,
                        triedRecipesColumn
                      ],
                    )
                  ],
                ),
              ),
            ),
            profileIcon,
          ],
        );
      },
    );
  }
}
