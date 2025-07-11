import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaqi_siesta_technical_test/features/second_task/presentation/component/product_empty_state.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../controller/product_controller.dart';
import 'product_card.dart';
import 'shimmer_loading.dart';
import 'error_widget.dart';
import 'load_more_indicator.dart';

class ProductListView extends StatelessWidget {
  final ProductController controller;
  final ScrollController scrollController;
  final Function(dynamic) onProductTap;

  const ProductListView({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.state;
      final products = controller.products;

      // Loading state
      if (state == ProductState.loading && products.isEmpty) {
        return const ShimmerLoading();
      }

      // Error state
      if (state == ProductState.error && products.isEmpty) {
        return ErrorStateWidget(
          message: controller.errorMessage,
          onRetry: controller.retryLoading,
        );
      }

      // Empty state
      if (products.isEmpty && state == ProductState.loaded) {
        return const ProductEmptyState();
      }

      // Products list
      return RefreshIndicator(
        onRefresh: controller.refreshProducts,
        color: Neutral.neutral90,
        child: ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.all(16.w),
          itemCount: products.length + (controller.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            // Load more indicator
            if (index == products.length) {
              return controller.isLoadingMore 
                  ? const LoadMoreIndicator()
                  : const SizedBox.shrink();
            }

            // Product card
            final product = products[index];
            return ProductCard(
              product: product,
              onTap: () => onProductTap(product),
            );
          },
        ),
      );
    });
  }
}