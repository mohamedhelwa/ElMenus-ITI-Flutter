import 'package:flutter/material.dart';

class GiftMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Gift Meals',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Give the gift of great food to your friends or teams at work',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 5,
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrange,
                ),
              ),
              Text(
                'We listened to your requests and launched elmenus GiftMeals, a simple way for you to share promos with friends or teams at work so everyone can enjoy great food wherever they are.',
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'Send Gifts to your teams',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'Send Gifts to your friends',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.deepOrange)),
              ),
              SizedBox(
                height: 30,
              ),
              Image(image: AssetImage('assets/images/gifting.png')),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'Bring Happiness To Your Team or to your Friends',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage('assets/images/amount.png')),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Set a gift amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Set your budget for each GiftMeal (e.g. 10 EGP) and select how many GiftMeals you would like to buy.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage('assets/images/phones.png')),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'List your friends or teams',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Easily copy & paste phone numbers to send multiple GiftMeals to your teams and friends.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage('assets/images/friends.png')),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Pay the full amount online',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Once you purchase the GiftMeals, you\'ll receive a confirmation email and your friends/teams will receive an SMS with the GiftMeal promo code.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage('assets/images/gifts.png')),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'They receive the GiftMeals',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The people you gifted can use their personalized GiftMeal promo code via their associated phone number to order great dishes on elmenus.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
