import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:flutter/material.dart';
import 'reviewCard.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reviews extends StatefulWidget {
  String restaurantId;
  Reviews({this.restaurantId});
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool submitBtnVisibility = false;

  String userName = "Mohamed";
  String reviewRate = "3";
  String reviewText = "Good";

  CollectionReference reviews =
      FirebaseFirestore.instance.collection('Reviews');
  addReview() {
    Map<String, dynamic> review = {
      'userName': userName,
      'reviewRate': reviewRate,
      'reviewText': reviewText,
      'restaurantId': widget.restaurantId,
      'userId': '4mh6SRXFqtWfeuQfXJ9Z48WMCeu1'
    };
    reviews.add(review);
    print('New review added successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
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
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        submitBtnVisibility = !submitBtnVisibility;
                        FocusScopeNode currentFocus = FocusScope.of(context);
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
            StreamBuilder<QuerySnapshot>(
                stream: reviews
                    .where('restaurantId', isEqualTo: widget.restaurantId)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something Went wrong'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  }
                  return Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot review = snapshot.data.docs[index];
                        return ReviewCard(
                          userName: review.data()['userName'],
                          reviewText: review.data()['reviewText'],
                          ratingValue:
                              double.parse(review.data()['reviewRate']),
                        );
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
