import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:helpinghand/model/ad.dart';
import 'package:helpinghand/model/user.dart';
import 'package:helpinghand/service/auth/auth_service.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final adsKey = "ads";
  final usersKey = "users";
  final categories = "categories";

  Future<List<Ad>> getAds() async {
    try {
      final snapshot = await _firestore.collection(adsKey).get();
      final ads = <Ad>[];
      snapshot.docs.forEach((doc) {
        ads.add(Ad.fromJson(doc.data()));
      });
      return ads;
    } catch (e) {
      return [];
    }
  }

  Future<User> getUserProfile() async {
    try {
      final userId = AuthService().getUid();
      if (userId == null) {
        return User();
      }
      final snapshot = await _firestore.collection(usersKey).doc(userId).get();
      if (snapshot.exists) {
        return User.fromJson(snapshot.data()!);
      } else {
        return User();
      }
    } catch (e) {
      return User();
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final snapshot = await _firestore
          .collection(categories)
          .doc("ZEHk6Zm2O7YvnT1pDhXv")
          .get();
      List<String> fetchedCategories = [];
      snapshot.data()?["categories"].forEach((category) {
        fetchedCategories.add(category);
      });
      return fetchedCategories;
    } catch (e) {
      return [];
    }
  }
}
