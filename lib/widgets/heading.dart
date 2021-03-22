import 'package:flutter/material.dart';

class Heading extends StatelessWidget {

  final String text;
  final double size;
  final double margin;

  Heading({ Key key, this.text = 'Default', this.size = 14, this.margin = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(margin),
      child: Text(
        text,
        key: key,
        textDirection: TextDirection.ltr, 
        style: TextStyle(
            fontSize: size,
          ),
        textAlign: TextAlign.center,
        ),
    );
  }
}