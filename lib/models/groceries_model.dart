import 'package:localize_and_translate/localize_and_translate.dart';

class GroceriesModel{
  final String name;
  final String image;
  final String type;
  final double rate;
  final String deliveryPrice;
  final int deliveryTime;
  bool? special;

  GroceriesModel
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

List <GroceriesModel> gorceryItems = [
  GroceriesModel(
    name: translator.activeLanguageCode=='en'?'Bob Marley':'بوب مارلي',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJoE5HYzZv7PcFL5gW74F1aIkAW-jGHGQSkg&usqp=CAU',
    deliveryTime: 15,
    rate: 3.0,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
    special: true,
  ),
  GroceriesModel(
    name: 'Produce',
    image: 'https://blogs.biomedcentral.com/bmcseriesblog/wp-content/uploads/sites/9/2017/01/supermarket.jpg',
    deliveryTime: 30,
    rate: 4.6,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
  GroceriesModel(
    name: 'Radwan Market',
    image: 'https://media.istockphoto.com/photos/shopping-basket-with-fresh-food-grocery-supermarket-food-and-eats-picture-id1216828053?k=20&m=1216828053&s=612x612&w=0&h=mMGSO8bG8aN0gP4wyXC17WDIcf9zcqIxBd-WZto-yeg=',
    deliveryTime: 50,
    rate: 4.4,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
  GroceriesModel(
    name: 'wust el bald',
    image: 'https://3u8dbs16f2emlqxkbc8tbvgf-wpengine.netdna-ssl.com/wp-content/uploads/2019/12/nrd-D6Tu_L3chLE-unsplash-scaled.jpg',
    deliveryTime: 25,
    rate: 3.6,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
];