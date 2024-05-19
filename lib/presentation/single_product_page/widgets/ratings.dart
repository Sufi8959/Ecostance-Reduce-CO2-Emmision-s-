import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_1/flutter_rating_bar_1.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    Key? key,
    required this.rating,
    required this.ratingCount,
    this.size = 24,
  }) : super(key: key);

  final double rating;
  final int ratingCount;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      tapOnlyMode: true,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.productsStartColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      itemSize: size,
      allowUpdate: false,
    );
  }
}
