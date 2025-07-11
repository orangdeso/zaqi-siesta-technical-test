import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<Either<String, List<ProductEntity>>> call({
    required int offset,
    required int limit,
  }) async {
    return await repository.getProducts(
      offset: offset,
      limit: limit,
    );
  }
}