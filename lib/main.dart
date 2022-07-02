import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:squadio_test/view/screen/home_screen.dart';
import 'package:squadio_test/view/screen/person_details_screen.dart';
import 'package:squadio_test/view/screen/profile_screen.dart';
import 'package:toast/toast.dart';

void main() {
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
    ToastContext().init(context);

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
