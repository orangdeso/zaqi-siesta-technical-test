import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts({
    required int offset,
    required int limit,
  });
}