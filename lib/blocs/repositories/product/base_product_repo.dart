import '../../../model/model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
