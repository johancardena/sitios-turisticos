class TouristPlace {
  final String name;
  final String location;
  final String description;
  final String image;
  final double latitude;
  final double longitude;
  bool isFavorite;

  TouristPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.image,
    required this.latitude,
    required this.longitude,
    this.isFavorite = false,
  });
}
