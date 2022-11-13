import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/svg.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [lightBlue, darkBlue],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [customAppBar(), productItem("itemName", "type"),],
          ),
        ),
      ),
    ));
  }

  Widget customAppBar() {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back,
          color: white,
        ),
        const Spacer(),
        const Text(
          "CART",
          style: TextStyle(
              color: white, fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const Spacer(),
        GestureDetector(onTap: () {}, child: discountIcon),
        GestureDetector(onTap: () {}, child: cartIcon)
      ],
    );
  }

  Widget productItem(String itemName, String type) {
    return Container(
      color: boxBlueColor,
      child: Row(
        children: [
          Image.asset('assets/images/medicine-1.png'),
          Column(
            children: [
              Row(
                children: const [],
              ),
              Row(
                children: const [],
              ),
              Row(
                children: const [
                  Text("Unit Price - "),
                  Text("Rs 247"),
                  Text("(30N/Pack)")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
