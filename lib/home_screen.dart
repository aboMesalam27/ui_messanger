import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _pickedfile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    Widget getStoryRow(String text) {
      return Container(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU"),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3, end: 3),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              maxLines: 2,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    Widget getStoryColumn(String textName, String textChat, String textTime) {
      return Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                children: [
                  Text(textChat),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    height: 5,
                    width: 5,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(textTime)
                ],
              ),
            ],
          )
        ],
      );
    }


    void getCamera(BuildContext context) async {
      final file = await picker.pickImage(
        source: ImageSource.camera,
      );
      if (file != null) {
        setState(() {
          _pickedfile = File(file.path);
        });
      }Navigator.pop(context);
    }

    void getCGallary(BuildContext context) async {
      final file = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (file != null) {
        setState(() {
          _pickedfile = File(file.path);
        });
      }Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black12,
            child: IconButton(
                onPressed: () async{
              showDialog<int>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("Upload Photo"),
                            content:
                                const Text("Choose From Camera Or Gallary"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                 getCamera(context);
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          radius: 20,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {
                                  getCGallary(context);
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          radius: 20,
                                          child: Icon(
                                            Icons.image,
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Gallary",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )),
                            ],
                          ));
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 25,
                )),
          ),
          SizedBox(
            width: 13,
          ),
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black12,
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "grid");
                },
                icon: Icon(
                  Icons.edit_rounded,
                  color: Colors.black,
                  size: 25,
                )),
          ),
          SizedBox(
            width: 13,
          ),
        ],
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "profile");
              },
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/260692625_1047138686079159_2302303826792626211_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=UnL8tS95yxAAX8dNXlM&_nc_ht=scontent-hbe1-1.xx&oh=00_AT-2EXhoYSyJJENXiCrKsy5MbBUekvx6Y2xXxEIPmReHjw&oe=6204840F"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Chats",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          if (_pickedfile != null)
            Image.file(
              _pickedfile!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (o){
                    o.disallowGlow();return true;
                  },
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black12),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Search")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (o){
                          o.disallowGlow();return true;
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              getStoryRow("Hany"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Hady"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Zaki"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Reda"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Hany"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Zaki"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Reda"),
                              SizedBox(
                                width: 10,
                              ),
                              getStoryRow("Hany"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (o){
                          o.disallowGlow();return true;
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Esraa Mohamed", "How are you?", "1:20Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Ola Ahmed", "Wht are you?", "1:40Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Alaa Mahmoud", "Hi !", "1:20Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn(
                                  "Gana Ali Ahmed", "Check your phone", "7:20Am"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn(
                                  "Rana Youssef", "Welcome flutter", "4:00Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Esraa Gamal", "How are you?", "1:20Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn(
                                  "Yassmen Mohamed ", "send me your email", "6:30Am"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Aya Ali", "send me your email", "6:30Am"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Nourhan Gamal", "You are ok ?", "3:20Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Hanin Mohamed", "Welcome here", "1:25Pm"),
                              SizedBox(
                                height: 10,
                              ),
                              getStoryColumn("Esraa Hassan", "How are you?", "1:20Pm"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
