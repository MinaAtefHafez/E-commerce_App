// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XLL'];
  int currentSize = 0; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      alignment: Alignment.center,
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell( 
              onTap: () {
                setState(() {
                  currentSize = index ;
                });
              } ,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  currentSize == index ? Get.isDarkMode ? Colors.pink.shade300 :  Colors.teal.shade300 :Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade500)),
                child: Text(
                  sizes[index] ,
                  style:
                      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
        itemCount: sizes.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
