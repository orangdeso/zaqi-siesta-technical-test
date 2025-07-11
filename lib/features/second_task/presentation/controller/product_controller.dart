import 'dart:developer';

import 'package:get/get.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecase/get_products_usecase.dart';

enum ProductState { initial, loading, loaded, error, loadingMore }

class ProductController extends GetxController {
  final GetProductsUseCase getProductsUseCase;

  ProductController({required this.getProductsUseCase});

  // Observable states
  final Rx<ProductState> _state = ProductState.initial.obs;
  final RxList<ProductEntity> _products = <ProductEntity>[].obs;
  final RxString _errorMessage = ''.obs;
  final RxBool _hasMore = true.obs;
  final RxInt _currentPage = 0.obs;

  // Getters
  ProductState get state => _state.value;
  List<ProductEntity> get products => _products;
  String get errorMessage => _errorMessage.value;
  bool get hasMore => _hasMore.value;
  bool get isLoading => _state.value == ProductState.loading;
  bool get isLoadingMore => _state.value == ProductState.loadingMore;

  // Constants
  static const int _limit = 10;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // Load initial products
  Future<void> loadProducts() async {
    if (_state.value == ProductState.loading) return;

    _state.value = ProductState.loading;
    _currentPage.value = 0;
    _products.clear();

    await _fetchProducts();
  }

  // Load more products (pagination)
  Future<void> loadMoreProducts() async {
    if (!_hasMore.value || 
        _state.value == ProductState.loading || 
        _state.value == ProductState.loadingMore) {
      return;
    }

    _state.value = ProductState.loadingMore;
    _currentPage.value++;

    await _fetchProducts();
  }

  // Refresh products (pull to refresh)
  Future<void> refreshProducts() async {
    _currentPage.value = 0;
    _products.clear();
    _hasMore.value = true;
    await _fetchProducts();
  }

  // Private method to fetch products
  Future<void> _fetchProducts() async {
    final result = await getProductsUseCase.call(
      offset: _currentPage.value * _limit,
      limit: _limit,
    );

    result.fold(
      (error) {
        _errorMessage.value = error;
        _state.value = ProductState.error;
      },
      (newProducts) {
        // Debug logging
        for (var product in newProducts) {
          log('Product: ${product.title}');
          log('Images count: ${product.images.length}');
          for (int i = 0; i < product.images.length; i++) {
            log('Image $i: ${product.images[i]}');
          }
          log('---');
        }
        
        if (newProducts.isEmpty) {
          _hasMore.value = false;
        } else {
          _products.addAll(newProducts);
          _hasMore.value = newProducts.length == _limit;
        }
        _state.value = ProductState.loaded;
      },
    );
  }

  // Retry loading products
  void retryLoading() {
    loadProducts();
  }

  // Search products (optional feature)
  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      loadProducts();
      return;
    }

    // Filter existing products by title or category
    final filteredProducts = _products.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.category.name.toLowerCase().contains(query.toLowerCase())).toList();

    _products.assignAll(filteredProducts);
  }
}