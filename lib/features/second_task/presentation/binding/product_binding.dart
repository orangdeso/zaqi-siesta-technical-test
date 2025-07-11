import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_helper.dart';
import '../../data/datasources/product_remote_datasource.dart';
import '../../data/repository/product_repository_impl.dart';
import '../../domain/repository/product_repository.dart';
import '../../domain/usecase/get_products_usecase.dart';
import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Network layer
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<DioClient>(() => DioClient(Get.find<Dio>()));
    Get.lazyPut<ApiHelper>(() => ApiHelper(Get.find<DioClient>().dio));

    // Data layer
    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiHelper: Get.find<ApiHelper>()),
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: Get.find<ProductRemoteDataSource>()),
    );

    // Domain layer
    Get.lazyPut<GetProductsUseCase>(
      () => GetProductsUseCase(repository: Get.find<ProductRepository>()),
    );

    // Presentation layer
    Get.lazyPut<ProductController>(
      () => ProductController(getProductsUseCase: Get.find<GetProductsUseCase>()),
    );
  }
}