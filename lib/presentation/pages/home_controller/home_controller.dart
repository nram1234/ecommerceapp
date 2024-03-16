

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/apis.dart';
import '../../../network/models/productmodel.dart';
import '../tabs/all_list.dart';
import '../tabs/profile.dart';

class HomeController extends GetxController  {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  bool addMyStoreData = false;
  List<Productmodel>ProductList=[];
  Widget homeWidget = AllList();
int homeWidgetIndex=0;









updateHome(int i){
  homeWidgetIndex=i;

  switch (i) {
    case 0:
      {
        homeWidget = AllList();

        break;
      }
    case 1:
      {
        homeWidget =   Container();

        break;
      }
    case 2:
      {
        homeWidget = const Profile();
        break;
      }

  }
  update(["homeWidget"]);
}
  updatefavorite(int pos){
    ProductList[pos].isfavorite =!ProductList[pos].isfavorite;
    print("ProductList[pos].isfavorite ${ProductList[pos].isfavorite }");
    update(["productlist"]);
  }

  void fetchData() async {
    try {
       await Dio().get(APIs.baseUrl,).then((value) {
         print(value.data );

        // ProductList
       List item  =(value.data as List);
       for(int i=0;i<item.length;i++){
         ProductList.add(Productmodel.fromMap(item[i]));
       }




     update(["productlist"]);  });

    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  void signOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    updateHome(0);

  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingControllerName.dispose();
    textEditingControllerPhone.dispose();
  }
}