import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/controller/profile_controller.dart';
import 'package:squadio_test/view/components/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String id = "ProfileScreen";
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    print(" width  ${profileController.profile.width?.toDouble()}");
    print(" height  ${profileController.profile.height?.toDouble()}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: NavBar(
                title: profileController.selectedPersonName,
                haveIcon: true,
                color: Colors.white,
                onIconTapped: () => profileController.onDownloadProfileTapped(),
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                width: profileController.profile.width?.toDouble() ??
                    double.infinity,
                height: profileController.profile.height?.toDouble() ??
                    double.infinity,
                imageUrl:
                    'http://image.tmdb.org/t/p/original${profileController.profile.filePath}',
                alignment: Alignment.center,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
