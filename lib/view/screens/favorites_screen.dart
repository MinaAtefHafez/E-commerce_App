// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (controller){ 
       if (controller.favorites.isNotEmpty ) {
          return Container(
            alignment: Alignment.center,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        buildFavoriteItem(controller.favorites[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: controller.favorites.length),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: Text(
              ' No Favorite Items here  !',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          );
        }
    } );
  }

  Widget buildFavoriteItem(ProductsModel model) {
    return Row(
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            model.image!,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                model.title!,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 15,
              ),
              Text('\$ ${model.price}'),
            ],
          ),
        ),
        GetBuilder<ProductsController>(builder: (productController){
          return IconButton(
          onPressed: () {
            productController.removeFromFavorites(model);
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        );
        }),
      ],
    );
  }
}
