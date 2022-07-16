// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:commerce_app/logic/controllers/setting_controller.dart';
import 'package:commerce_app/utils/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageItem extends StatefulWidget {
  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
      alignment: Alignment.center,
      child: Text(
        arabic,
        style:
            TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
      ),
      value: ar,
    ),
    DropdownMenuItem(
      alignment: Alignment.center,
      child: Text(
        english,
        style:
            TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
      ),
      value: en,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                controller.convert('L'),
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                iconSize: 25,
                alignment: Alignment.center,
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                items: items,
                value: isLangEn ? en : ar,
                onChanged: (value) {
                  setState(() {
                    if (value == 'en') {
                      isLangEn = true;
                      GetStorage().write('isEn', isLangEn);
                    } else {
                      isLangEn = false;
                      GetStorage().write('isEn', isLangEn);
                    }

                    controller.upDate();
                  });
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
