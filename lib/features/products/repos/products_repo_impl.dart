import 'package:dartz/dartz.dart';
import 'package:depi/core/errors/failures.dart';
import 'package:depi/core/utils/functions/api_service.dart';
import 'package:depi/features/products/models/products_model/product.dart';
import 'package:depi/features/products/repos/products_repo.dart';
import 'package:dio/dio.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await apiService.get(endPoint: 'products');

      final List<Product> products = (response['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList();

      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
