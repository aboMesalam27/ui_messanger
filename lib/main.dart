import 'package:flutter/material.dart';
import 'package:ui_messanger/gridview.dart';
import 'package:ui_messanger/profile.dart';

import 'home_screen.dart';

main() => runApp(UiMassenger());

class UiMassenger extends StatefulWidget {
  const UiMassenger({Key? key}) : super(key: key);

  @override
  _UiMassengerState createState() => _UiMassengerState();
}


class _UiMassengerState extends State<UiMassenger> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      title: 'Massenger',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        "grid":(context)=>Grid(),
        "profile":(context)=>Profile(),
      },
    );
  }
}
