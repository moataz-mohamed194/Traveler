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
      shopName: 'Fathallah Market',
      address: 'El-Fath, San Stifano,\n Qism El-Raml',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee',
      locationCoords: LatLng(31.243818, 29.968975),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Metro',
      address: '601 El-Horeya Rd, ZEZENIA،\n Qism El-Raml',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(31.239744, 29.965772),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'El King Supermarket',
      address: '83 mortada street janaklees,\n Qesm AR Ramel',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews .',
      locationCoords: LatLng(31.241723, 29.969237),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Super Fresh',
      address: 'San Stifano, Qism El-Raml ',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches.',
      locationCoords: LatLng(31.241399, 29.963040),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Fresh Food Market ',
      address: '8-10 Al Kazeno, San Stifano,\n Qism El-Raml',
      description: 'Compact coffee & espresso bar turning out.',
      locationCoords: LatLng(31.244928, 29.967031),
      thumbNail: 'https://img.youm7.com/large/20160929020217217.jpg')
];
