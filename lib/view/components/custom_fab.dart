import 'package:flutter/material.dart';
import 'package:squadio_test/constants.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    Key? key,
    required this.isGrid,
    required this.onTapped,
  }) : super(key: key);

  final Function() onTapped;
  // final Function() onGridTapped;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: onTapped,
            child: const Icon(Icons.compare_arrows_sharp),
          )
        : FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: onTapped,
            child: const Icon(Icons.grid_3x3),
          );
  }
}
