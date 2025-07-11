// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import '../../../../core/network/api_helper.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    required int offset,
    required int limit,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiHelper apiHelper;

  ProductRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<List<ProductModel>> getProducts({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await apiHelper.getRequest(
        '/products',
        queryParams: {
          'offset': offset,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch products',
        );
      }
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: '/products'),
        message: e.toString(),
      );
    }
  }
}