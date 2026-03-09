import 'package:bloc/bloc.dart';
import 'package:depi/features/products/models/products_model/product.dart';
import 'package:depi/features/products/repos/products_repo.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.errMessage)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
