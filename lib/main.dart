import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:spotjams/blocs/playerControl.dart';
import 'package:spotjams/home_page.dart';
import 'package:flutter/material.dart';
import 'package:spotjams/pages/login/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BlocProvider(

//        child: HomePage(),
        blocs: [Bloc((i) => PlayerControl())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'SF Pro Display'),
          title: "SpotJAMS",
          home: pageLogin(),
        )
    );
  }
}