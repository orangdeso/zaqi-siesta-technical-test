import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';
import '../component/product_detail_modal.dart';
import '../component/product_list_view.dart';
import '../component/product_search_bar.dart';
import '../controller/product_controller.dart';

class SecondTaskPage extends StatefulWidget {
  const SecondTaskPage({super.key});

  @override
  State<SecondTaskPage> createState() => _SecondTaskPageState();
}

class _SecondTaskPageState extends State<SecondTaskPage> {
  final ProductController controller = Get.find<ProductController>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 
          _scrollController.position.maxScrollExtent - 200) {
        controller.loadMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Neutral.neutral10,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          ProductSearchBar(
            controller: _searchController,
            onChanged: _handleSearch,
            onClear: _handleClearSearch,
          ),
          Expanded(
            child: ProductListView(
              controller: controller,
              scrollController: _scrollController,
              onProductTap: _showProductDetail,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: TypographyStyles.bodyMainMedium(
        'Products',
        color: Neutral.neutral100,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(
          height: 1.h,
          color: Neutral.neutral20,
        ),
      ),
    );
  }

  void _handleSearch(String value) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_searchController.text == value) {
        controller.searchProducts(value);
      }
    });
  }

  void _handleClearSearch() {
    _searchController.clear();
    controller.loadProducts();
  }

  void _showProductDetail(dynamic product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductDetailModal(product: product),
    );
  }
}