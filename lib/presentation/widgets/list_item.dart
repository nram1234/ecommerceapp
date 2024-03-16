import 'package:flutter/material.dart';

import '../../network/models/productmodel.dart';

import 'package:cached_network_image/cached_network_image.dart';
class ListItem extends StatelessWidget {
  Productmodel product;
  ListItem(
      {required this.product, });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8),

      color: Colors.transparent,
      child: InkWell(
        onTap: () {

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

                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}