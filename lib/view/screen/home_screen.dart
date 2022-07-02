import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadio_test/controller/home_controller.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';
import 'package:squadio_test/view/components/home_screen/person_card.dart';
import 'package:squadio_test/view/components/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String id = 'HomeScreen';

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const NavBar(title: 'Popular People'),
              Expanded(
                child: GestureDetector(
                  onTap: () => homeController.getPopularPeopleFromService(),
                  child: GetBuilder<HomeController>(
                    builder: (controllerValue) => ListView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: controllerValue.scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: controllerValue.persons.length + 1,
                      itemBuilder: (context, index) {
                        if (index < controllerValue.persons.length) {
                          final person = controllerValue.persons[index];
                          return PersonCard(
                            field: person.knownForDepartment ?? "",
                            name: person.name ?? "",
                            imageUrl: person.profilePath ?? "",
                            gender: person.gender == 1 ? "female" : "male",
                            popularity: person.popularity.toString(),
                            onTapped: () =>
                                controllerValue.openPersonDetailsScreen(index),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Center(
                              child: controllerValue.hasMoreData
                                  ? const CircularProgressIndicator()
                                  : const CustomText(
                                      text: 'there no mre actors to get ',
                                      fontSize: 15,
                                    ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
