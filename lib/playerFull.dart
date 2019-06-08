import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';



import 'home_page.dart';




//
//List<Music> playlist = new List<Music>();
//final audioUrls = [
//    "https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//    "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//    "https://api.soundcloud.com/tracks/258735531/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//    "https://api.soundcloud.com/tracks/9540779/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//    "https://api.soundcloud.com/tracks/9540352/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//    "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
//];
//
//
//



class PlayerFull extends StatefulWidget {


  PlayerFull({Key key}) : super(key: key);

  @override
    _PlayerFull createState() => new _PlayerFull();

}

class _PlayerFull extends State<PlayerFull>
    with SingleTickerProviderStateMixin {


    @override
    void initState() {
      super.initState();

    }


  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @override
    Widget build(BuildContext context) {
            return  Scaffold(

                        body: SafeArea(
                            child: Column(
                                children: <Widget>[
                                    Header(),
                                    HeaderMusic(),
                                    CardAlbum(),
                                    ProgressBar(),
                                    Container(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                    IconButton(
                                                        icon: Icon(Icons.skip_previous),
                                                        color: Colors.black,
                                                        iconSize: 48,
                                                        onPressed: previous,
                                                    ),
                                                    StreamBuilder(
                                                      stream: playerControl.outStatus,
                                                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                        return IconButton(
                                                          icon: ((snapshot.data == PlayerState.playing) ? Icon(Icons.pause_circle_filled) : Icon(Icons.play_circle_filled)),
                                                          iconSize: 65,
                                                          onPressed: () => play(),
                                                        );
                                                      },
                                                    ),
                                                    IconButton(
                                                        icon: Icon(Icons.skip_next),
                                                        color: Colors.black,
                                                        iconSize: 48,
                                                        onPressed: next,
                                                    ),
                                                ]
                                            )
                                        )
                                    ),
                                ]
                                //              )
                            )
                        )
                    );
//        }
    }



    Future<int> play() async{
      print("Play");
      int result;
      if (playerControl.getStatus == PlayerState.paused) {
          result = await audioPlayer.resume();
          playerControl.setStatus(PlayerState.playing);

      } else if (playerControl.getStatus == PlayerState.playing){
          result = await audioPlayer.pause();
          playerControl.setStatus(PlayerState.paused);
      }
      else {
          result = await audioPlayer.play(playerControl.getPlaylist[playerControl.getIndex].urlAudio);
          playerControl.setStatus(PlayerState.playing);
      }
      print(playerControl.getStatus);
      return result;
  }




    Future<int> next() async{
        print("Next");
        int result;
        if (playerControl.getIndex < playerControl.getPlaylist.length -1 ){
            int index = playerControl.getIndex;
            result = await audioPlayer.play(playerControl.getPlaylist[index + 1].urlAudio);
            playerControl.setIndex(index + 1);
            playerControl.setMusic(playerControl.getPlaylist[index + 1]);
            playerControl.setStatus(PlayerState.playing);
            audioPlayer.onDurationChanged.listen((duration) => playerControl.setDuration(duration));
        }else{
            playerControl.setIndex(0);
            result = await audioPlayer.stop();
            await audioPlayer.setUrl(playerControl.getPlaylist[0].urlAudio);
            playerControl.setMusic(playerControl.getPlaylist[0]);
            playerControl.setStatus(PlayerState.stopped);
            playerControl.setPosition(Duration(milliseconds: 0));
            audioPlayer.onDurationChanged.listen((duration) => playerControl.setDuration(duration));
        }

        return result;
    }

    Future<int> previous() async{
        print("Previous");
        int index = playerControl.getIndex;
        int result = 0;
        //TODO implementar esse bloco nos demais controles
        if (index > 0 ){
            result = await audioPlayer.play(playerControl.getPlaylist[index - 1].urlAudio);
            if ( result == 1) {
                print("Primeiro IF");
                playerControl.setIndex(index - 1);
                playerControl.setStatus(PlayerState.playing);
                playerControl.setMusic(playerControl.getPlaylist[index - 1]);
                audioPlayer.onDurationChanged.listen((duration) => playerControl.setDuration(duration));
            }

        }
        return result;
    }

}



class CardAlbum extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
//        double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
        return StreamBuilder(
            stream: playerControl.outMusic,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                    color: Colors.white,
                    child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.network(
                            snapshot.data.urlAlbum,
                            height: 320.0,
                            width: 320.0,
                        ),
                    ),
                );
            }
        );
    }
}

class HeaderMusic extends StatelessWidget{


  const HeaderMusic(
        {Key key})
        : super(key: key);

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
        stream: playerControl.outMusic,
        builder: (BuildContext context, AsyncSnapshot snapshot){
            return Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 22.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                            children: <Widget>[
                                Text(snapshot.data.nameMusic,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(snapshot.data.artist,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                            ],
                        )
                    )
                )
            );
        }
    );
  }
}

class ProgressBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return StreamBuilder(
          stream: playerControl.outPosition,
          builder: (BuildContext context, AsyncSnapshot snap){
              return Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                      children: <Widget>[
                          playerControl.getDuration == null ?
                          Row(
                              children: <Widget>[
                              Text("0.00"),
                              Spacer(),
                              Text("0.00"),
                              ],
                          ):
                          Row(
                              children: <Widget>[
                              Text(snap.data?.toString()?.split('.')?.first.substring(3,7) ?? ''),
                              Spacer(),
                              Text(playerControl.getDuration?.toString()?.split('.')?.first.substring(3,7) ?? ''),
                              ],
                          ),

                          Container(
                                child: playerControl.getDuration == null ?
                                      Slider(
                                          value: 0.0,
                                          min: 0.0,
                                          max: 0.0,
                                        ):

                                       Slider(
                                          value: snap.data.inMilliseconds?.toDouble() ?? 0.0,
                                          onChanged: (double value) =>
                                              audioPlayer.seek(new Duration(milliseconds: value.toInt())),
                                          min: 0.0,
                                          max: playerControl.getDuration.inMilliseconds.toDouble(),
                                        ),
                              ),

                      ]
                  )
              );}
      );
  }
}

class Header extends StatelessWidget {
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