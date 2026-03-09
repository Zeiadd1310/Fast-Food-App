import 'package:dartz/dartz.dart';
import 'package:depi/core/errors/failures.dart';
import 'package:depi/features/products/models/products_model/product.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<Product>>> getProducts();
}
