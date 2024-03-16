


class StoreModel  {

  final String storeName;

  final String phoneNumber;

  final String? whatsapp;

  final String? adrres;

  final double? lat;

  final double? long;

  final String storeId;

  final String? imageLink;

  final String category;

  final String arCategory;

  final int storelimit;
  final String? telegram;
  final String? facebook;
  final String? instagram;
  StoreModel(
      {required this.storeName,
      required this.storeId,
      required this.category,
      this.imageLink,
      required this.arCategory,
      required this.phoneNumber,
      this.storelimit = 5,
      this.adrres,
      this.lat,
      this.long,
      this.whatsapp,this.facebook,this.instagram,this.telegram});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(instagram:json['instagram'] ,telegram: json['telegram'],
      facebook:json['facebook'] ,
      arCategory: json['arCategory'],
      storeId: json['storeId'],
      category: json['category'],
      imageLink: json['imageLink'],
      storeName: json['storeName'],
      storelimit: json['storelimit'],
      phoneNumber: json['phoneNumber'],
      whatsapp: json['whatsapp'],
      adrres: json['adrres'],
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data["arCategory"] = arCategory;
    data["storelimit"] = storelimit;
    data['storeName'] = storeName;
    data['phoneNumber'] = phoneNumber;
    data['whatsapp'] = whatsapp;

    data['adrres'] = adrres;
    data['lat'] = lat;
    data['long'] = long;
    data['storeId'] = storeId;

    data['imageLink'] = imageLink;
    data['category'] = category;


    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['telegram'] = telegram;



    return data;
  }
}
