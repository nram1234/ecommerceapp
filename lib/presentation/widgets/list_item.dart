import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../network/models/productmodel.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../pages/details_screen/detailes_screen.dart';
class ListItem extends StatelessWidget {
  Productmodel product;
  final VoidCallback favorite;

  ListItem(
      {required this.product, required this.favorite });

  @override
  Widget build(BuildContext context) {
    return  Container( height: 150,width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),

      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(DetailsScreen(product:product ,));
        },
        child: Card(
            elevation: 5,
            child: Row(
              children: [
                Expanded(
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                          10),
                      child: CachedNetworkImage(
                        imageUrl:
                        product.image,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context,
                            url,
                            downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress
                                    .progress),
                        errorWidget: (context,
                            url, error) =>
                        const Icon(
                            Icons.error),
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround,
                    children: [
                      Text(
                          product.title,
                          overflow:
                          TextOverflow
                              .clip,
                          maxLines: 1),
                      Text(
                          "${"price"} : ${product.price}",
                          overflow:
                          TextOverflow
                              .clip,
                          maxLines: 1),
                      Row(
                        children: [
                          FittedBox(
                            child: RatingBar.builder(itemSize: 15,
                              initialRating: product.rating.rate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal:0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,size: 10,
                              ),
                              onRatingUpdate: (rating) {

                              },
                            ),
                          ),const Spacer(), Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(onPressed: favorite, icon: Icon(product.isfavorite?Icons.favorite:Icons.favorite_border)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}