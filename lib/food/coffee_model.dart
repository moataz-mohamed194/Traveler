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
      shopName: 'Byblos',
      address: 'El-Gaish Rd, San Stifano, \n First Al Raml',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee',
      locationCoords: LatLng(31.245494, 29.965913),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'The Cocktail Lounge',
      address: 'San Stifano, Qesm AR Ramel',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(31.244700, 29.964983),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Trianon',
      address: 'Abd El-Salam Aref, San Stifano,\n Qism El-Raml',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews .',
      locationCoords: LatLng(31.243767, 29.967247),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Friends Restaurant & Cafe',
      address: '147 Abd El-Salam Aref,\n San Stifano, Qism El-Raml',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches.',
      locationCoords: LatLng(31.242868, 29.966173),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Alley 31',
      address: '31 Abd El-Salam Aref, \nSan Stifano, Qism El-Raml',
      description: 'Compact coffee & espresso bar turning out.',
      locationCoords: LatLng(31.241461, 29.963736),
      thumbNail: 'https://img.youm7.com/large/20160929020217217.jpg')
];
