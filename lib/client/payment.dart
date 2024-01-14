import 'dart:async';

import './fadeanimation.dart';
import './successPayment.dart';
import 'package:flutter/material.dart';
import './cart.dart';
import '../data/product.dart';

class PaymentPage extends StatefulWidget {
  final double paymentCost;

  const PaymentPage({super.key, required this.paymentCost});

  @override
  PaymentPageState createState() => PaymentPageState();
}

List<Product> orderedProduct = [];

class PaymentPageState extends State<PaymentPage> {
  // ship fee
  double shippingFee = 10.0;
  int activeCard = 0;
  bool _isLoading = false;
  late Timer timer;

  pay() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          timer.cancel();
          // Chuyển trạng thái sản phẩm
          for (var item in cart.itemsInCart) {
            item.product.status = Status.ordered;
            orderedProduct.add(item.product);
          }
          // Xóa hết sản phẩm ở trang Cart
          cart.itemsInCart.clear();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaymentSuccess()));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Thanh toán',
            style: TextStyle(color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                activeCard == 0
                    ? FadeAnimation(
                        1.2,
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: activeCard == 0 ? 1 : 0,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green.shade400,
                                    Colors.green.shade800,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Credit Card",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "**** **** **** 7890",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "theflutterlover",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Image.network(
                                              'https://img.icons8.com/color/2x/mastercard-logo.png',
                                              height: 50),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ))
                    : FadeAnimation(
                        1.2,
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: activeCard == 1 ? 1 : 0,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.all(30.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.grey.shade200
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade200,
                                    Colors.grey.shade100,
                                    Colors.grey.shade200,
                                    Colors.grey.shade300,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                          'https://img.icons8.com/ios/2x/mac-os.png',
                                          height: 50),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "Minh Nghia with Love",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Image.network(
                                            'https://img.icons8.com/ios/2x/sim-card-chip.png',
                                            height: 35,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        )),
                const SizedBox(
                  height: 50,
                ),
                const FadeAnimation(
                    1.2,
                    Text(
                      "Phương thức thanh toán",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.3,
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeCard = 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: activeCard == 0
                                ? Border.all(
                                    color: Colors.grey.shade300, width: 1)
                                : Border.all(
                                    color: Colors.grey.shade300.withOpacity(0),
                                    width: 1),
                          ),
                          child: Image.network(
                            'https://img.icons8.com/color/2x/mastercard-logo.png',
                            height: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeCard = 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: activeCard == 1
                                ? Border.all(
                                    color: Colors.grey.shade300, width: 1)
                                : Border.all(
                                    color: Colors.grey.shade300.withOpacity(0),
                                    width: 1),
                          ),
                          child: Image.network(
                            'https://img.icons8.com/ios-filled/2x/apple-pay.png',
                            height: 50,
                          ),
                        ),
                      ),
                    ])),
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.4,
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Mã giảm giá",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("Thêm mã"))
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Địa chỉ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text("KTX Bách Khoa,..."),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                  )
                                ],
                              ))
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phí vận chuyển",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text("${(shippingFee).toStringAsFixed(2)} VNĐ",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue))
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tổng thanh toán",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                            "${(cart.totalCost + shippingFee).toStringAsFixed(2)} VNĐ",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue))
                      ],
                    )),
                const SizedBox(height: 30),
                FadeAnimation(
                  1.4,
                  MaterialButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            pay();
                          },
                    height: 50,
                    elevation: 0,
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    child: Center(
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 3,
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              "Thanh toán",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
