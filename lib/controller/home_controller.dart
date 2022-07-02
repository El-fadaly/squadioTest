import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/config/api_keys.dart';
import 'package:squadio_test/config/api_urls.dart';
import 'package:squadio_test/controller/profile_controller.dart';
import 'package:squadio_test/model/pooular_persons/images/images_model.dart';
import 'package:squadio_test/model/pooular_persons/images/profile_model.dart';
import 'package:squadio_test/model/pooular_persons/person_model.dart';
import 'package:squadio_test/model/pooular_persons/popular_person_model.dart';
import 'package:squadio_test/services/http_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:squadio_test/view/components/custom_alert_dialog.dart';
import 'package:squadio_test/view/screen/person_details_screen.dart';
import 'package:squadio_test/view/screen/profile_screen.dart';

class HomeController extends GetxController {
  HttpService httpService = HttpService();
  bool isLoading = false;

  late PopularPersonModel popularPersonModel;
  List<PersonModel> persons = [];
  int page = 1;
  bool hasMoreData = true;

  final scrollController = ScrollController();

  PersonModel selectedPerson = PersonModel();

  late ImagesModel images;
  List<ProfileModel> profiles = [];

  int indexBanner = 0;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    httpService.init();
    getPopularPeopleFromService();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          if (page < (popularPersonModel.totalPages ?? 0)) {
            print('max');
            getPopularPeopleFromService();
          } else {
            hasMoreData = false;
            print('has no MoreData');
          }
          update();
        }
      },
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }

  void getPopularPeopleFromService() async {
    if (isLoading) return;
    print('page  $page');
    isLoading = true;
    try {
      final response = await httpService.request(
        url: ApiUrls.popularPeople +
            '?api_key=' +
            ApiKeys.moviesDatabaseApiKey +
            '&page=$page',
        method: Method.GET,
      );
      if (response != null) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            popularPersonModel = PopularPersonModel.fromJson(response.data);
            persons.addAll(popularPersonModel.results ?? []);
            page++;
            print('total results' + persons.length.toString());
          } else {
            showAlertDialog(
              title: 'Sorry',
              description: 'something went wrong please try again  ',
              actionText: 'try again',
              actionOnPress: () {
                Get.back();
                getPopularPeopleFromService();
              },
              cancelText: 'cancel',
              cancelOnPress: () => Get.back(),
            );
          }
        }
      }
    } catch (e) {
      print("exception in getting  popular  persons $e");
    }
    isLoading = false;
    update();
  }

  Future<void> getPersonImagesFromService() async {
    if (isLoading) return;
    print('page  $page');
    isLoading = true;
    try {
      final response = await httpService.request(
        url: ApiUrls.person +
            '/${selectedPerson.id}/images' +
            '?api_key=' +
            ApiKeys.moviesDatabaseApiKey,
        method: Method.GET,
      );
      if (response != null) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            images = ImagesModel.fromJson(response.data);
            profiles = images.profiles ?? [];
            print('total images  = ' + profiles.length.toString());
          } else {
            showAlertDialog(
              title: 'Sorry',
              description: 'something went wrong please try again  ',
              actionText: 'try again',
              actionOnPress: () {
                Get.back();
                getPersonImagesFromService();
              },
              cancelText: 'cancel',
              cancelOnPress: () => Get.back(),
            );
          }
        }
      }
    } catch (e) {
      print("exception in getting  popular  persons images $e");
    }
    isLoading = false;
    update();
  }

  void openPersonDetailsScreen(index) async {
    selectedPerson = persons[index];
    await getPersonImagesFromService();
    print('selected person name  ${selectedPerson.name}');
    Get.toNamed(PersonDetailsScreen.id);
  }

  void onProfileTapped(index) {
    print("profile  index $index");
    final profileController = Get.put(ProfileController());
    profileController.profile = profiles[index];
    profileController.selectedPersonName = selectedPerson.name ?? "";
    Get.toNamed(ProfileScreen.id);
  }

  void onCarouselPageChanged(index) {
    indexBanner = index;
    update();
  }

  void showAlertDialog({
    required String title,
    required String description,
    required String actionText,
    required Function() actionOnPress,
    required String cancelText,
    required Function() cancelOnPress,
  }) {
    showDialog(
      context: Get.context!,
      builder: (_) => CustomAlertDialog(
        actionText: actionText,
        actionOnPress: actionOnPress,
        cancelText: cancelText,
        cancelOnPress: cancelOnPress,
        title: title,
        description: description,
      ),
    );
  }
}
