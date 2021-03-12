import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  // addReview() {
  //   Map<String, dynamic> review = {'name': 'Ahmed'};
  //   CollectionReference reviews =
  //       FirebaseFirestore.instance.collection('Reviews');
  //   reviews.add(review);
  //   print('in add');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Reviews(),
      ),
    );
  }
}
