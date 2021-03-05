import 'package:ElMenus_ITI/views/login.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
  MaterialApp(
    //debugShowCheckedModeBanner: false,
    home: Login(),
  )
);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('El-Menus'),
        ),
        body: Center(
          child: Login(),
        ),
      ),
    );
  }
}
