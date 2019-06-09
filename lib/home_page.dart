import 'dart:async';
import 'package:spotjams/ListTabs.dart';
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

enum PlayerState { stopped, playing, paused }


//Section audioPlayer
final AudioPlayer audioPlayer = AudioPlayer();
AudioPlayerState _audioPlayerState;
StreamSubscription _durationSubscription;
StreamSubscription _positionSubscription;
StreamSubscription _playerCompleteSubscription;
Duration duration;
Duration position;

final PlayerControl playerControl = BlocProvider.getBloc<PlayerControl>();
const int teste = 1;


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}



class _HomePage extends State<HomePage> {
//  PlayerInfo playerInfo = new PlayerInfo();

//  AudioPlayer audioPlayer = new AudioPlayer();



    _HomePage(){
        Music music = new Music();
//        audioPlayer.stop();

        List<Music> playlist;
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
        playerControl.setStatus(PlayerState.stopped);
    }

    @override
    void initState() {
        super.initState();
        _initAudioPlayer();
    }




    @override
  Widget build(BuildContext context) {
//        final PlayerControl _playerControl = BlocProvider.getBloc<PlayerControl>();
    return Material(
            child: Stack(
                children: <Widget>[
                    Column(
                        children: <Widget>[
                            Container(
                                color: Colors.transparent,
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                child: SafeArea(
                                    child: Header(),
                                ),
                            ),
                            Container(
                                color: Colors.green,
                                height: MediaQuery.of(context).size.height * 0.9,
                                width: MediaQuery.of(context).size.width,
                                child: Tabs(
                                ),
                            ),
                        ]
                    ),
                    MiniPlayer(),
            ]
        )
    );


//                    Header(),
//                    Tabs(),
//                  Positioned(
//                      bottom: 0,
//                      child:Padding(
//                        padding: EdgeInsets.all(10.0),
//                        child: MiniPlayer(),
//                      ),
//                  )


    }


    void _initAudioPlayer() {
        print("Testao");
        _durationSubscription = audioPlayer.onDurationChanged.listen((duration) => playerControl.setDuration(duration));
        _positionSubscription =
            audioPlayer.onAudioPositionChanged.listen((p) => playerControl.setPosition(p));

        audioPlayer.onPlayerCompletion.listen((event) {
            onComplete();
        });

    }

    void onComplete() async{
        if (playerControl.getIndex < playerControl.getPlaylist.length -1 ){
            int index = playerControl.getIndex;
            await audioPlayer.play(playerControl.getPlaylist[index + 1].urlAudio);
            playerControl.setIndex(index + 1);
//            playerControl.setDuration(audioPlayer.dura)
            playerControl.setMusic(playerControl.getPlaylist[index + 1]);
            playerControl.setStatus(PlayerState.playing);
        }else{
            playerControl.setIndex(0);
            await audioPlayer.stop();
            await audioPlayer.setUrl(playerControl.getPlaylist[0].urlAudio);
            playerControl.setMusic(playerControl.getPlaylist[0]);
            playerControl.setPosition(Duration(milliseconds: 0));
            playerControl.setStatus(PlayerState.stopped);
        }
    }





    @override
    void dispose() {
        _durationSubscription?.cancel();
        _positionSubscription?.cancel();
        audioPlayer.stop();
        audioPlayer.dispose();
        _playerCompleteSubscription?.cancel();
        super.dispose();
    }

}


class MiniPlayer extends StatelessWidget{

  @override
  Widget build(BuildContext context){
//    final playerInfo = Provider.of<PlayerInfo>(context);
    return Container(
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.89,
            right: 20.0,
            left: 20.0),
            child: new Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: new Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Row(
                          children: <Widget>[
                              Container(
                                  child: GestureDetector(
                                      onTap: () {
                                          Navigator.push(
                                          context, new MaterialPageRoute(
                                          builder: (context) => PlayerFull()));
                                      },
                                      child: StreamBuilder(
                                          stream: playerControl.outMusic,
                                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                                  return Row(
                                                         children: <Widget>[
                                                             Container(
                                                                  height: 50.0,
                                                                  child: Image.network(
                                                                      snapshot.data.urlAlbum,
                                                                  ),
                                                              ),
                                                             Container(
                                                               child: Text(snapshot.data.nameMusic),
                                                             ),
                                                         ]
                                                  );

                                            }
                                       ),
                                  )
                              ),
                              StreamBuilder(
                                stream: playerControl.outStatus,
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      return IconButton(
                                        icon: ((snapshot.data == PlayerState.playing) ? Icon(Icons.pause_circle_filled) : Icon(Icons.play_circle_filled)),
                                        onPressed: () => play(),
                                      );
                                  },
                              ),
                          ],
                      ),
                  ),
          )
    );

//                alignment: Alignment.bottomCenter,
//                color: Colors.blueGrey,
//                height: MediaQuery.of(context).size.height *0.05,
//                width: MediaQuery.of(context).size.width * 0.8,
//                child: Row(
//                  children: <Widget>[
//                      Container(
//                          child: GestureDetector(
//                              onTap: () {
//                                  Navigator.push(
//                                  context, new MaterialPageRoute(
//                                  builder: (context) => PlayerFull()));
//                              },
//                              child: StreamBuilder(
//                                  stream: playerControl.outMusic,
//                                      builder: (BuildContext context, AsyncSnapshot snapshot){
//                                          return Row(
//                                                 children: <Widget>[
//                                                     Container(
//                                                          height: 50.0,
//                                                          child: Image.network(
//                                                              snapshot.data.urlAlbum,
//                                                          ),
//                                                      ),
//                                                     Container(
//                                                       child: Text(snapshot.data.nameMusic),
//                                                     ),
//                                                 ]
//                                          );
//
//                                    }
//                               ),
//                          )
//                      ),
//                      StreamBuilder(
//                        stream: playerControl.outStatus,
//                          builder: (BuildContext context, AsyncSnapshot snapshot) {
//                              return IconButton(
//                                icon: ((snapshot.data == PlayerState.playing) ? Icon(Icons.pause_circle_filled) : Icon(Icons.play_circle_filled)),
//                                onPressed: () => play(),
//                              );
//                          },
//                      ),
//                  ],
//
//              )
//        );
    }



  void play() async{



      if (playerControl.getStatus == PlayerState.paused) {
          await audioPlayer.resume();
          playerControl.setStatus(PlayerState.playing);

      } else if (playerControl.getStatus == PlayerState.playing){
          await audioPlayer.pause();
          playerControl.setStatus(PlayerState.paused);
      }
      else {
          await audioPlayer.play(playerControl.getPlaylist[playerControl.getIndex].urlAudio);
          playerControl.setStatus(PlayerState.playing);
          audioPlayer.onDurationChanged.listen((duration) => playerControl.setDuration(duration));
      }
      print(playerControl.getStatus);
      print("Posicao");
      print(playerControl.getPosition);
      print("Duraiton");
      print(playerControl.getDuration);
  }

}


class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 20.0),
      child: Row(
        children: <Widget>[
            Text(
                'SpotJAMS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.settings),
            )
          ]
      ),
    );
  }
}
