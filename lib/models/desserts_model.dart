import 'package:localize_and_translate/localize_and_translate.dart';

class DessertsModel{
  final String name;
  final String image;
  final double rate;
  final String deliveryPrice;
  final int deliveryTime;
  bool? special;

  DessertsModel
      ({
    required this.name,
    required this.image,
    required this.rate,
    required this.deliveryPrice,
    required this.deliveryTime,
    this.special,
  });
}
var lang = translator.activeLanguageCode;
List <DessertsModel> dessertItems = [
  DessertsModel(
    name: 'Donuts',
    image: 'http://cairopulse.net/wp-content/uploads/2021/06/colorful_donuts_democracy_1050x700.jpg',
    deliveryTime: 39,
    rate: 3.0,
    deliveryPrice: 'free'.tr(),
  ),
  DessertsModel(
    name: 'Nola',
    image: 'https://assets.cairo360.com/app/uploads/2019/12/Nola-123-1.jpg',
    deliveryTime: 30,
    rate: 4.6,
    deliveryPrice: 'free'.tr(),
  ),
  DessertsModel(
    name: 'Cake Shop',
    image: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk',
    deliveryTime: 50,
    rate: 4.4,
    deliveryPrice: 'free'.tr(),
  ),
  DessertsModel(
    name: 'Strawberry shortcake',
    image: 'https://cdn.loveandlemons.com/wp-content/uploads/2021/06/summer-desserts.jpg',
    deliveryTime: 25,
    rate: 3.6,
    deliveryPrice: 'free'.tr(),
  ),
];