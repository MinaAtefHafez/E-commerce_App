// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter/material.dart';

class PayMentMethodWidget extends StatefulWidget {
  @override
  State<PayMentMethodWidget> createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  int radioIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildRadioPayMent(
            textName: 'Paypal',
            image: 'assets/images/paypal.png',
            value: 1 ,
            scale:0.7 ,
            onChanged: (value) {
              setState(() {
                radioIndex = value ;
              });
            }    
          ),
          const SizedBox(height: 15 ,),
          buildRadioPayMent(
            textName: 'Credit',
            image: 'assets/images/credit.png',
            value: 2 ,
            scale:0.7 ,
            onChanged: (value) {
              setState(() {
                radioIndex = value ;
              });
            }    
          ),

          const SizedBox(height: 15 ,),
          buildRadioPayMent(
            textName: 'Google Pay',
            image: 'assets/images/google.png',
            value: 3 ,
            scale:0.8 ,
            onChanged: (value) {
              setState(() {
                radioIndex = value ;
              });
            }    
          ),
          
        ],
      ),
    );
  }

  Widget buildRadioPayMent(
      {required String image,
      required double scale,
      required String textName,
      required int value,
      required Function onChanged}) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                textName,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Radio(
              value: value,
              groupValue: radioIndex,
              activeColor: Colors.deepPurple,
              onChanged: (value) {
                onChanged(value);
              }),
        ],
      ),
    );
  }
}
