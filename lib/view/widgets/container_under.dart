

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  
  final String text ;
  final String textButton ; 
  final Function() onPressed ;

  ContainerUnder({
    required this.text ,
    required this.textButton ,
    required this.onPressed ,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity ,
      height: 80 ,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.teal : Colors.pinkAccent ,
        borderRadius: BorderRadius.only(
           topLeft: Radius.circular(10) , 
           topRight: Radius.circular(10) , 
         ) ,   
      ),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Text('${text}' ,style: TextStyle(color: Colors.white , fontSize: 15 ), ),
          TextButton(onPressed: onPressed, child: Text('${textButton}' , style: TextStyle(color:Colors.white ,fontSize:15  ), ) , ) ,
        ],
      ) ,
    );
  }
}