import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../network/models/productmodel.dart';




class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.product});

final  Productmodel product;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(product.title), centerTitle: true),
      body: Scaffold(
        body:  Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl:  product.image,
                fit: BoxFit.fill,
                height: size.height * .3,
                width: double.infinity,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                        value: downloadProgress.progress),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            Positioned(
              top: size.height * .27,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: size.height * .7,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(product.title,
                        //     style: const TextStyle(fontSize: 24),
                        //     textAlign: TextAlign.center),
                    Text(
                        "${"price".tr} : ${product.price}",
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: product.rating.rate,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {

                          },
                        ),const Spacer(), Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              product.rating.count.toString(),
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Text("description".tr),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black12, width: 1)),
                            child: SelectableText(
                                 product.description,
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.start),
                          ),
                        ),

                      ]),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
