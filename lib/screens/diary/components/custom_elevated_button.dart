import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Size mediaSize;
  final String text;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key key,
    @required this.mediaSize,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 30.0;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.all(0.0),
      ),
      child: Ink(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa9d6c2), Color(0xff36a9b0)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MontserratRegular',
              fontSize: mediaSize.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
