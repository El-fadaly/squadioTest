import 'package:flutter/material.dart';
import 'package:squadio_test/constants.dart';

class BuiltDots extends StatelessWidget {
  const BuiltDots({Key? key, required this.isSelected}) : super(key: key);

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 6,
      width: isSelected ? 20 : 6,
      decoration: BoxDecoration(
        color: isSelected ? kHeaderTextColor : Colors.grey[500],
        borderRadius: BorderRadius.circular(3),
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
