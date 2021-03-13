import 'package:ElMenus_ITI/About/views/About.dart';
import 'package:ElMenus_ITI/AddressBook/views/address_book.dart';
import 'package:ElMenus_ITI/Arabic/views/arabic.dart';
import 'package:ElMenus_ITI/ChangeEmail/views/change_email.dart';
import 'package:ElMenus_ITI/ChangePassword/views/change_password.dart';
import 'package:ElMenus_ITI/TermsPage/views/terms_of_service.dart';
import 'package:flutter/material.dart';
import '../../Orders/views/MyOrders.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Icon(
        //   Icons.arrow_back_outlined,
        //   color: Colors.black,
        // ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My account',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.person_outline,
                    color: Colors.grey[600],
                    size: 30,
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'My Orders',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrdersPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Change password',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Change Email',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeEmail(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'My address book',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressBook(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.grey[600],
                    size: 30,
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Arabic(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'ARABIC',
                              // style: TextStyle(fontSize: 18),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'ENGLISH',
                              style: TextStyle(
                                // fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'OTHER',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey[600],
                    size: 30,
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'About Us',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Terms of Service',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Terms(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
