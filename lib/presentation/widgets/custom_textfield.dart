import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {required this.textEditingController,this.maxLine=1,
      this.labelStyleFontSize = 16,
      this.labelColor = Colors.black,
      this.obscureText = false,
      this.radius = 20,
      this.textInputType = TextInputType.text,
      this.validator,
      required this.labelText,
      this.color,
      Key? key})
      : super(key: key);
  final String labelText;
  TextEditingController textEditingController;
  Color? color;
  double radius;
  final TextInputType textInputType;
  String? Function(String?)? validator;
  double labelStyleFontSize;
  Color labelColor;
  bool obscureText;
final int maxLine;
  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: color ?? Colors.grey,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: color ?? Colors.grey,
          width: 3,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(maxLines:maxLine ,textAlign: TextAlign.start,
        obscureText: obscureText,
        controller: textEditingController,
        validator: validator,
        keyboardType: textInputType,
        style: TextStyle(
            color: Colors.black, backgroundColor: Colors.white.withOpacity(.8),fontWeight: FontWeight.bold,fontSize: 18),
        decoration: InputDecoration(
        label: Text(labelText,style: TextStyle(color:labelColor ,fontSize: 18,fontWeight: FontWeight.bold)),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: labelStyleFontSize,
              color: labelColor),
          border: myinputborder(),
          //normal border
          enabledBorder: myinputborder(),
          //enabled border
          focusedBorder: myfocusborder(), //focused border
          // set more border style like disabledBorder
        ));
  }
}
