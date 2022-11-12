import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              lightBlue,
              darkBlue,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      )),
    );
  }
}
