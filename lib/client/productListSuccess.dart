// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foursquare_client/client/payment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/product.dart';

class ProductListSuccess extends HookConsumerWidget {
  const ProductListSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);
    var orderedProduct = ref.watch(orderedProductNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.shopping_bag_outlined),
              text: 'Đã đặt',
            ),
            Tab(
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              text: 'Đang chuẩn bị',
            ),
            Tab(
              icon: Icon(Icons.local_shipping_outlined),
              text: 'Đang vận chuyển',
            ),
            Tab(
              icon: Icon(Icons.playlist_add_check_outlined),
              text: 'Hoàn thành',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildProductList(Status.ordered, orderedProduct),
          buildProductList(Status.preparing, orderedProduct),
          buildProductList(Status.shipping, orderedProduct),
          buildProductList(Status.completed, orderedProduct),
        ],
      ),
    );
  }

  Widget buildProductList(Status status, List<Product> orderedProduct) {
    // Lọc danh sách sản phẩm dựa trên trạng thái
    List<Product> filteredProducts =
        orderedProduct.where((product) => product.status == status).toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredProducts[index].name),
          // Hiển thị các thông tin khác về sản phẩm tùy thuộc vào yêu cầu của bạn
        );
      },
    );
  }
}
