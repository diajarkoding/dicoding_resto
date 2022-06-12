// // // import 'dart:convert';
// // // import 'dart:io';

// // // import 'package:dicoding_resto/data/resto_model.dart';
// // // import 'package:flutter_test/flutter_test.dart';
// // // import 'package:flutter/services.dart' as roorBundle;

// // // // void main() {
// // // //   group(('Test get data restaurant'), () {
// // // //     final file = File('assets/restaurant.json').readAsStringSync();
// // // //     final snapshot = Restaurant.fromJson(jsonDecode(file));
// // // //     List<RestaurantElement> restaurant = snapshot.restaurants;

// // // //     for (var element in restaurant) {
// // // //       test(('Restaurant has an id with type string'), () {
// // // //         expect(element.id, "rqdv5juczeskfw1e867");
// // // //         expect(element.name, "Melting Pot");
// // // //         expect(element.description,
// // // //             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.");
// // // //       });
// // // //     }
// // // //   });
// // // //   // final file = await File('assets/restaurant.json').readAsString();
// // // //   // final snapshot = Restaurant.fromJson(jsonDecode(file)) ;

// // // //   // RestaurantElement restaurant = snapshot.restaurants[0];
// // // //   // print(restaurant.id);
// // // // }
// // // void main() async {
// // //   Future<Restaurant> readDataJson() async {
// // //     final file = await File('assets/restaurant.json').readAsString();
// // //     final snapshot = Restaurant.fromJson(jsonDecode(file));
// // //     // final data = jsonDecode(jsonData);
// // //     return snapshot;
// // //   }

// // //   final data = await readDataJson();
// // //   print(data);
// // // }
// import 'dart:convert';

// import 'package:dicoding_resto/data/models/resto_model.dart';
// import 'package:http/http.dart' as http;

// // void main() async {
// //   String baseUrl = 'https://restaurant-api.dicoding.dev';
// //   // Future<Restaurants> getDataList() async {
// //   //   Uri url = Uri.parse('$baseUrl/list');
// //   //   http.Response response = await http.get(url);
// //   //   if (response.statusCode == 200) {
// //   //     var data = Restaurants.fromJson(jsonDecode(response.body));

// //   //     return data;
// //   //   } else {
// //   //     throw Exception('Gagal mengambil data');
// //   //   }
// //   // }

// //   // Future<RestaurantDetail> getDataDetail() async {
// //   //   Restaurants data = await getDataList();
// //   //   Uri url = Uri.parse('$baseUrl/detail/${data.restaurants[0].id}');
// //   //   http.Response response = await http.get(url);
// //   //   if (response.statusCode == 200) {
// //   //     RestaurantModel restaurantModel =
// //   //         RestaurantModel.fromJson(jsonDecode(response.body));
// //   //     RestaurantDetail restaurantDetail = restaurantModel.restaurant;

// //   //     return restaurantDetail;
// //   //   } else {
// //   //     throw Exception('Gagal mengambil data');
// //   //   }
// //   // }

// //   // Restaurants data = await getDataList();
// //   // var detail = await getDataDetail();
// //   // print(data.restaurants);
// //   // print(detail.name);
// //   List<RestaurantSummary> listResto = [];
// //   Future<Restaurants> searchDataFromApi(String queri) async {
// //     Uri uri = Uri.parse('$baseUrl/search?q=$queri');
// //     http.Response response = await http.get(uri);
// //     if (response.statusCode == 200) {
// //       var data = Restaurants.fromJson(jsonDecode(response.body));

// //       return data;
// //     } else {
// //       throw Exception('Gagal mengambil data');
// //     }
// //   }

// //   var query = await searchDataFromApi('melting');
// //   print(query.restaurants[0].name);
// // }
// import 'package:dicoding_resto/data/models/review_resto_model.dart';

// void main() async {
//   String baseUrl = 'https://restaurant-api.dicoding.dev';

//   Future<ReviewRestoModel> postAddReviewRestaurant() async {
//     try {
//       final Uri url = Uri.parse('$baseUrl/review');

//       var headers = {'Content-Type': 'application/json'};

//       var body = jsonEncode({
//         "id": 'rqdv5juczeskfw1e867',
//         "name": 'test',
//         "review": 'sangan memuaskan'
//       });

//       final http.Response response = await http.post(
//         url,
//         headers: headers,
//         body: body,
//       );

//       print(response.statusCode);
//       // var data = ReviewRestoModel.fromJson(json.decode(response.body));
//       // var data = jsonDecode(response.body);
//       // return data;

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var data = ReviewRestoModel.fromJson(jsonDecode(response.body));
//         return data;
//       } else {
//         throw Exception('');
//       }
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }

//   var data = await postAddReviewRestaurant();

//   print(data.customerReviews[0].name);
// }
