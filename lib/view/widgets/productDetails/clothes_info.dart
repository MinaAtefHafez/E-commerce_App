// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ProductsModel model;
  ClothesInfo(this.model);

  var controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  model.title!,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              GetBuilder<ProductsController>(builder: (controller) {
                return InkWell(
                    onTap: () {
                      controller.isFavorite(productId: model.id!, model: model);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: controller.isItemInFavorite(model.id!)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  );
              } ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                model.rating!.rate.toString(),
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                direction: Axis.horizontal,
                itemPadding: const EdgeInsets.all(5),
                itemSize: 20,
                rating: model.rating!.rate!,
                itemCount: 5,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            model.description!,
            trimLines: 3,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              height: 2,
            ),
            moreStyle: TextStyle(
              color: Get.isDarkMode ? Colors.pink : Colors.teal,
              fontWeight: FontWeight.bold ,
            ),
            lessStyle: TextStyle(
              color: Get.isDarkMode ? Colors.pink : Colors.teal,
              fontWeight: FontWeight.bold ,
            ),
            colorClickableText: Get.isDarkMode ? Colors.pink : Colors.teal,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
          ),
        ],
      ),
    );
  }
}
