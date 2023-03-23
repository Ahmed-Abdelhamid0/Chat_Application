import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  CustomButton({this.onTap,required this.text});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity,
        height: 40.0,
        child:Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ) ,
      ),
    );
  }
}
