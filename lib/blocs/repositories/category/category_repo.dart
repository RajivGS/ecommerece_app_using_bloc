import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece_app/blocs/repositories/category/base_category_repo.dart';
import 'package:ecommerece_app/model/category_model.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapShot(doc)).toList();
    });
  }
}
