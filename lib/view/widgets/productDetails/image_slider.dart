// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/view/widgets/productDetails/color_picker.dart';
import 'package:commerce_app/view/widgets/productDetails/color_picker_selected.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  String imageUrl;
  ImageSlider({required this.imageUrl});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var cartController = Get.find<CartController>();
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int currentColor = 0;
  List<Color> colors = [
    Colors.red,
    Colors.grey,
    Colors.pink,
    Colors.deepPurple,
    Colors.teal,
    Colors.lightGreen,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: 3,
            options: CarouselOptions(
              autoPlay: true,
              height: 500,
              autoPlayInterval: const Duration(seconds: 2),
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? Colors.pink : Colors.teal,
              dotColor: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: currentColor == index
                      ? ColorPickerSelected(colors[index])
                      : ColorPicker(colors[index]),
                );
              },
              itemCount: colors.length,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.pink
                          : Colors.teal.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Obx(() {
                  return Badge(
                    position: BadgePosition.topEnd(top: -13, end: -13),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.cartList.isNotEmpty
                          ? cartController.totalItems.toString()
                          : 0.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      child:  Icon(Icons.shopping_cart ,  color: Get.isDarkMode ? Colors.pink : Colors.teal , size: 30, ) ,
                    ),
                  );
                }),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
