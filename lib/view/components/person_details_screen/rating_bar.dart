import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final num rating;
  // final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({
    this.starCount = 5,
    this.rating = .0,
    // this.onRatingChanged,
    required this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 20.0,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: 20.0,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: 20.0,
      );
    }
    return InkResponse(
      // onTap:
      //     onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
