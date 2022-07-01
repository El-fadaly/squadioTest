import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:squadio_test/constants.dart';

class ProfileSlider extends StatelessWidget {
  final String profileImage;
  final int currentPage = 1;
  final Function() onTap;

  const ProfileSlider({
    Key? key,
    required this.profileImage,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: 'http://image.tmdb.org/t/p/original' + profileImage,
              alignment: Alignment.center,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}
