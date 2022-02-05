import 'package:flutter/material.dart';

Widget inputWidget(TextEditingController ctrl, String hint, bool obscure, TextInputType keyboard){

  return Container(
    margin: EdgeInsets.only(top:10.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(40.0)
    ),
    child: TextField(
      controller: ctrl,
      obscureText: obscure,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}