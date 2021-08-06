import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.text,
    this.iconButton,
    this.press,
    this.img,
  }) : super(key: key);

  final String text;
  final IconButton iconButton;
  final Image img;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => {},
            ),
            Text(text),
            img
          ],
        ),
      ),
    );
  }
}
