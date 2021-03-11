import 'package:ElMenus_ITI/models/user_model.dart';
import 'package:ElMenus_ITI/views/login.dart';
import 'package:ElMenus_ITI/views/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
            image: AssetImage("assets/images/cover.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Discover & Order the food you love.",
                      style: TextStyle(color: Colors.white, fontSize: 34),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 20),
                                child: TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.supervised_user_circle),
                                      hintText: " Enter Username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                      ) //InputBorder.none
                                      ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 0),
                                child: TextField(
                                  controller: _emailcontroller,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail),
                                      hintText: " Enter Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                      ) //InputBorder.none
                                      ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 30),
                                child: TextField(
                                  controller: _passwordcontroller,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      hintText: "Enter Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                      )),
                                  autofocus: false,
                                  obscureText: true,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  register(context);
                                },
                                child: Container(
                                  height: 45,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffE5533A)),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 43.0),
                          child: Row(
                            children: [
                              Text(
                                "Already Have An Account ? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  child: Text(
                                    " Sign In",
                                    style: TextStyle(color: Color(0xffE5533A)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void register(BuildContext context) async {
    bool flag = false;
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential credentail = await auth.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
      if (credentail != null) {
        flag = true;
        print("object");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-is-use") {
        print("this email already is used");
      }
      if (e.code == "invalid-email") {
        print("this email is invalid");
      }
      if (e.code == "weak-password") {
        print("this password is waek");
      }
    } catch (e) {
      print("false catch");
    }
    if (flag == true) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      String name = _nameController.text.trim();
      String email = _emailcontroller.text.trim();
      Map<String, bool> userType = {
        "admin": false,
        "normalUser": true,
      };
      UserModel user = UserModel(userId, name, email, userType);
      addData(user, context);
    } else {
      print("This email already exist");
    }
  }

  void addData(UserModel user, BuildContext context) async {
    Map<String, dynamic> data = {
      "email": user.email,
      "name": user.name,
      "roles": user.checkUserType,
      "uid": user.id,
    };
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("users");
    DocumentReference docRef = collRef.doc(user.id);
    await docRef.set(data).whenComplete(() {
      print("true");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => UserPage()));
    }).catchError((onError) => print(onError.toString()));
  }
}
