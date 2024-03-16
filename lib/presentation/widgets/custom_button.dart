import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onClick;
  String title;
  Color titleColor;
  Color buttonColor;
  double height;
  double width;
  double borderRadius;
  double fontSize;
  FontWeight fontWeight;
  Color borderColor;
  Color colorBoxShadow;
  Offset? offset;
  double? spreadRadius;
  double? blurRadius;

  CustomButton(
      {super.key, required this.onClick,
      this.offset,
      this.blurRadius,
      this.spreadRadius,
      this.colorBoxShadow = Colors.transparent,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12,
      this.borderRadius = 25,
      required this.title,
      this.titleColor = Colors.white,
      required this.buttonColor,
      this.height = 30,
      required this.width,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                  color: colorBoxShadow,
                  offset: offset ?? const Offset(0, 0),
                  spreadRadius: spreadRadius ?? 0,
                  blurRadius: borderRadius)
            ],
            borderRadius: BorderRadius.circular(borderRadius),
            color: buttonColor),
        width: width,
        height: height,
        child: Center(
            child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
                color: titleColor, fontSize: fontSize, fontWeight: fontWeight),
          ),
        )),
      ),
    );
  }
}
