import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          CustomText(
            text: title,
            fontSize: 18,
            fontColor: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
