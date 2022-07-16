// ignore_for_file: use_key_in_widget_constructors, await_only_futures

import 'package:commerce_app/logic/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioIndex = 1;
  bool changeColor = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          name: 'Mina Atef',
          phone: '01222498614',
          typeOrder: 'Mina Shop',
          address: 'cairo , Egypt',
          color: changeColor ? Colors.grey.shade300 : Colors.white,
          value: 1,
          onChanged: (value) {
            setState(() {
              radioIndex = value;
              changeColor = true;
            });
          },
        ),
        const SizedBox(
          height: 30,
        ),
        GetBuilder<PayMentController>(
          builder: (controller) {
          return buildRadioContainer(
          name: 'Mina Atef',
          phone: '01222498614',
          typeOrder: 'Delivery',
          address: controller.address ,
          color: !changeColor ? Colors.grey.shade300 : Colors.white,
          value: 2,
          onChanged: (value) {
            setState(()  {
              radioIndex = value;
              changeColor = false;
              
            });
             controller.updateLocation();
          },
        );
        } ),
      ],
    );
  }

  Widget buildRadioContainer(
      {required Color color,
      required int value,
      required Function onChanged,
      required String phone,
      required String address,
      required String name,
      required String typeOrder}) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioIndex,
            onChanged: (value) {
              onChanged(value);
            },
            activeColor: Colors.deepOrange,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeOrder,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '🇪🇬+02',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
