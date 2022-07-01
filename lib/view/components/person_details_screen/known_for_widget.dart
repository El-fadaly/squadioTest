import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';
import 'package:squadio_test/view/components/person_details_screen/rating_bar.dart';

class KnownForWidget extends StatelessWidget {
  const KnownForWidget(
      {Key? key, required this.image, required this.name, required this.rate})
      : super(key: key);

  final String image;
  final String name;
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          // image
          Expanded(
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: 'http://image.tmdb.org/t/p/original' + image,
              alignment: Alignment.center,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "$rate",
                      fontColor: Colors.blueAccent,
                    ),
                    StarRating(
                      rating: rate / 2,
                      color: const Color(0xFFF8D056),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
