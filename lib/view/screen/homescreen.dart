import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmedicalapp/controller/medicines_controller.dart';
import 'package:testmedicalapp/model/medicines_model.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/svg.dart';
import 'package:testmedicalapp/view/screen/login.dart';
import 'package:testmedicalapp/view/screen/product_details_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List imgList = [banner, banner];
  List<Widget> imageSliders = <Widget>[
    Image.asset(
      banner,
      height: 50,
      fit: BoxFit.cover,
    ),
    Image.asset(
      banner,
      height: 50,
      fit: BoxFit.cover,
    ),
  ];
  List easyWayList = [
    const Text("Trending Discount %"),
    Row(
      children: [
        discount2Icon,
        const SizedBox(
          width: 10,
        ),
        const Text("Apply Coupon"),
      ],
    ),
    Row(
      children: const [
        Text("Get Insurance"),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward,
        ),
      ],
    ),
    Row(
      children: const [
        Text("View more offers"),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    MedicinesController mediciniesController = Get.put(MedicinesController());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 12,
                ),
                homeIcon,
                const Text("Home"),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                healthcareIcon,
                const Text("Health Care"),
              ],
            ),
            label: 'Health Care',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                labTestIcon,
                const Text("Lab test"),
              ],
            ),
            label: 'Lab test',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                rewardIcon,
                const Text("Reward"),
              ],
            ),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                videosIcon,
                const Text("Videos"),
              ],
            ),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                accountIcon,
                const Text("Account"),
              ],
            ),
            label: 'Account',
          ),
        ],
      ),
      body: GetBuilder<MedicinesController>(
        builder: (medicinesController) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(),
                introProducts(medicinesController),
                imageSlider(),
                specialProducts(),
                shopByCategory(),
                easyWayToGet(sw),
                uploadPrescription(),
                labTests(),
                membershipCard(),
                flatDiscountList(),
                featuredBrands(),
                essentialsList(),
                rateUs(),
                const SizedBox(
                  height: 20,
                ),
                giftCard(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            lightBlue,
            darkBlue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                logo,
                //
                Row(
                  children: [
                    plusIcon,
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      ),
                      child: walletIcon,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    discountIcon,
                    const SizedBox(
                      width: 15,
                    ),
                    cartIcon,
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [
                const Text(
                  "Deliver to ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Row(
                    children: const [
                      Text(
                        "122200 Delhi ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            searchBar(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 20,
              ),
              child: Icon(
                Icons.search,
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SEARCH',
                    hintStyle: TextStyle(
                      color: hintGreyColor,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget introProducts(MedicinesController medicinesController) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: medicinesController.medicines.length,
        itemBuilder: (context, index) {
          Medicines medicines = medicinesController.medicines[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProductDetailsScreen())),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.network(
                  medicines.img,
                  width: 125,
                  height: 100,
                ),
                Text(
                  medicines.name,
                  style: const TextStyle(
                    color: primaryBlueTextColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget imageSlider() {
    return SizedBox(
      height: 150,
      child: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 3.5,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? indicatorBlueColor
                        : indicatorDisabledColor),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }

  Widget specialProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            "Especcially for you",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 125,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen())),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(specialProduct),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Product Name"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget shopByCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            "Shop By Category",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: Wrap(
            children: List.generate(
              6,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen())),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            category,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text("Product Name"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget easyWayToGet(double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Text(
            "Easy way to get",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        Wrap(
          children: List.generate(
            easyWayList.length,
            (index) => Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 10.0,
              ),
              child: GestureDetector(
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const ProductDetailsScreen())),
                child: Container(
                  width: (sw / 2) - 32,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: easyWayList[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget uploadPrescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Quickly order with prescription."),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: boxBlueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Upload Prescription",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        uploadIcon,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget labTests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            "Lab tests",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            8,
            (index) => Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  labTest,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget membershipCard() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Get ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "+ Plus ",
                          style: TextStyle(
                            color: primaryBlueTextColor,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "membership",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            "Lörem ipsum dialabel bagon. Heterocism gure astrojilar sarat. Stenorevis yns pseudohet onade rödgrönrosa, lar. ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image.asset(
                          membership,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            bottom: 5,
            child: Container(
              color: yellowColor,
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: 8,
                  bottom: 8,
                  right: 40,
                ),
                child: Text("START SAVINGS"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget flatDiscountList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            "Flat Rs.50 cashback on lab tests",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text("Code: CSH50"),
        ),
        const SizedBox(
          height: 20,
        ),
        //
        SizedBox(
          height: 125,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen())),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        flatDiscount,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Product Name"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget featuredBrands() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Text(
            "Featured  brands",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen())),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            category,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text("Product Name"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget essentialsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Text(
            "EVERYDAY ESSENTIALS",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen())),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            essential,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rateUs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rate us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Lörem ipsum dialabel bagon. Heterocism gure astrojilar sarat. . ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                ratingStar,
                height: 125,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget giftCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "refer & earn 5% extra",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Lörem ipsum dialabel bagon. Heterocism gure astrojilar sarat. Stenorevis yns pseudohet onade rödgrönrosa, lar. ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                gift,
                height: 125,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
