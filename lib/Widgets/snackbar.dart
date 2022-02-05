import 'package:flutter/material.dart';

snackBar(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          title: Text(msg),
        );
      });
}
