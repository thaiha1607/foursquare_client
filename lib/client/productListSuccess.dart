// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:foursquare_client/client/payment.dart';
import '../data/product.dart';

class ProductListSuccess extends StatefulWidget {
  const ProductListSuccess({Key? key}) : super(key: key);

  @override
  State<ProductListSuccess> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<ProductListSuccess>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
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
        controller: _tabController,
        children: [
          buildProductList(Status.ordered),
          buildProductList(Status.preparing),
          buildProductList(Status.shipping),
          buildProductList(Status.completed),
        ],
      ),
    );
  }

  Widget buildProductList(Status status) {
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
