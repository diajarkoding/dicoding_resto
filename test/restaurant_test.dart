// import 'dart:convert';
// import 'dart:io';

// import 'package:dicoding_resto/data/resto_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/services.dart' as roorBundle;

// // void main() {
// //   group(('Test get data restaurant'), () {
// //     final file = File('assets/restaurant.json').readAsStringSync();
// //     final snapshot = Restaurant.fromJson(jsonDecode(file));
// //     List<RestaurantElement> restaurant = snapshot.restaurants;

// //     for (var element in restaurant) {
// //       test(('Restaurant has an id with type string'), () {
// //         expect(element.id, "rqdv5juczeskfw1e867");
// //         expect(element.name, "Melting Pot");
// //         expect(element.description,
// //             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.");
// //       });
// //     }
// //   });
// //   // final file = await File('assets/restaurant.json').readAsString();
// //   // final snapshot = Restaurant.fromJson(jsonDecode(file)) ;

// //   // RestaurantElement restaurant = snapshot.restaurants[0];
// //   // print(restaurant.id);
// // }
// void main() async {
//   Future<Restaurant> readDataJson() async {
//     final file = await File('assets/restaurant.json').readAsString();
//     final snapshot = Restaurant.fromJson(jsonDecode(file));
//     // final data = jsonDecode(jsonData);
//     return snapshot;
//   }

//   final data = await readDataJson();
//   print(data);
// }
