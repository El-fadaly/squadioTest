import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/controller/home_controller.dart';

class PersonDetailsScreen extends StatelessWidget {
  PersonDetailsScreen({Key? key}) : super(key: key);

  static const String id = 'PersonDetailsScreen';
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text(homeController.selectedPerson.name ?? "")),
      ),
    );
  }
}
