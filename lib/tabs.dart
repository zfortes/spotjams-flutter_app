import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotjams/entities/Artist.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/pages/create_playlist/NewPlaylist.dart';
import 'package:spotjams/home_page.dart';
import 'package:spotjams/pages/add_to_playlist/AddToPlaylist.dart';
import 'package:spotjams/playerFull.dart';

import 'entities/Music.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            height: 50.0,
            child: new TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(text: "Music",),
                Tab(text: "Playlists",),
//                Tab(text: "Artists",),
                Tab(text: "Top artists",),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MusicTab(musics: new List<Music>()),
            PlaylistTab(),
            ArtistTab(),
//            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }



}

class MusicTab extends StatefulWidget {
    final List<Music> musics;
    const MusicTab({Key key, @required this.musics})
        : super(key: key);
  @override
  _MusicTabState createState() => _MusicTabState();
}

class _MusicTabState extends State<MusicTab> {
    @override
    void initState() {
        super.initState();
        getMusics();
    }

    void getMusics(){
        setState(() {
//            widget.musics = control.getMusics();
        });

    }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height *0.85,
        child: FutureBuilder<List<Music>>(
          future: control.getMusics(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
//            print("TAMANHO");
//            print(snapshot.data.length);
            if (snapshot.hasData) {
//                print(snapshot.hasData);
//                print(snapshot.data.length);
               return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, indexMusic) {
                          return Row(
                              children: <Widget>[
                                  Container(
                                      //                                          color: Colors.green,
                                      child: GestureDetector(
                                          onTap: () {
                                              play(indexMusic); //inicia a musica
      //                                        Navigator.push( //entra no player
      //                                            context, new MaterialPageRoute(
      //                                            builder: (context) =>
      //                                                PlayerFull()));
                                          },
                                          child: Row(
                                              children: <Widget>[

                                                  Container(
                                                      //                                                          padding: EdgeInsets.all(20),
                                                      margin: EdgeInsets.all(10),
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width * 0.15,
                                                      height: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * 0.06,
                                                      child: Image.network(snapshot.data[indexMusic]
                                                          .urlAlbum),
                                                  ),
                                                  Container(
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width * 0.65,
                                                      //                                                          height: MediaQuery.of(context).size.height *0.06,
                                                      child: Text(snapshot.data[indexMusic]
                                                          .nameMusic,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              fontSize: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width * 0.04,
                                                              color: Colors
                                                                  .black87)),
                                                  ),
                                              ]
                                          )
                                      )
                                  ),
                                  IconButton(
                                      icon: (Icon(Icons.add_circle_outline)),
                                      onPressed: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => AddToPlaylist(snapshot.data[indexMusic].id)))}, //TODO implementar a funcao de remover da playlist
                                  )
                              ]);
                      });
               }else{return Container();}})

    );

  }

  void play(int index){
      playerControl.setPlaylist(control.musicas);
//      print(control.getMusicasUser().length);
      playerControl.setMusic(control.getMusicasUser()[index]);
      print("MUSICA");
      print(control.musicas[index].nameMusic);
      playerControl.setIndex(index);
      audioPlayer.play(playerControl.getMusic.urlAudio);
      playerControl.setStatus(PlayerState.playing);
  }
}



class PlaylistTab extends StatefulWidget {

  const PlaylistTab({Key key})
      : super(key: key);

  @override
  _PlaylistTab createState() => new _PlaylistTab();
}

class _PlaylistTab extends State<PlaylistTab>{

  @override
  void initState() {
    super.initState();
//      screenInfo();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
          color: Colors.white,
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.85,
          child: FutureBuilder<List<Playlist>>(
              future: control.getPlaylistsUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print("TAMANHO");
//            print(snapshot.data.length);
                  if (snapshot.hasData) {
                      print(snapshot.hasData);
                      print(snapshot.data.length);
                      return Scaffold(
                            body: ListView.builder(
                                itemCount: control.playlists.length,
                                itemBuilder: (context, index) {
                                    return Row(
                                        children: <Widget>[
                                            Container(
                                                //                                          color: Colors.green,
                                                child: GestureDetector(
                                                    onTap: () {
                                                        Navigator.push(
                                                          context, new MaterialPageRoute(
                                                          builder: (context) => PlaylistPage(index: control.playlists[index].id)));
                                                    },
                                                    child: Row(
                                                        children: <Widget>[

                                                            Container(
                                                                //                                                          padding: EdgeInsets.all(20),
                                                                margin: EdgeInsets
                                                                    .all(10),
                                                                width: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .width *
                                                                    0.15,
                                                                height: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .height *
                                                                    0.06,
//                                                                child: Image
//                                                                    .network(
//                                                                    snapshot
//                                                                        .data[indexMusic]
//                                                                        .urlAlbum),
                                                            ),
                                                            Container(
                                                                width: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .width *
                                                                    0.65,
                                                                //                                                          height: MediaQuery.of(context).size.height *0.06,
                                                                child: Text(
                                                                    snapshot
                                                                        .data[index]
                                                                        .nome,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                        fontSize: MediaQuery
                                                                            .of(
                                                                            context)
                                                                            .size
                                                                            .width *
                                                                            0.04,
                                                                        color: Colors
                                                                            .black87)),
                                                            ),
                                                        ]
                                                    )
                                                )
                                            ),
                                            IconButton(
                                                icon: (Icon(Icons
                                                    .remove_circle_outline)),
                                                onPressed: () => {
                                                    deletePlaylist(snapshot.data[index].id),

                                                },
                                            )
                                        ]);
                                }),
                            floatingActionButton: new FloatingActionButton(
                              onPressed: () {
                                  Navigator.push(
                                      context, new MaterialPageRoute(
                                      builder: (context) => NewPlaylist()));
                                  },
                              tooltip: 'Increment',
                              child: new Icon(Icons.add),
                            ),
                          );
                  }else{return Container();}
              })

      );
  }

  void deletePlaylist(String id){
        control.deletePlaylist(id);
  }
}


