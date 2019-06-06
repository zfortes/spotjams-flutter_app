import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart';



const double minHeight = 80;
enum PlayerState { stopped, playing, paused }
const url0 = "https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
const url = 'http://tegos.kz/new/mp3_full/Luis_Fonsi_feat._Daddy_Yankee_-_Despacito.mp3';
const url2 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';

class PlayerFull extends StatefulWidget {

  AudioPlayer audioPlayer;
  PlayerFull({Key key,@required this.audioPlayer}) : super(key: key);

  @override
    _PlayerFull createState() => new _PlayerFull(audioPlayer);

}

class _PlayerFull extends State<PlayerFull>
    with SingleTickerProviderStateMixin {

    AnimationController _controller;
    double get maxHeight => MediaQuery.of(context).size.height;

    double get headerTopMargin => lerp(20, 20 + MediaQuery.of(context).padding.top); //<-- Add new property

    double get headerFontSize => lerp(14, 24);

    //____________________________________________________

//  AudioPlayer audioPlayer = AudioPlayer();

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


  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @override
    Widget build(BuildContext context) {
        return Scaffold(
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
                                    onPressed: play
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
        );
    }



  void play() async{

    int result = await audioPlayer.play(url2);
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration:');

    });
//      Duration audioPlayer.duration;
//      print(() => duration = audioPlayer.duration);
  }

    void pause() async{

      int result = await audioPlayer.pause();
      audioPlayer.onDurationChanged.listen((Duration d) {
        print('Max duration:');

      });
//      Duration audioPlayer.duration;
//      print(() => duration = audioPlayer.duration);
    }

  _PlayerFull(this.audioPlayer);


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
      return Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(20.0)
//          ),
          color: Colors.green,
          child: Container(
            width: 320.0,
            height: 320.0,
            child: Image.network(
              'https://assets.audiomack.com/urbex12/f017a65c74ce89987f5477bab606d9fb.jpeg?width=750&height=750&max=true'
            ),
          ),
        );
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

//class ControlButtons extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//        return Container(
//            child:  Padding(
//            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 22.0),
//                child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                    IconButton(
//                        icon: Icon(Icons.arrow_back_ios),
//                        color: Colors.grey,
//                        iconSize: 48,
//                        onPressed: play,
//                          ),
//                          Icon(
//                            Icons.play_arrow,
//                            color: Colors.grey,
//                            size: 75,
//                           ),
//                          Icon(
//                            Icons.arrow_forward_ios,
//                            color: Colors.grey,
//                            size: 48,
//                          )
//                    ]
//                )
//            )
//        );
//
////        );
//    }
//}


class Header extends StatelessWidget {
//    final double fontSize;
//    final double topMargin;
//
//    const Header(
//        {Key key, @required this.fontSize, @required this.topMargin})
//        : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        child:  Padding(
            padding: EdgeInsets.all(22.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_arrow),
                  Text("Now Playing")
                ],
              )
            )
        )
      );

    }
}





















