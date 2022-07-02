import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:squadio_test/view/screen/home_screen.dart';
import 'package:squadio_test/view/screen/person_details_screen.dart';
import 'package:squadio_test/view/screen/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var path = Directory.current.path;
  await Hive.initFlutter();
  runApp(const SquadioTest());
}

class SquadioTest extends StatefulWidget {
  const SquadioTest({Key? key}) : super(key: key);

  @override
  State<SquadioTest> createState() => _SquadioTestState();
}

class _SquadioTestState extends State<SquadioTest> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        PersonDetailsScreen.id: (context) => PersonDetailsScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