class PlaylistPage extends StatefulWidget {

  final index;
  const PlaylistPage({Key key, @required this.index})
      : super(key: key);

  @override
  _PlaylistPage createState() => new _PlaylistPage();


}

class _PlaylistPage extends State<PlaylistPage>{
//  final index;

    @override
    void initState() {
        super.initState();
//      screenInfo();
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.95,
            child: FutureBuilder<List<Music>>(
                future: control.getMusicsFromPlaylist(widget.index),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print("TAMANHO playlistpage ");
            print(snapshot.data.length);
                    if (snapshot.hasData) {
                        print("entrou, aewww");
//                      print(snapshot.data[0].id);
                        return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, indexMusic) {
                                    return Row(
                                        children: <Widget>[
                                          GestureDetector(
                                                  onTap: () {
                                                    play(snapshot.data, indexMusic); //inicia a musica
                                                    Navigator.pop(context);
                                                                                            Navigator.push( //entra no player
                                                                                                context, new MaterialPageRoute(
                                                                                                builder: (context) =>
                                                                                                    PlayerFull()));
                                                  },
                                                  child: Row(
                                                      children: <Widget>[

                                                        Container(
                                                          //                                                          padding: EdgeInsets.all(20),
                                                          margin: EdgeInsets.all(10),
                                                          width: MediaQuery
                                                              .of(context)
                                                              .size
                                                              .width * 0.15,
                                                          height: MediaQuery
                                                              .of(context)
                                                              .size
                                                              .height * 0.06,
                                                          child: Image.network(snapshot.data[indexMusic]
                                                              .urlAlbum),
                                                        ),
                                                        Container(
                                                          width: MediaQuery
                                                              .of(context)
                                                              .size
                                                              .width * 0.65,
                                                          //                                                          height: MediaQuery.of(context).size.height *0.06,
                                                          child: Text(snapshot.data[indexMusic]
                                                              .nameMusic,
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  fontSize: MediaQuery
                                                                      .of(context)
                                                                      .size
                                                                      .width * 0.04,
                                                                  color: Colors
                                                                      .black87)),
                                                        ),
                                                      ]
                                                  )
                                          ),
                                          IconButton(
                                            icon: (Icon(Icons.remove_circle_outline)),
                                            onPressed: () => {removeFromPlaylist(widget.index, snapshot.data[indexMusic].id), Navigator.pop(context)},
                                          )
                                        ]);


                                }

                        );
                    }else{return Container(color: Colors.white,);}
                }

        )));
    }



  void removeFromPlaylist(String idPlaylist, String idMusic){
    print("Entrou------------");

      control.removeFromPlaylist(idPlaylist, idMusic);


  }

//
  void play(List<Music> p, int musicIndex){
    playerControl.setPlaylist(p);
    playerControl.setMusic(p[musicIndex]);
    playerControl.setIndex(musicIndex);
    audioPlayer.play(p[musicIndex].urlAudio);
    playerControl.setStatus(PlayerState.playing);
    PlayerFull();
  }


}


class ArtistTab extends StatefulWidget {

  const ArtistTab({Key key})
      : super(key: key);

  @override
  _ArtistTab createState() => new _ArtistTab();
}

class _ArtistTab extends State<ArtistTab>{

  @override
  void initState() {
    super.initState();
//      screenInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.85,
        child: FutureBuilder<List<Artist>>(
            future: control.getTopArtist(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                print(snapshot.hasData);
                print(snapshot.data.length);
                return Scaffold(
                  body: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Row(
                            children: <Widget>[
                              Container(
                                //                                          color: Colors.green,
                                  child: GestureDetector(
                                      child: Row(
                                          children: <Widget>[

                                            Container(
                                              //                                                          padding: EdgeInsets.all(20),
                                              margin: EdgeInsets
                                                  .all(10),
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width *
                                                  0.15,
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.06,
//                                                                child: Image
//                                                                    .network(
//                                                                    snapshot
//                                                                        .data[indexMusic]
//                                                                        .urlAlbum),
                                            ),
                                            Container(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width *
                                                  0.65,
                                              //                                                          height: MediaQuery.of(context).size.height *0.06,
                                              child: Text(
                                                  snapshot
                                                      .data[index]
                                                      .nome,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: MediaQuery
                                                          .of(
                                                          context)
                                                          .size
                                                          .width *
                                                          0.04,
                                                      color: Colors
                                                          .black87)),
                                            ),
                                          ]
                                      )
                                  )
                              ),
                              Text(snapshot
                                  .data[index]
                                  .aparicoes,
                                  style: TextStyle(
                                      fontWeight: FontWeight
                                          .bold,
                                      fontSize: MediaQuery
                                          .of(
                                          context)
                                          .size
                                          .width *
                                          0.04,
                                      color: Colors
                                          .black87))
                            ]);
                      }),
                );
              }else{return Container();}
            })

    );
  }

}


