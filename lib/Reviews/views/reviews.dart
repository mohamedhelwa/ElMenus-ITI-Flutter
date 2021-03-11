import 'package:flutter/material.dart';
import 'reviewCard.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool submitBtnVisibility = false;

  String userName = "Mohamed";
  String reviewRate = "3";
  String reviewText = "Good";

  addReview() {
    Map<String, dynamic> review = {
      'userName': userName,
      'reviewRate': reviewRate,
      'reviewText': reviewText
    };

    CollectionReference reviews =
        FirebaseFirestore.instance.collection('Reviews');
    reviews.add(review);
    print('New review added successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Reviews',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 30, bottom: 10),
                  child: Text(
                    'Ate here before?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: RaisedButton(
                          color: Colors.deepOrange,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Add review',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              submitBtnVisibility = !submitBtnVisibility;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: submitBtnVisibility,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Rate: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    reviewRate = (rating.round()).toString();
                                    print(rating);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Write your review here',
                          ),
                          maxLines: 3,
                          onChanged: (text) {
                            setState(() {
                              reviewText = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          color: Colors.deepOrange,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            submitBtnVisibility = !submitBtnVisibility;
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            addReview();
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Thank you'),
                                content: const Text(
                                  'Your review is added!',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Dismiss'),
                                    child: const Text('Dismiss'),
                                  ),
                                ],
                              ),
                            );
                            print('Last line in submit!');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '12 Reviews',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ReviewCard(
                  userName: "Mohamed Ahmed",
                  reviewText: "Good",
                  ratingValue: 4,
                ),
                SizedBox(
                  height: 20,
                ),
                ReviewCard(
                  userName: "Osama Gamal",
                  reviewText: "Very good",
                  ratingValue: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                ReviewCard(
                  userName: "Maged Nasr",
                  reviewText: "Very bad",
                  ratingValue: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                ReviewCard(
                  userName: "Ali hasan",
                  reviewText: "Not bad",
                  ratingValue: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ReviewCard(
                  userName: "Sara Kamal",
                  reviewText: "Amazing, Thanks",
                  ratingValue: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
