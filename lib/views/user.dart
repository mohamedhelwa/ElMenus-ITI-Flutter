//import 'package:ElMenus_ITI/services/auth.dart';
import 'package:ElMenus_ITI/views/login.dart';
// import 'package:ElMenus_ITI/views/settings.dart';
import 'package:ElMenus_ITI/Settings/views/settings.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('My Profile', style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                 Navigator.push(
                 context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 65, left: 20),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.grey, spreadRadius: 5)
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
              ),

              StreamBuilder(
                stream: getSpecificUser(FirebaseAuth.instance.currentUser.uid),
                builder: (context, snapShot) {
                  if (!snapShot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Text(
                            "UnKnown",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    var document = snapShot.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Text(
                            document["name"],
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          document["email"],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 55,
                width: 320,
                color: Color(0xffE5533A),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.white),
                      Text("View Basket",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Sign out"),
              ),
            ],
          ),
        ));
  }


  Stream<DocumentSnapshot> getSpecificUser(String userId) {
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("users");
    DocumentReference docRef = collRef.doc(userId);
    return docRef.snapshots();
  }
}