//
//
//import 'dart:async';
//
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//
//enum PlayerState { stopped, playing, paused }
//
//class PlayerWidget extends StatefulWidget {
//  final String url;
//  final bool isLocal;
//  final PlayerMode mode;
//
//  PlayerWidget(
//      {@required this.url,
//        this.isLocal = false,
//        this.mode = PlayerMode.MEDIA_PLAYER});
//
//  @override
//  State<StatefulWidget> createState() {
//    return new _PlayerWidgetState(url, isLocal, mode);
//  }
//}
//
//class _PlayerWidgetState extends State<PlayerWidget> {
//  String url;
//  bool isLocal;
//  PlayerMode mode;
//
//  AudioPlayer _audioPlayer;
//  AudioPlayerState _audioPlayerState;
//  Duration _duration;
//  Duration _position;
//
//  PlayerState _playerState = PlayerState.stopped;
//  StreamSubscription _durationSubscription;
//  StreamSubscription _positionSubscription;
//  StreamSubscription _playerCompleteSubscription;
//  StreamSubscription _playerErrorSubscription;
//  StreamSubscription _playerStateSubscription;
//
//  get _isPlaying => _playerState == PlayerState.playing;
//  get _isPaused => _playerState == PlayerState.paused;
//  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
//  get _positionText => _position?.toString()?.split('.')?.first ?? '';
//
//  _PlayerWidgetState(this.url, this.isLocal, this.mode);
//
//  @override
//  void initState() {
//    super.initState();
//    _initAudioPlayer();
//  }
//
//  @override
//  void dispose() {
//    _audioPlayer.stop();
//    _durationSubscription?.cancel();
//    _positionSubscription?.cancel();
//    _playerCompleteSubscription?.cancel();
//    _playerErrorSubscription?.cancel();
//    _playerStateSubscription?.cancel();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        new Row(
//          mainAxisSize: MainAxisSize.min,
//          children: [
//            new IconButton(
//                onPressed: _isPlaying ? null : () => _play(),
//                iconSize: 64.0,
//                icon: new Icon(Icons.play_arrow),
//                color: Colors.cyan),
//            new IconButton(
//                onPressed: _isPlaying ? () => _pause() : null,
//                iconSize: 64.0,
//                icon: new Icon(Icons.pause),
//                color: Colors.cyan),
//            new IconButton(
//                onPressed: _isPlaying || _isPaused ? () => _stop() : null,
//                iconSize: 64.0,
//                icon: new Icon(Icons.stop),
//                color: Colors.cyan),
//          ],
//        ),
//        new Row(
//          mainAxisSize: MainAxisSize.min,
//          children: [
//            new Padding(
//              padding: new EdgeInsets.all(12.0),
//              child: new Stack(
//                children: [
//                  new CircularProgressIndicator(
//                    value: 1.0,
//                    valueColor: new AlwaysStoppedAnimation(Colors.grey[300]),
//                  ),
//                  new CircularProgressIndicator(
//                    value: (_position != null &&
//                        _duration != null &&
//                        _position.inMilliseconds > 0 &&
//                        _position.inMilliseconds < _duration.inMilliseconds)
//                        ? _position.inMilliseconds / _duration.inMilliseconds
//                        : 0.0,
//                    valueColor: new AlwaysStoppedAnimation(Colors.cyan),
//                  ),
//                ],
//              ),
//            ),
//            new Text(
//              _position != null
//                  ? '${_positionText ?? ''} / ${_durationText ?? ''}'
//                  : _duration != null ? _durationText : '',
//              style: new TextStyle(fontSize: 24.0),
//            ),
//          ],
//        ),
//        new Text("State: $_audioPlayerState")
//      ],
//    );
//  }
//
//  void _initAudioPlayer() {
//    _audioPlayer = AudioPlayer(mode: mode);
//
//    _durationSubscription =
//        _audioPlayer.onDurationChanged.listen((duration) => setState(() {
//          _duration = duration;
//        }));
//
//    _positionSubscription =
//        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
//          _position = p;
//        }));
//
//    _playerCompleteSubscription =
//        _audioPlayer.onPlayerCompletion.listen((event) {
//          _onComplete();
//          setState(() {
//            _position = _duration;
//          });
//        });
//
//    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
//      print('audioPlayer error : $msg');
//      setState(() {
//        _playerState = PlayerState.stopped;
//        _duration = Duration(seconds: 0);
//        _position = Duration(seconds: 0);
//      });
//    });
//
//    _audioPlayer.onPlayerStateChanged.listen((state) {
//      if (!mounted) return;
//      setState(() {
//        _audioPlayerState = state;
//      });
//    });
//  }
//
//  Future<int> _play() async {
//    final playPosition = (_position != null &&
//        _duration != null &&
//        _position.inMilliseconds > 0 &&
//        _position.inMilliseconds < _duration.inMilliseconds)
//        ? _position
//        : null;
//    final result =
//    await _audioPlayer.play(url, isLocal: isLocal, position: playPosition);
//    if (result == 1) setState(() => _playerState = PlayerState.playing);
//    return result;
//  }
//
//  Future<int> _pause() async {
//    final result = await _audioPlayer.pause();
//    if (result == 1) setState(() => _playerState = PlayerState.paused);
//    return result;
//  }
//
//  Future<int> _stop() async {
//    final result = await _audioPlayer.stop();
//    if (result == 1) {
//      setState(() {
//        _playerState = PlayerState.stopped;
//        _position = Duration();
//      });
//    }
//    return result;
//  }
//
//  void _onComplete() {
//    setState(() => _playerState = PlayerState.stopped);
//  }
//}
//
//
//
//
//
