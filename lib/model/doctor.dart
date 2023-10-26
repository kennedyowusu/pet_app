import 'package:pet_app/constants/images.dart';
import 'package:pet_app/model/service.dart';

class DoctorModel {
  String name, image;
  List<String> services;

  DoctorModel({
    required this.name,
    required this.image,
    required this.services,
  });
}

List<DoctorModel> doctors = [
  DoctorModel(
    name: "Dr. John Morrison",
    image: petVeterinaryDoctor,
    services: [Service.vacination, Service.surgery, Service.grooming],
  ),
  DoctorModel(
    name: "Dr. Frank Martin",
    image: doctor,
    services: [Service.surgery, Service.grooming],
  ),
  DoctorModel(
    name: "Dr. David Warner",
    image: doctor2,
    services: [Service.vacination, Service.surgery],
  )
];
