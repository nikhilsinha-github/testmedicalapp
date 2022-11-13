import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/svg.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextStyle h1TextStyle =
      const TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 14);
  TextStyle h2TextStyle =
      const TextStyle(color: white, fontWeight: FontWeight.w400, fontSize: 12);
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
              addressCard(),
              priceDetails(),
              paymentOptions(),
              Center(
                child: MaterialButton(
                  height: 50,
                  minWidth: w * 0.7,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {},
                  color: boxBlueColor,
                  child: const Text(
                    "Place Order",
                    style: TextStyle(color: white, fontSize: 14),
                  ),
                ),
              ),
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
          color: white,
        ),
        const Spacer(),
        const Text(
          "ADDRESS",
          style: TextStyle(
              color: white, fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const Spacer(),
        GestureDetector(onTap: () {}, child: discountIcon),
      ],
    );
  }

  Widget paymentOptions() {
    return Container(
      decoration: const BoxDecoration(
      color: boxBlueColor,
      )
      child: Column(
        children: [
          Text(
            "Deliver to Khusi, 600192",
            style: h1TextStyle,
          ),
          Text(
            '''No.2/2,banashankari layout 5th main road,
1st stage Benagalore, karnataka
+9659476246''',
            style: h2TextStyle,
          )
        ],
      ),
    );
  }

  Widget addressCard() {
    return Container();
  }

  Widget priceDetails() {
    return Container();
  }
}
