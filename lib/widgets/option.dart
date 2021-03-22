import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final Function _selectHandler;
  final String text;

  Option(this._selectHandler, {Key key, this.text = "default"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      width: double.infinity,
      child: ElevatedButton (
        key: ValueKey('option'),
        child: Text(text),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
        onPressed: _selectHandler,
      )
    );
  }
}