import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/controller/home_controller.dart';
import 'package:squadio_test/view/components/custom_fab.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';
import 'package:squadio_test/view/components/nav_bar.dart';
import 'package:squadio_test/view/components/person_details_screen/built_dot_widget.dart';
import 'package:squadio_test/view/components/person_details_screen/profile_slider.dart';
import 'package:squadio_test/view/components/person_details_screen/known_for_widget.dart';
import 'package:squadio_test/view/components/person_details_screen/popularity_rate_widget.dart';

class PersonDetailsScreen extends StatelessWidget {
  PersonDetailsScreen({Key? key}) : super(key: key);

  static const String id = 'PersonDetailsScreen';
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GetBuilder<HomeController>(
          builder: (controllerValue) => CustomFab(
            isGrid: controllerValue.isGrid,
            onTapped: () => controllerValue.changeProfilesLayoutShape(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavBar(title: homeController.selectedPerson.name ?? ""),
            GetBuilder<HomeController>(
              builder: (controllerValue) => controllerValue.isGrid
                  ?

                  /// image  grid

                  SizedBox(
                      height: 300,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (_, index) {
                          final profile = homeController.profiles[index];
                          return ProfileImage(
                            profileImage: profile.filePath ?? "",
                            onTap: () => homeController.onProfileTapped(index),
                          );
                        },
                        itemCount: homeController.profiles.length,
                      ),
                    )

                  /// images  slider

                  : Column(
                      children: [
                        // slider
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) =>
                                homeController.onCarouselPageChanged(index),
                            height: 270,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                          ),
                          itemCount: homeController.profiles.length,
                          itemBuilder: (context, itemIndex, realIndex) {
                            print("index  $itemIndex");
                            final profile = homeController.profiles[itemIndex];
                            print("image  path ${profile.filePath}");
                            return ProfileImage(
                              profileImage: profile.filePath ?? "",
                              onTap: () =>
                                  homeController.onProfileTapped(itemIndex),
                            );
                          },
                        ),

                        GetBuilder<HomeController>(
                          builder: (controllerValue) => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                homeController.profiles.length,
                                (index) => BuiltDots(
                                  isSelected:
                                      homeController.indexBanner == index,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),

            const SizedBox(
              height: 20,
            ),

            // gender  and  popularity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///  gender
                  PopularityRateWidget(
                    text: homeController.selectedPerson.gender == 1
                        ? "female"
                        : "male",
                  ),

                  /// popularity
                  PopularityRateWidget(
                    text: "${homeController.selectedPerson.popularity}",
                  ),

                  /// known for
                  PopularityRateWidget(
                    text: "${homeController.selectedPerson.knownForDepartment}",
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            /// known for
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomText(
                text: "Known For",
                fontSize: 18,
                fontColor: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Expanded(
              // height: 300,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  onPageChanged: (index, reason) =>
                      homeController.onCarouselPageChanged(index),
                  height: MediaQuery.of(context).size.height / 2.5,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  viewportFraction: 0.65,
                  enlargeCenterPage: true,
                ),
                itemCount: homeController.selectedPerson.knownFor?.length,
                itemBuilder: (context, itemIndex, realIndex) {
                  final item =
                      homeController.selectedPerson.knownFor?[itemIndex];
                  print('name  ${item?.originalTitle}');
                  return KnownForWidget(
                    image: item?.posterPath ?? "",
                    name: item?.originalTitle ?? item?.originalName ?? " ",
                    rate: item?.voteAverage ?? 0.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
