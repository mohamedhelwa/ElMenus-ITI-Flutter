import 'package:ElMenus_ITI/models/user_model.dart';
import 'package:ElMenus_ITI/views/MainPage.dart';
import 'package:ElMenus_ITI/views/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _validateEmail(String value) {
    if (value.isEmpty) return 'Email is required.';

    final RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailExp.hasMatch(value)) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';

    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 6) return 'password must be more than 6 characters';
    if (value.isEmpty) return 'this field is required.';

    return null;
  }

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
                      textAlign: TextAlign.center,
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 20),
                                child: TextFormField(
                                  validator: _validateName,
                                  controller: _nameController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.deepOrange,
                                      ),
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
                                child: TextFormField(
                                  validator: _validateEmail,
                                  controller: _emailcontroller,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                      ),
                                    ),

                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.deepOrange,
                                    ),
                                    hintText: " Enter Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15.0),
                                      ),
                                    ), //InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 30),
                                child: TextFormField(
                                  validator: _validatePassword,
                                  controller: _passwordcontroller,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.deepOrange,
                                    ),
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  autofocus: false,
                                  obscureText: true,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    register(context);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Please Complete required fields",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.deepOrange,
                                      fontSize: 20.0,
                                    );
                                  }
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have An Account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    ModalRoute.withName("/Login"));
                              },
                              child: Text(
                                " Sign In",
                                style: TextStyle(color: Color(0xffE5533A)),
                              ),
                            ),
                          ],
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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          ModalRoute.withName("/MainPage"));
    }).catchError((onError) => print(onError.toString()));
  }
}
