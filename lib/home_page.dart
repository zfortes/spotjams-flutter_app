import 'dart:async';

import 'package:flutter/painting.dart';
import 'package:spotjams/blocs/playerControl.dart';
//import 'package:provider/provider.dart';
import 'package:spotjams/exhibition_bottom_sheet.dart';
import 'package:spotjams/playerFull.dart';
import 'dart:io';
//import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';
import 'package:spotjams/playerWidget.dart';
//import 'package:spotjams/playerWidget.dart';
import 'package:spotjams/sliding_cards.dart';
import 'package:spotjams/tabs.dart';
import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:spotjams/entities/Music.dart';
const kUrl0 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const kUrl1 = 'http://tegos.kz/new/mp3_full/Luis_Fonsi_feat._Daddy_Yankee_-_Despacito.mp3';

AudioPlayerState playerState;
enum PlayerState { stopped, playing, paused }



final AudioPlayer audioPlayer = AudioPlayer();
AudioPlayerState _audioPlayerState;

final PlayerControl playerControl = BlocProvider.getBloc<PlayerControl>();
const int teste = 1;
List<Music> playlist;


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}



class _HomePage extends State<HomePage> {
//  PlayerInfo playerInfo = new PlayerInfo();

//  AudioPlayer audioPlayer = new AudioPlayer();



    _HomePage(){
        Music music = new Music();
        playlist = new List<Music>();
        music.artist = "Desconhecido";
        music.nameMusic = "Eletro dodo";
        music.urlAudio = "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
        music.urlAlbum = "https://assets.audiomack.com/urbex12/f017a65c74ce89987f5477bab606d9fb.jpeg?width=750&height=750&max=true";
        playlist.add(music);

        Music music2 = new Music();
        music2.artist = "Desconhecido";
        music2.nameMusic = "Chata";
        music2.urlAudio = "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
        music2.urlAlbum = "https://scontent-ams3-1.cdninstagram.com/vp/0793e118389fa95928869b8ed6662efa/5D41F37A/t51.2885-15/e35/26155550_172117836734423_2160437892134993920_n.jpg?_nc_ht=scontent-ams3-1.cdninstagram.com&se=8&ig_cache_key=MTY4NjU5NTQ4NzczMTYyNjU0OQ%3D%3D.2";
        playlist.add(music2);

        playerControl.setPlaylist(playlist);
        playerControl.setMusic(playlist[0]);
        playerControl.setIndex(0);
        playerControl.setStatus(0);
    }



    @override
  Widget build(BuildContext context) {
//        final PlayerControl _playerControl = BlocProvider.getBloc<PlayerControl>();
    return Container(
        child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: <Widget> [
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Header(),
                        SizedBox(height: 40),
                        Tabs(),
                        SizedBox(height: 8),
                        SlidingCardsView(),

                      ],
                    )
                  ),
                  Positioned(
                      bottom: 0,
                      child:Padding(
                        padding: EdgeInsets.all(10.0),
                        child: MiniPlayer(),
                      ),
                  )
                ],
              )
            )
            );

    }

  void iniciar(){print("Teste");}
}


class MiniPlayer extends StatelessWidget{

  @override
  Widget build(BuildContext context){

//    final playerInfo = Provider.of<PlayerInfo>(context);
    return StreamBuilder(
            stream: playerControl.outMusic,
            builder: (BuildContext context, AsyncSnapshot snapshot){
                return Row(
        //        Consumer<PlayerInfo>(
        //      builder: (context, palyerInfo, child)=> Container(
        //        color: Colors.blueGrey,
        //        width: MediaQuery.of(context).size.width / 1.080,
        //        child: Row(
                    children: <Widget>[
                        Container(
                            height: 50.0,
                            child: Image.network(
                                snapshot.data.urlAlbum),
                        ),
                        Container(
                            child: Text(snapshot.data.nameMusic),
                        ),
                        IconButton(
                            icon: Icon(Icons.arrow_left),
                            onPressed: () {
                                Navigator.push(
                                    context, new MaterialPageRoute(
                                    builder: (context) => new PlayerFull()));
                            }
                        ),
                        IconButton(
                            icon: Icon(Icons.pause_circle_filled),
                            onPressed: () => pause(),

                        ),
                        IconButton(
                            icon: Icon(Icons.play_circle_filled),
                            onPressed: () => play(snapshot.data),
                        ),
                    ],
        //        ),
        //      ),
                );
            }
        );
    }



  void play(Music music) {
//      playerControl.play(playerControl.getIndex());
      if (playerControl.getStatus == 0) {
          audioPlayer.play(playerControl.getPlaylist[playerControl.getIndex].urlAudio);
          playerControl.setStatus(1);
      } else if (playerControl.getStatus == 1){
          audioPlayer.pause();
          playerControl.setStatus(2);
      }
      else {
          audioPlayer.resume();
          playerControl.setStatus(1);
      }
      print(playerControl.getStatus);

  }

