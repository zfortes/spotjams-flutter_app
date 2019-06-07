import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayer/audioplayer.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:spotjams/entities/Music.dart';

import 'home_page.dart';

import 'home_page.dart';

const double minHeight = 80;
enum PlayerState { stopped, playing, paused }
int index;


List<Music> playlist = new List<Music>();
final audioUrls = [
    "https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
    "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
    "https://api.soundcloud.com/tracks/258735531/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
    "https://api.soundcloud.com/tracks/9540779/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
    "https://api.soundcloud.com/tracks/9540352/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
    "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
];






const url0 = "https://mega.nz/#!09tUSKjb!CbaTFh8fiAzDKzG8RR1iN6li0HdgZO4oHEeQ-7RsNTM";
const url = 'http://tegos.kz/new/mp3_full/Luis_Fonsi_feat._Daddy_Yankee_-_Despacito.mp3';
const url2 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const url3 = "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";

class PlayerFull extends StatefulWidget {

  final playerInfo;
  PlayerFull({Key key,@required this.playerInfo}) : super(key: key);

  @override
    _PlayerFull createState() => new _PlayerFull(playerInfo);

}

class _PlayerFull extends State<PlayerFull>
    with SingleTickerProviderStateMixin {


    //____________________________________________________

    final playerInfo;
    AudioPlayer audioPlayer  =  AudioPlayer();




    @override
    void initState() {
      addmusic();
      super.initState();

    }

    void addmusic(){
//        Music music = new Music();
//        playlist = new List<Music>();
//        music.artist = "Desconhecido";
//        music.nameMusic = "Eletro dodo";
//        music.urlAudio = "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
//        music.urlAlbum = "https://assets.audiomack.com/urbex12/f017a65c74ce89987f5477bab606d9fb.jpeg?width=750&height=750&max=true";
//        playlist.add(music);
//
//        Music music2 = new Music();
//        music2.artist = "Desconhecido";
//        music2.nameMusic = "Chata";
//        music2.urlAudio = "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
//        music2.urlAlbum = "https://www.google.com.br/url?sa=i&source=images&cd=&ved=2ahUKEwjSuPi_vNXiAhXzJrkGHU8sAs4QjRx6BAgBEAU&url=http%3A%2F%2Fwww.openculture.com%2F2018%2F02%2Fenter-the-cover-art-archive.html&psig=AOvVaw3V921WZ51dPB9kqf7Wnohw&ust=1559931680266148";
//        playlist.add(music2);
//        index = 0;

    }



  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @override
    Widget build(BuildContext context) {
//        final playerInfo = Provider.of<PlayerInfo>(context);
        return Scaffold(
//            body: Align(
//              alignment: Alignment.topLeft,
              body: SafeArea(
                child: Column(
                  children: <Widget> [
                    Header(),
                    HeaderMusic(artistName: "Martin", musicName: "Acces",),
                    CardAlbum(" "),
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
                                    onPressed: previous,
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
                                    onPressed: next,
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

    await audioPlayer.play(playlist[index].urlAudio);
    print(teste);
//    audioPlayer.onDurationChanged.listen((Duration d) {
//      print('Max duration:');
//
//    });
//      Duration audioPlayer.duration;
//      print(() => duration = audioPlayer.duration);
  }

    void pause() async{
      await audioPlayer.pause();

    }


    void next(){
        if (index < playlist.length -1 ){
          index++;

          audioPlayer.play(playlist[index].urlAudio);

        }else{
          index = 0;

          audioPlayer.play(playlist[0].urlAudio);

        }


    }

    void previous(){
      if (index > 0 ){
        index--;
        print(playerInfo.index);
        audioPlayer.play(playlist[index].urlAudio);
        return;
      }

    }

  _PlayerFull(this.playerInfo);


}



class CardAlbum extends StatelessWidget{
    String image;
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
//                image,
            ),
          ),
        );
    }
    CardAlbum(String image);
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
