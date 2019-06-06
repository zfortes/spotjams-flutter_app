import 'dart:ui';

import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double minHeight = 80;
const url2 = "https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";

class PlayerWidget extends StatefulWidget {
  AudioPlayer audioPlayer;
  PlayerWidget({Key key,@required this.audioPlayer}) : super(key: key);


  @override
  _PlayerWidget createState() => new _PlayerWidget(audioPlayer);
}

class _PlayerWidget extends State<PlayerWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

  double get headerTopMargin => lerp(20, 20 + MediaQuery.of(context).padding.top); //<-- Add new property

  double get headerFontSize => lerp(14, 24);


  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
              height: lerp(minHeight, maxHeight),
              //<-- update height value to scale with controller
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                //<-- add a gesture detector
                onTap: _toggle,
                onVerticalDragUpdate: _handleDragUpdate,
                //<-- Add verticalDragUpdate callback
                onVerticalDragEnd: _handleDragEnd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: const BoxDecoration(
                    color: Color(0xFF162A49),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Scaffold(
//            body: Align(
//              alignment: Alignment.topLeft,
                      body: SafeArea(
                          child: Column(
                              children: <Widget> [
                                Header(),
                                HeaderMusic(artistName: "Martin", musicName: "Acces",),
                                CardAlbum(),
                                Container(
                                    child:  Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.arrow_back_ios),
                                                color: Colors.grey,
                                                iconSize: 48,
                                                onPressed: pause,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.play_arrow),
                                                color: Colors.grey,
                                                iconSize: 48,
                                                onPressed: play,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.arrow_forward_ios),
                                                color: Colors.grey,
                                                iconSize: 48,
                                                onPressed: play,
                                              ),
                                            ]
                                        )
                                    )
                                ),
                                IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: play,
                                )
                              ]
                          )
//              )
                      )
                  )
                ),
              ));
        });


  }


  void play() async{

//    int result = await audioPlayer.play(url2);
//    audioPlayer.onDurationChanged.listen((Duration d) {
//      print('Max duration:');
//
//    });
//      Duration audioPlayer.duration;
//      print(() => duration = audioPlayer.duration);
  }

  void pause() async{

//    int result = await audioPlayer.pause();
//    audioPlayer.onDurationChanged.listen((Duration d) {
//      print('Max duration:');
//
//    });
//      Duration audioPlayer.duration;
//      print(() => duration = audioPlayer.duration);
  }

  _PlayerWidget(this.audioPlayer);



  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(
        velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta /
        maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(
          velocity:
              math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(
          velocity:
              math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(
          velocity: _controller.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }
}


class HeaderMusic extends StatelessWidget{
  final String musicName;
  final String artistName;

  const HeaderMusic(
      {Key key, @required this.musicName, @required this.artistName})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        child:  Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 22.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Text(musicName),
                    Text(artistName)
                  ],
                )
            )
        )
    );
  }
}




class CardAlbum extends StatelessWidget{
  final String assetName;
  final double offset;

  const CardAlbum({
    Key key,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 5),
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
    return Positioned(
      top: topMargin,
      child: Text(
        'Booked Exhibition',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