  void pause(){




    audioPlayer.state = playerState;
    playerState = audioPlayer.state;
    print(playerState);
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

















//import 'dart:async';
//import 'dart:io';
//
//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'package:path_provider/path_provider.dart';
//
//import 'playerFull.dart';
//
//typedef void OnError(Exception exception);
//
//const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
//const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
//const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';
//
//void main() {
//  runApp(new MaterialApp(home: new ExampleApp()));
//}
//
//class ExampleApp extends StatefulWidget {
//  @override
//  _ExampleAppState createState() => new _ExampleAppState();
//}
//
//class _ExampleAppState extends State<ExampleApp> {
////  AudioCache audioCache = AudioCache();
//  AudioPlayer advancedPlayer = AudioPlayer();
////  String localFilePath;
//
////  Future _loadFile() async {
////    final bytes = await readBytes(kUrl1);
////    final dir = await getApplicationDocumentsDirectory();
////    final file = File('${dir.path}/audio.mp3');
////
////    await file.writeAsBytes(bytes);
////    if (await file.exists()) {
////      setState(() {
////        localFilePath = file.path;
////      });
////    }
////  }
//
//  Widget _tab(List<Widget> children) {
//    return Center(
//      child: Container(
//        padding: EdgeInsets.all(16.0),
//        child: Column(
//          children: children
//              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
//              .toList(),
//        ),
//      ),
//    );
//  }
//
////  Widget _btn(String txt, VoidCallback onPressed) {
////    return ButtonTheme(
////        minWidth: 48.0,
////        child: RaisedButton(child: Text(txt), onPressed: onPressed));
////  }
//
//  Widget remoteUrl() {
//    return PlayerWidget(url: kUrl1);
////      SingleChildScrollView(
////      child: _tab([
////        Text(
////          'Sample 1 ($kUrl1)',
////          style: TextStyle(fontWeight: FontWeight.bold),
////        ),
////        PlayerWidget(url: kUrl1),
////      ]),
////    );
//  }
//
////  Widget localFile() {
////    return _tab([
////      Text('File: $kUrl1'),
////      _btn('Download File to your Device', () => _loadFile()),
////      Text('Current local file path: $localFilePath'),
////      localFilePath == null
////          ? Container()
////          : PlayerWidget(url: localFilePath, isLocal: true),
////    ]);
////  }
//
////  Widget localAsset() {
////    return _tab([
////      Text('Play Local Asset \'audio.mp3\':'),
////      _btn('Play', () => audioCache.play('audio.mp3')),
////      Text('Loop Local Asset \'audio.mp3\':'),
////      _btn('Loop', () => audioCache.loop('audio.mp3')),
////      Text('Play Local Asset \'audio2.mp3\':'),
////      _btn('Play', () => audioCache.play('audio2.mp3')),
////      Text('Play Local Asset In Low Latency \'audio.mp3\':'),
////      _btn('Play',
////              () => audioCache.play('audio.mp3', mode: PlayerMode.LOW_LATENCY)),
////      Text('Play Local Asset In Low Latency \'audio2.mp3\':'),
////      _btn('Play',
////              () => audioCache.play('audio2.mp3', mode: PlayerMode.LOW_LATENCY)),
////    ]);
////  }
////
////  Widget notification() {
////    return _tab([
////      Text('Play notification sound: \'messenger.mp3\':'),
////      _btn(
////          'Play', () => audioCache.play('messenger.mp3', isNotification: true)),
////    ]);
////  }
//
////  Widget advanced() {
////    return _tab([
////      Column(children: [
////        Text('Source Url'),
////        Row(children: [
////          _btn('Audio 1', () => advancedPlayer.setUrl(kUrl1)),
////          _btn('Audio 2', () => advancedPlayer.setUrl(kUrl2)),
////          _btn('Stream', () => advancedPlayer.setUrl(kUrl3)),
////        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
////      ]),
////      Column(children: [
////        Text('Release Mode'),
////        Row(children: [
////          _btn('STOP', () => advancedPlayer.setReleaseMode(ReleaseMode.STOP)),
////          _btn('LOOP', () => advancedPlayer.setReleaseMode(ReleaseMode.LOOP)),
////          _btn('RELEASE',
////                  () => advancedPlayer.setReleaseMode(ReleaseMode.RELEASE)),
////        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
////      ]),
////      new Column(children: [
////        Text('Volume'),
////        Row(children: [
////          _btn('0.0', () => advancedPlayer.setVolume(0.0)),
////          _btn('0.5', () => advancedPlayer.setVolume(0.5)),
////          _btn('1.0', () => advancedPlayer.setVolume(1.0)),
////          _btn('2.0', () => advancedPlayer.setVolume(2.0)),
////        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
////      ]),
////      new Column(children: [
////        Text('Control'),
////        Row(children: [
////          _btn('resume', () => advancedPlayer.resume()),
////          _btn('pause', () => advancedPlayer.pause()),
////          _btn('stop', () => advancedPlayer.stop()),
////          _btn('release', () => advancedPlayer.release()),
////        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
////      ]),
////      new Column(children: [
////        Text('Seek in milliseconds'),
////        Row(children: [
////          _btn('100ms', () => advancedPlayer.seek(Duration(milliseconds: 100))),
////          _btn('500ms', () => advancedPlayer.seek(Duration(milliseconds: 500))),
////          _btn('1s', () => advancedPlayer.seek(Duration(seconds: 1))),
////          _btn('1.5s', () => advancedPlayer.seek(Duration(milliseconds: 1500))),
////        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
////      ]),
////    ]);
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(body: PlayerWidget(url: kUrl1,));
////      DefaultTabController(
////      length: 1,
////      child: Scaffold(
////        appBar: AppBar(
////          bottom: TabBar(
////            tabs: [
////              Tab(text: 'Remote Url'),
////            ],
////          ),
////          title: Text('audioplayers Example'),
////        ),
////        body: TabBarView(
////          children: [
////            PlayerWidget(url: kUrl1)
//////            remoteUrl(),
////          ],
////        ),
////      ),
////    );
//  }
//}







