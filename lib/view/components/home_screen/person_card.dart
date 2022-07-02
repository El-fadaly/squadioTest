import 'package:cached_network_image/cached_network_image.dart';
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
                /// avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: CachedNetworkImage(
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                    imageUrl: 'http://image.tmdb.org/t/p/original' + imageUrl,
                    alignment: Alignment.center,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// name
                    CustomText(
                      text: name,
                      fontSize: 17,
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    /// field
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

// CircleAvatar(
//   backgroundImage: NetworkImage(
//     imageUrl != ""
//         ? 'https://image.tmdb.org/t/p/original' + imageUrl
//         : "https://thumbs.dreamstime.com/b/person-icon-line-style-man-symbol-flat-isolated-white-background-simple-avatar-abstract-black-user-sign-vector-illustration-156936114.jpg",
//   ),
//   minRadius: 30,
// ),
