import 'package:localize_and_translate/localize_and_translate.dart';

class FreeDeliveryModel{
  final String name;
  final String image;
  final String type;
  final double rate;
  final String deliveryPrice;
  final int deliveryTime;
  bool? special;


  FreeDeliveryModel
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
List <FreeDeliveryModel> freeDeliveryItems = [
  FreeDeliveryModel(
    name: 'Dar El qamar',
    image: 'https://learnenglish.britishcouncil.org/sites/podcasts/files/RS4808_200464106-001-hig.jpg',
    deliveryTime: 50,
    rate: 3.0,
      deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Special Store':'متجر خاص',
    special: true
  ),
  FreeDeliveryModel(
    name: 'Bob Marley',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJoE5HYzZv7PcFL5gW74F1aIkAW-jGHGQSkg&usqp=CAU',
    deliveryTime: 37,
    rate: 3.0,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
  FreeDeliveryModel(
    name: 'Al Radwan Market',
    image: 'https://media.istockphoto.com/photos/shopping-basket-with-fresh-food-grocery-supermarket-food-and-eats-picture-id1216828053?k=20&m=1216828053&s=612x612&w=0&h=mMGSO8bG8aN0gP4wyXC17WDIcf9zcqIxBd-WZto-yeg=',
    deliveryTime: 45,
    rate: 4.4,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Grocery':'بقالة',
  ),
  FreeDeliveryModel(
    name: 'Pizza hut',
    image: 'https://s3.us-east-2.amazonaws.com/sie-development-production/events/thumbnails/000/000/020/original/pizza.jpeg?1598292721',
    deliveryTime: 25,
    rate: 4.6,
    deliveryPrice: 'free'.tr(),
    type: lang=='en'?'Restaurant':'مطعم',
    special: true,
  ),
];