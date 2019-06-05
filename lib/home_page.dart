import 'package:spotjams/exhibition_bottom_sheet.dart';
import 'package:spotjams/playerFull.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';
//import 'package:spotjams/playerWidget.dart';
import 'package:spotjams/sliding_cards.dart';
import 'package:spotjams/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PlayerWidget(url: "http://tegos.kz/new/mp3_full/Luis_Fonsi_feat._Daddy_Yankee_-_Despacito.mp3")//Stack(
//        children: <Widget>[
//          SafeArea(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                SizedBox(height: 8),
//                Header(),
//                SizedBox(height: 40),
//                Tabs(),
//                SizedBox(height: 8),
//                SlidingCardsView(),
//              ],
//            ),
//          ),
//          PlayerWidget(),
//        ],
//      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Shenzhen',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
