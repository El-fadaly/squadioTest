import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:squadio_test/constants.dart';
import 'package:squadio_test/model/pooular_persons/images/profile_model.dart';

class ProfileController extends GetxController {
  late ProfileModel profile;

  late String selectedPersonName;

  void onDownloadProfileTapped() async {
    try {
      EasyLoading.show();
      var imageId = await ImageDownloader.downloadImage(
        'http://image.tmdb.org/t/p/original${profile.filePath}',
      );
      EasyLoading.dismiss();

      showSnackBar(
        title: "Done",
        message: "image  downloaded  successfully",
        textColor: Colors.green,
      );
      if (imageId == null) {
        return;
      }
    } catch (e) {
      EasyLoading.dismiss();

      showSnackBar(
        title: "Sorry",
        message:
            " something  went  wrong while downloading  image  please try again",
        textColor: kPrimaryColor,
      );
    }
  }

  void showSnackBar({title, message, textColor = Colors.white}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 4000),
      colorText: textColor,
    );
  }
}
