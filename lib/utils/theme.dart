



import 'package:flutter/material.dart';

class ThemesApp {
 
  static final light = ThemeData(
    primarySwatch: Colors.teal ,
    backgroundColor: Colors.white ,
    brightness: Brightness.light , 
  );

  static final dark = ThemeData(
    primarySwatch: Colors.pink ,
    backgroundColor: Colors.black ,
    brightness: Brightness.dark , 
  );

}