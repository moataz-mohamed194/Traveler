import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Coffee(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'Mr BM Accessories',
      address: 'Grand Plaza, San Stifano,\n Qism El-Raml',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee',
      locationCoords: LatLng(31.245199, 29.967514),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Spade giftshop',
      address: '6 Ahmed Mohammed Al Adham,\n San Stifano,Qism El-Raml\n',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(31.242992, 29.968416),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Handmade Giftshop',
      address: '244 El-Fath, Al Aqesa WA Baqos,\n Qism El-Raml',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews .',
      locationCoords: LatLng(31.241780, 29.970075),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Amazing Siwa',
      address: 'Shop 25 Building  40 Nabeel\n Mansour Street ,flemeg ',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches.',
      locationCoords: LatLng(31.231598, 29.957563),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Keep In Touch',
      address: '1 Syria, Mustafa Kamel \n WA Bolkli, Sidi Gaber',
      description: 'Compact coffee & espresso bar turning out.',
      locationCoords: LatLng(31.228313, 29.951374),
      thumbNail: 'https://img.youm7.com/large/20160929020217217.jpg')
];
