//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardCategory extends StatefulWidget {

  ImageProvider image;
  String text;

  CardCategory({Key ? key,  required this.image, required this.text} ): super (key: key);

  @override
  _CardCategoryState createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {},
              child: Ink.image(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: widget.image,
                height: 180,
                fit: BoxFit.cover,
                child: Center(
                  child: Text(widget.text,
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            )));
  }
}