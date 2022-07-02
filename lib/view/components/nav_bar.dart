import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.title,
    this.haveIcon = false,
    this.onIconTapped,
    this.color = Colors.black,
  }) : super(key: key);

  final String title;
  final bool haveIcon;
  final Function()? onIconTapped;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: color,
            ),
          ),
          CustomText(
            text: title,
            fontSize: 18,
            fontColor: color,
          ),
          haveIcon
              ? GestureDetector(
                  onTap: onIconTapped,
                  child: const Icon(
                    Icons.download_outlined,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(
                  width: 10,
                ),
        ],
      ),
    );
  }
}
