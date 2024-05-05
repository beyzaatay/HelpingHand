import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ad {
  final String? title;
  final LatLng? location;
  final String? city;
  final String? image;
  final String? logo;
  final String? about;
  final List<String?>? categories;

  Ad({
    this.title,
    this.location,
    this.city,
    this.image,
    this.logo,
    this.about,
    this.categories,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    final categories = json["categories"];
    List<String?> categoriesList = [];
    for (var category in categories) {
      if (category is String) {
        categoriesList.add(category);
      }
    }

    return Ad(
      title: json['title'],
      location: json['location'] != null
          ? LatLng(
              GeoPoint(json['location'].latitude, json['location'].longitude)
                  .latitude,
              GeoPoint(json['location'].latitude, json['location'].longitude)
                  .longitude,
            )
          : null,
      city: json['city'],
      image: json['image'],
      logo: json['logo'],
      about: json['about'],
      categories: categoriesList,
    );
  }
}
