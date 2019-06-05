import 'dart:ui';

import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';


const double minHeight = 80;

class PlayerFull extends StatefulWidget {
    @override
    _PlayerFull createState() => _PlayerFull();
}

class _PlayerFull extends State<PlayerFull>
    with SingleTickerProviderStateMixin {
    //AnimationController _controller;
    @override
    void initState() {
        super.initState();

    }


    @override
    Widget build(BuildContext context) {
        return Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
                child: Container(
                  child: CardAlbum()
//                  Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//
//                          CardAlbum(assetName: "steve-johnson.jpeg", offset: 1,),
//                          Spacer(flex: 1,),
//                          Text("Teste meio"),
//                          Container(
//                              child: Container (
//                                 child : Text("Teste"),
//                              ),
//                          )
//                      ]
//                  )
                )
            )
        );
    }


}

class CardAlbum extends StatelessWidget{

//    final String assetName;
//    final double offset;
//
//    const CardAlbum({
//        Key key,
//        @required this.assetName,
//        @required this.offset,
//    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
//        double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
      return Transform.translate(
            offset: Offset(45, 0),
            child: Container(
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),

                child: Column(
                    children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.all({30,
                              20,
                              30,
                              30,}),
                            child: Image.asset(
                                'assets/steve-johnson.jpeg',
                                height: MediaQuery.of(context).size.height * 0.3,

                            ),
                        ),
//                        SizedBox(height: 1),
                    ],
                ),
            ),
        );
    }
}

class PlayButton extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Positioned(
            //<-- Align the icon to bottom right corner
            right: 0,
            bottom: 24,
            child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 28,
            ),
        );
    }
}


class Header extends StatelessWidget {
    final double fontSize;
    final double topMargin;

    const Header(
        {Key key, @required this.fontSize, @required this.topMargin})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Music"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Almbum"),
                      ],
                    ),
                  ]
              )
          )
      ) ;

    }
}
