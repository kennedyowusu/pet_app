class Service {
  static String vacination = "Vacination";
  static String surgery = "Surgery";
  static String grooming = "Grooming";
  static String boarding = "Boarding";
  static String petHotel = "Pet Hotel";
  static String consultation = "Consultation";

  static List<String> categories() {
    return [
      vacination,
      surgery,
      grooming,
      boarding,
      petHotel,
      consultation,
    ];
  }
}
