
import 'package:flutter/material.dart';

showMessage(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(message),
  )));

}