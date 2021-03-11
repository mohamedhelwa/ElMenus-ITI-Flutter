import 'package:flutter/cupertino.dart';

class Review {
  String userName;
  String userId;
  String reviewText;
  String ratingValue;
  String restaurantId;

  Review({
    @required this.userName,
    @required this.reviewText,
    @required this.ratingValue,
    this.userId,
    this.restaurantId,
  });
}
