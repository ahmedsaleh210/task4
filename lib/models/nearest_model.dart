import 'package:localize_and_translate/localize_and_translate.dart';

class NearestModel{
  final String name;
  final String image;
  final String type;
  final double rate;
  final String deliveryPrice;
  final int deliveryTime;
  bool? special;

  NearestModel
      ({
    required this.name,
    required this.image,
    required this.type,
    required this.rate,
    required this.deliveryPrice,
    required this.deliveryTime,
    this.special,
  });
}
var lang = translator.activeLanguageCode;

List <NearestModel> nearestItems = [
  NearestModel(
    name: 'Bob Marley',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJoE5HYzZv7PcFL5gW74F1aIkAW-jGHGQSkg&usqp=CAU',
    deliveryTime: 15,
    rate: 3.0,
      deliveryPrice: 'free'.tr(),
      type: lang=='en'?'Grocery':'بقالة',
    special: true
  ),
  NearestModel(
    name: 'Produce',
    image: 'https://blogs.biomedcentral.com/bmcseriesblog/wp-content/uploads/sites/9/2017/01/supermarket.jpg',
    deliveryTime: 30,
    rate: 4.6,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
];