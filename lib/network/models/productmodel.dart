class Productmodel {
  int  id;
  String  title;
  double  price;
  String  description;
  String  category;
  String image;
  Rating  rating;


  Productmodel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Productmodel.fromMap(Map<String, dynamic> map) {
    return Productmodel(
      id: map['id']  ,
      title: map['title']  ,
      price: map['price'] ,
      description: map['description']  ,
      category: map['category'] ,
      image: map['image']  ,
      rating: map['rating']  ,
    );
  }
}



class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }


}
