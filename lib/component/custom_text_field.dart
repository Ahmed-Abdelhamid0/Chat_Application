import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {
        this.labelText,
        this.onChanged,
        this.pass=false,
        required this.message,
      });
  // var emailController = TextEditingController();
  String? labelText;
  String? message;
  bool? pass;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass!,
      validator: (value)
      {
        if(value!.isEmpty)
          {
            return message;
          }
        else
        {
          return null;
        }
      },
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.white,
      ),
      // controller: emailController,
      // keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'email must not be empty';
      //   } else {
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
