import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/svg.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int count = 1;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(),
                productSlider(),
                medicineDetails(),
                // extraDetails([
                //   "Medical Description",
                //   "Alternative Medicine/ Other Brand Medicine",
                //   "Frequently Brought Medicines"
                // ]),
                customText("Uses", h1TextStyle),
                customText(
                    '''Lörem ipsum makrons kvasid plus apogam kovåbelt. Heterode spemiliga hivis. Autos teotos av benåk en probelt rearasam trektig. Supramyv plapånade trefenade liksom klickfarm hon sper. ''',
                    h2TextStyle),
                quantity(),
              ],
            ),
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
          "PRODUCT DETAILS",
          style: TextStyle(
              color: white, fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const Spacer(),
        GestureDetector(onTap: () {}, child: discountIcon),
        GestureDetector(onTap: () {}, child: cartIcon)
      ],
    );
  }

  Widget productSlider() {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          'assets/images/medicine-1.png',
        );
      },
      itemCount: 3,
      options: CarouselOptions(
        autoPlay: false,
      ),
    );
  }

  Widget medicineDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          customText("Thyroxine(100mcg) Tablet", h1TextStyle),
          customText("Tabs Care Ltd", h2TextStyle),
          Row(
            children: [
              customText("Unit Price", h2TextStyle),
              const Text("Rs 300"),
              customText("Rs 247", h2TextStyle),
              customText("(30N/Pack)", h2TextStyle),
              customText("24% Off", h2TextStyle),
            ],
          ),
          Row(
            children: [
              customText("Available As", h2TextStyle),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("50 mcg"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Chip(label: Text("88 mcg")),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Chip(label: Text("100 mcg")),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                "4.2K",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: yellowColor),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget customText(String text, TextStyle textStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }

  Widget extraDetails(List<String> text) {
    return ListView.builder(
      itemCount: text.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(text[index]),
          children: const [],
        );
      },
    );
  }

  Widget quantity() {
    return Row(
      children: [
        customText("Quantity", h1TextStyle),
        const Spacer(),
        counter(),
      ],
    );
  }

  Widget counter() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: const Icon(Icons.minimize)),
        Text(count.toString()),
        IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
