import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatefulWidget {
  final String userName;
  final String reviewText;
  final double ratingValue;

  ReviewCard({this.userName, this.reviewText, this.ratingValue});
  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  final Color helpfulActiveColor = Colors.deepOrange;
  final Color helpfulInActiveColor = Colors.grey[800];
  bool flag = false;
  IconData helpfulIcon = Icons.thumb_up_alt_outlined;

  void changeIcon() {
    if (flag) {
      helpfulIcon = Icons.thumb_up_alt_outlined;
    } else {
      helpfulIcon = Icons.thumb_up;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 27.0,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RatingBarIndicator(
                        rating: widget.ratingValue,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  widget.reviewText,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      changeIcon();
                      flag = !flag;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        helpfulIcon,
                        color: flag == true
                            ? helpfulActiveColor
                            : helpfulInActiveColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Helpful',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
