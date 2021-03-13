import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:ElMenus_ITI/Restaurant/views/resturant_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// final List<String> imgList = [
//   'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fmix2meal.jpg?alt=media&token=3271ce2d-82f1-40b4-a348-5a8cc150716c',
//   'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fmac.jpg?alt=media&token=d221c5b6-45d4-4d56-ac01-d9d8ec5e2dc2',
//   'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fdmc%20chikn.jpg?alt=media&token=ce088480-ea44-4f22-8d00-cad25c76f379',
//   'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fbig%20mac.jpg?alt=media&token=437c33ac-7028-4847-8b69-b8014023d196',
//   'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fmix2meal.jpg?alt=media&token=3271ce2d-82f1-40b4-a348-5a8cc150716c',
// ];
var rating = 3.0;

class Resturants extends StatefulWidget {
  Resturants({Key key}) : super(key: key);

  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text(
                  'Restaurants',
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Switch.adaptive(activeColor: Colors.deepOrange, value: true,)
              ],
            )),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Restaurants')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something Went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot resturant = snapshot.data.docs[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(2, 0),
                                  blurRadius: 4,
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(6, 0),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RestaurantHome(
                                          restaurantId: resturant.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: Container(
                                      width: 340,
                                      // height: 240,
                                      child: Column(children: [
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            viewportFraction: 1.0,
                                            enlargeCenterPage: false,
                                          ),
                                          items: resturant
                                              .data()[
                                                  'restaurantFeaturedPhotos']
                                              .map<Widget>(
                                                (item) => Stack(
                                                  children: [
                                                    Container(
                                                        child: Image(
                                                            image: NetworkImage(
                                                                item),
                                                            fit: BoxFit.cover,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width)),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(7.0),
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        resturant
                                                            .data()['logo']),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    resturant.data()[
                                                        'restaurantName'],
                                                    textScaleFactor: 1.2,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    resturant.data()[
                                                        'restaurantType'],
                                                    textScaleFactor: 1.1,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0,
                                                  bottom: 8.0,
                                                  right: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SmoothStarRating(
                                                    rating: resturant
                                                        .data()['rate'],
                                                    isReadOnly: true,
                                                    size: 20,
                                                    filledIconData: Icons.star,
                                                    halfFilledIconData:
                                                        Icons.star_half,
                                                    defaultIconData:
                                                        Icons.star_border,
                                                    color: Colors.orange[800],
                                                    borderColor:
                                                        Colors.orange[800],
                                                    starCount: 5,
                                                    spacing: 1.5,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                              color: Colors.grey[400],
                                              width: 1,
                                            ))),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 170,
                                                  height: 60,
                                                  child: Center(
                                                    child: Wrap(
                                                      children: [
                                                        Icon(Icons
                                                            .directions_bike),
                                                        Text(
                                                          '40 min',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 160,
                                                  height: 60,
                                                  child: Center(
                                                    child: Wrap(children: [
                                                      Icon(
                                                        Icons
                                                            .fiber_manual_record,
                                                        color: Colors.green,
                                                      ),
                                                      Text(
                                                        'order online',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        )
                      ],
                    );
                  });
            }),
      ],
    );
  }
}
