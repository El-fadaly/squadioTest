import 'package:flutter/material.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';

class PopularityRateWidget extends StatelessWidget {
  const PopularityRateWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        side: BorderSide(
          color: Colors.grey.withOpacity(.5),
          width: 2,
        ),
      ),
      // border:,
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomText(
          text: text,
          fontSize: 18,
          // fontColor: homeController.selectedPerson.gender == 1
          //     ? Colors.redAccent
          //     : Colors.blueAccent,
        ),
      ),
    );
  }
}
