// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/models/products_model.dart';
import 'package:commerce_app/view/widgets/productDetails/clothes_info.dart';
import 'package:commerce_app/view/widgets/productDetails/image_slider.dart';
import 'package:commerce_app/view/widgets/productDetails/size_list.dart';
import 'package:commerce_app/view/widgets/productDetails/under_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductsModel? model;
  ProductDetailsScreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(imageUrl: model!.image!),
              ClothesInfo (model!) ,
              SizeList(),
              UnderItem( model: model!),
            ],
          ),
        ),
      ),
    );
  }
}
