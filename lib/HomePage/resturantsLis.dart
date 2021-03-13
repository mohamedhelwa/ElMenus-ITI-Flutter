import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:ElMenus_ITI/Restaurant/views/resturant_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
                                      // width: 340,
                                      // height: 240,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                                    .width),
                                                      ),
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  margin: EdgeInsets.all(7.0),
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            resturant.data()[
                                                                'logo']),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: SmoothStarRating(
                                                        rating: resturant
                                                            .data()['rate'],
                                                        isReadOnly: true,
                                                        size: 20,
                                                        filledIconData:
                                                            Icons.star,
                                                        halfFilledIconData:
                                                            Icons.star_half,
                                                        defaultIconData:
                                                            Icons.star_border,
                                                        color:
                                                            Colors.orange[800],
                                                        borderColor:
                                                            Colors.orange[800],
                                                        starCount: 5,
                                                        spacing: 1.5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Expanded(
                                              //   child: Row(
                                              //     // mainAxisAlignment:
                                              //     //     MainAxisAlignment.end,
                                              //     children: [
                                              //
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Colors.grey[400],
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    // width: 170,
                                                    // height: 60,
                                                    child: Center(
                                                      child: Wrap(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 16),
                                                            child: Icon(Icons
                                                                .directions_bike),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8,
                                                                    top: 5),
                                                            child: Text(
                                                              '40 min',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
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
                                                      child: Wrap(
                                                        children: [
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
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
