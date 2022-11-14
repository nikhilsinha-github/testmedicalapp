import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/svg.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 1;

  TextStyle h1TextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14);

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
            children: [
              customAppBar(),
              productItem("Thyroxine (100mcg) Tablet", "Thyronorm"),
            ],
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
          color: Colors.white,
        ),
        const Spacer(),
        const Text(
          "CART",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const Spacer(),
        GestureDetector(onTap: () {}, child: discountIcon),
        GestureDetector(onTap: () {}, child: cartIcon)
      ],
    );
  }

  Widget counter() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
            shape: const CircleBorder(),
            color: Colors.white,
            onPressed: () {
              if (count == 1) return;
              setState(() {
                count--;
              });
            },
            child: const Text(
              "-",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
        Text(
          count.toString(),
          style: h1TextStyle,
        ),
        MaterialButton(
            shape: const CircleBorder(),
            color: Colors.white,
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            )),
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
                children: [
                  Text(itemName),
                  // const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              ),
              Row(
                children: [Text(type), counter()],
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
