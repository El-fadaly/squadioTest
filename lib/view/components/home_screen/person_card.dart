import 'package:flutter/material.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.field,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.popularity,
    required this.onTapped,
  }) : super(key: key);

  final String name;
  final String field;
  final String imageUrl;
  final String popularity;
  final String gender;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: onTapped,
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // avatar
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://image.tmdb.org/t/p/original' + imageUrl,
                  ),
                  minRadius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    CustomText(
                      text: name,
                      fontSize: 17,
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    // field
                    CustomText(
                      text: field,
                      fontSize: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
