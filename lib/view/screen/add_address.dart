import 'package:flutter/material.dart';
import 'package:testmedicalapp/util/constants.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController billToController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              children: [
                customAppBar(),
                const SizedBox(
                  height: 30,
                ),
                addressForm(),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: w * 0.7,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {},
                  color: boxBlueColor,
                  child: const Text(
                    "Save And Continue",
                    style: TextStyle(color: white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.arrow_back,
          color: white,
        ),
        Expanded(
          child: Text(
            "ADD ADDRESS",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget addressForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Bill to
        formField("Bill To*", "", billToController),
        // Mobile Number
        formField("Mobile Number*", "", mobileController),
        // Pin Code
        SizedBox(
          width: 300,
          child: formField("Pin Code*", "", pinCodeController),
        ),
        formField("House Number & Building**", "", houseNumberController),
        formField("street name**", "", streetNameController),
        const Text(
          "Address Type*",
          style: TextStyle(color: white, fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            addressType("Home", Icons.home, true, "7am -10pm"),
            addressType("Work", Icons.home, false, "10am -10pm"),
            addressType("Other", Icons.other_houses, false, "9am -10pm"),
          ],
        )
      ],
    );
  }

  Widget addressType(
      String label, IconData iconData, bool isSelected, String time) {
    return Expanded(
      child: Column(
        children: [
          ChoiceChip(
            label: Text(label),
            selected: isSelected,
            avatar: Icon(
              iconData,
              color: Colors.black,
            ),
            selectedColor: white,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "7am -10pm",
              style: TextStyle(color: white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget formField(
      String label, String? helperText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: white),
        helperText: helperText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
