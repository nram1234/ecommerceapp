
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../widgets/list_item.dart';
import '../home_controller/home_controller.dart';


class AllList extends GetView<HomeController> {


  @override
  Widget build(BuildContext buildContext) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.ProductList.length,
        itemBuilder: (context, pos) {
          return ListItem(product: controller.ProductList[pos],);
        });
  }
}
