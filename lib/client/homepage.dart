import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:convex_bottom_bar/convex_bottom_bar.dart";
import "package:foursquare_client/client/cart.dart";
import "package:foursquare_client/client/chatbox.dart";
import "package:foursquare_client/client/productListSuccess.dart";
import "package:foursquare_client/client/shopping.dart";
import "package:foursquare_client/profile/profile_page.dart";

class Homepage extends HookWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState<int>(0);
    final isSearchBarVisible = useState<bool>(
        false); // Trạng thái để kiểm tra xem thanh tìm kiếm đã được mở hay chưa

    var containerList = <Widget>[
      Container(alignment: Alignment.center, child: const Shopping()),
      Container(
        alignment: Alignment.center,
        child: const ProductListSuccess(),
      ),
      Container(
        alignment: Alignment.center,
        child: const CartScreen(
          isAppBarVisible: false,
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const MyApp(),
      ),
      Container(
        alignment: Alignment.center,
        child: const ProfilePage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: isSearchBarVisible.value
            ? const TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm...',
                ),
              )
            : const Text('Foursquare App'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Khi nhấn vào biểu tượng tìm kiếm, chuyển trạng thái để hiển thị thanh tìm kiếm
              isSearchBarVisible.value = !isSearchBarVisible.value;
            },
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Trang chủ'),
          TabItem(icon: Icons.receipt_outlined, title: 'Đơn hàng'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
          TabItem(icon: Icons.chat_outlined, title: 'Nhắn tin'),
          TabItem(icon: Icons.account_circle_outlined, title: 'Tài khoản'),
        ],
        onTap: (int index) {
          currentPageIndex.value = index;
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        color: Theme.of(context).colorScheme.onSurface,
        activeColor: Theme.of(context).colorScheme.primary,
        style: TabStyle.fixedCircle,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: containerList[currentPageIndex.value],
      ),
    );
  }
}
