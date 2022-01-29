// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cook_lab/Pages/template_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends TemplatePage {
  @override
  Widget getBody() {
    return Stack(fit: StackFit.expand, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
          child: Column(
            children: [
              Text(
                'My Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 400,
                child: LayoutBuilder(
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
                            height: innerHeight * 0.72,
                            width: innerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'Emily Sanchez',
                                  style: TextStyle(
                                    fontSize: 37,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Saved recipes',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                        vertical: 8,
                                      ),
                                      child: Container(
                                        height: 80,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Tried recipes',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '7',
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ))
    ]);
  }
}
