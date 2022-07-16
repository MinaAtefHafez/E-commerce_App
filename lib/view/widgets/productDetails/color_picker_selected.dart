



// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ColorPickerSelected extends StatelessWidget {
  
    Color color ;
    ColorPickerSelected(this.color) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        alignment: Alignment.center,
        children: [
            Container(
          height: 35 ,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
          Container(
          height: 29 ,
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        ], 
      ),
    );
  }
}