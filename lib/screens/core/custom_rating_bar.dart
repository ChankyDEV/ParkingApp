import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final double minRating;
  final int maxRating;

  const CustomRatingBar({Key key, this.rating, this.minRating, this.maxRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.amberAccent[200],
        );
      },
      itemSize: 20.0,
      itemCount: 5,
      direction: Axis.horizontal,
    );
  }
}
