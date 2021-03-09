import 'package:flutter/material.dart';

class DiscoverMood extends StatefulWidget {
  DiscoverMood({Key key}) : super(key: key);

  @override
  _DiscoverMoodState createState() => _DiscoverMoodState();
}

class _DiscoverMoodState extends State<DiscoverMood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Discover By Mood ',
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fd1.jpg?alt=media&token=1f79a2e7-58b2-4902-959d-ee6bc96b565f'),
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    ),
                  )),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fd2.jpg?alt=media&token=10fb8a1e-44ce-40e8-b3e5-0bf122bb0ee8'),
                      fit: BoxFit.cover,
                      width: 170,
                      height: 180,
                    ),
                  )),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fd3.jpg?alt=media&token=cc261e4f-9f8e-4f34-811f-51dedfd6a312'),
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    ),
                  )),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FapplicationImgs%2Fd4.jpg?alt=media&token=5a8f344e-bc97-4363-b62e-da0a9f921ab4'),
                      fit: BoxFit.cover,
                      width: 170,
                      height: 185,
                    ),
                  )),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
