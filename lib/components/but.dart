import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final String buttonText;
  final textColor;
  final butTapp;

  const Button(
      {Key key, this.color, this.textColor, this.buttonText, this.butTapp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: butTapp,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
