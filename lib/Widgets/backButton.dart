

import 'package:flutter/material.dart';

Widget backButton(Color color, BuildContext context){
  return IconButton(
      onPressed: ()=>Navigator.pop(context),
      icon: Icon(Icons.arrow_back, color: color, size: 28.0) );
}