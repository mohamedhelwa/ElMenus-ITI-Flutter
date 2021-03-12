import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

const items = [
  'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2F655ebca6-61b2-4d19-a5ef-4838e5c629c6.jpg?alt=media&token=4723964d-c29e-43bd-b7ba-1babda1af6a2',
  'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fall-tags.png?alt=media&token=2f9007bc-1790-49bd-997c-a2337621c27f',
  'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fb9b777b2-f8cc-4a0f-aa99-9a20fed1b7a6.jpg?alt=media&token=8b1d3344-28f7-46c6-a98a-d61a046695e0',
  'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fd6e68d3d-868b-4b2d-b630-adc09823375b.jpg?alt=media&token=6c8e60b2-8f0c-40e0-b8af-18c72fddc8bf',
];

class Carosel extends StatefulWidget {
  Carosel({Key key}) : super(key: key);

  @override
  _CaroselState createState() => _CaroselState();
}

class _CaroselState extends State<Carosel> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0,bottom: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Discover By Dish',
            textScaleFactor: 1.5,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 180.0,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Restaurants')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something Went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot resturant = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(items[index]),
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              resturant.data()['restaurantType'],
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }))
    ]);
  }
}
