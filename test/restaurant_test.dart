import 'package:dicoding_resto/data/models/resto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Should be able to parse json restaurant data when data is parsed to fromJson function',
      () {
    const id = "rqdv5juczeskfw1e867";

    const name = "Melting Pot";

    const description =
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor";

    const pictureId = "14";

    const city = "Medan";

    const rating = 4.2;

    RestaurantSummary result = RestaurantSummary.fromJson(json);

    expect(result.id, id);

    expect(result.name, name);

    expect(result.description, description);

    expect(result.pictureId, pictureId);

    expect(result.city, city);

    expect(result.rating, rating);
  });

  test('Should be able to convert model to json', () {
    RestaurantSummary test = RestaurantSummary(
      id: 'rqdv5juczeskfw1e867',
      name: 'Melting Pot',
      description:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor',
      pictureId: '14',
      city: 'Medan',
      rating: 4.2,
    );

    var result = test.toJson();

    expect(result, json);
  });
}

const Map<String, dynamic> json = {
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor",
  "pictureId": "14",
  "city": "Medan",
  "rating": 4.2
};
