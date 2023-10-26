import 'package:pet_app/constants/images.dart';

class TreatedAnimals {
  final int id;
  final String image;

  TreatedAnimals({
    required this.id,
    required this.image,
  });
}

List<TreatedAnimals> treatedAnimals = [
  TreatedAnimals(
    id: 1,
    image: cat1,
  ),
  TreatedAnimals(
    id: 2,
    image: cat2,
  ),
  TreatedAnimals(
    id: 3,
    image: cat3,
  ),
  TreatedAnimals(
    id: 4,
    image: dog1,
  ),
  TreatedAnimals(
    id: 5,
    image: dog2,
  ),
];
