import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<ProductEntity>>> getProducts({
    required int offset,
    required int limit,
  }) async {
    try {
      final List<ProductModel> products = await remoteDataSource.getProducts(
        offset: offset,
        limit: limit,
      );
      
      final List<ProductEntity> entities = products.map((model) => _mapToEntity(model)).toList();
      return Right(entities);
    } on DioException catch (e) {
      // Handle specific Dio errors
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left('Connection timeout. Please check your internet connection.');
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left('No internet access. Please check your connection and try again.');
      } else if (e.response?.statusCode == 404) {
        return const Left('Service not found. Please try again later.');
      } else if (e.response?.statusCode == 500) {
        return const Left('Server error. Please try again later.');
      } else {
        return Left('Network error: ${e.message ?? 'Unknown error occurred'}');
      }
    } catch (e) {
      return Left('Failed to fetch products: ${e.toString()}');
    }
  }

  ProductEntity _mapToEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      title: model.title,
      price: model.price,
      description: model.description,
      images: model.images,
      creationAt: model.creationAt,
      updatedAt: model.updatedAt,
      category: CategoryEntity(
        id: model.category.id,
        name: model.category.name,
        image: model.category.image,
        creationAt: model.category.creationAt,
        updatedAt: model.category.updatedAt,
      ),
    );
  }
}