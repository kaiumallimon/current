import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:current/app/data/models/home/_category_model.dart';

import '../../models/home/_banner_model.dart';

class HomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('db_categories');

  final CollectionReference _banners =
      FirebaseFirestore.instance.collection('db_home_banners');

  Future<List<CategoryModel>> getCategories() async {
    try {
      final QuerySnapshot querySnapshot = await _categories.orderBy(
        'index',
        descending: false,
      ).get();

      return querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching categories: $e");
      return [];
    }
  }


  Future<List<BannerModel>> getBanners() async {
    try {
      final QuerySnapshot querySnapshot = await _banners.get();

      return querySnapshot.docs
          .map((e) => BannerModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching banners: $e");
      return [];
    }
  }
}
