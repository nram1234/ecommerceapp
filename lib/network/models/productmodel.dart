class Productmodel {
  late int  id;
  late String  title;
  late  double  price;
  late  String  description;
  late String  category;
  late String image;
  late Rating  rating;
  bool isfavorite=false;


  Productmodel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
     required this.rating,
  });

    Productmodel.fromMap(Map<String, dynamic> map) {

      id= map['id'] ;
      title= map['title']  ;
      price=double.parse( map['price'].toString())    ;
      description= map['description'] ;
      category=map['category'] ;
      image=map['image']  ;
   rating= Rating.fromMap(map['rating']) ;

  }
}



class Rating {
  late  double  rate;
  late int count;

  Rating({required this.rate,required this.count});

    Rating.fromMap(Map<String, dynamic> map) {

      rate=double.parse( map['rate'].toString())  ;
      count= map['count']  ;

  }
}
