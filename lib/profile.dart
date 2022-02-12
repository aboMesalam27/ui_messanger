import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Me",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/260692625_1047138686079159_2302303826792626211_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=UnL8tS95yxAAX8dNXlM&_nc_ht=scontent-hbe1-1.xx&oh=00_AT-2EXhoYSyJJENXiCrKsy5MbBUekvx6Y2xXxEIPmReHjw&oe=6204840F"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Abdelrhman Abo Mesalam",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              //ListWheelScrollView.useDelegate(itemExtent: 75, childDelegate,)
            ],
          ),
        ),
      ),
    );
  }
}
