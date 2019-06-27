import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                Tab(text: "Search",),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MusicTab(musics: new List<Music>()),
            PlaylistTab(),
            Icon(Icons.directions_bike),
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
        child: FutureBuilder(
          future: control.getMusics(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print("TAMANHO");
            print(snapshot.data.length);
            if (snapshot.hasData) {
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
                                      onPressed: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => AddToPlaylist()))}, //TODO implementar a funcao de remover da playlist
                                  )
                              ]);
                      });
               }})

    );

  }

  void play(int index){
      playerControl.setPlaylist(control.getMusicasUser());
      playerControl.setMusic(control.getMusicasUser()[index]);
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
      child: Scaffold(
        body: ListView.builder(
            itemCount: control.getPlaylistUser().length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  child: GestureDetector(
                      onTap: () {
                          Navigator.push(
                          context, new MaterialPageRoute(
                          builder: (context) => PlaylistPage(index: index)));
                      },
                      child: ListTile(
  //                        leading: Container(height: 50.0, width: 50.0,child: Image.network(control.getPlaylistUser()[index].u)),
                          title:Text(control.getPlaylistUser()[index].nome, ),
                  )
                  )
              );
            }
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
              Navigator.push(
                  context, new MaterialPageRoute(
                  builder: (context) => NewPlaylist()));
              },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      )
    );
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
  Widget build(BuildContext context) {

    @override
    void initState() {
      super.initState();
//      screenInfo();
    }


    return Material(
        color: Colors.black,
//      color: Colors.green,
        child: SafeArea(
            child: Column(
                children: <Widget>[
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *0.10,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                        child: Text(control.getPlaylistUser()[widget.index].nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.08, color: Colors.black87  )),
                    ),
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *0.85,
                        child: ListView.builder(
                            itemCount: control.getPlaylistUser()[widget.index].musicas.length,
                            itemBuilder: (context, indexMusic) {
                              return Row(
                                  children: <Widget>[
                                      Container(

//                                          color: Colors.green,
                                          child: GestureDetector(
                                              onTap: () {
                                                  play(widget.index, indexMusic); //inicia a musica
                                                  Navigator.push( //entra no player
                                                      context, new MaterialPageRoute(
                                                      builder: (context) => PlayerFull()));
                                              },
                                              child:  Row(
                                                  children: <Widget>[

                                                      Container(
//                                                          padding: EdgeInsets.all(20),
                                                            margin: EdgeInsets.all(10),
                                                            width: MediaQuery.of(context).size.width * 0.15,
                                                            height: MediaQuery.of(context).size.height *0.06,
                                                            child: Image.network(control.getPlaylistUser()[widget.index].musicas[indexMusic].urlAlbum),
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.65,
//                                                          height: MediaQuery.of(context).size.height *0.06,
                                                          child: Text(control.getPlaylistUser()[widget.index].musicas[indexMusic].nameMusic, style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.black87 )),
                                                      ),
                                                  ]
                                              )
                                          )
                                      ),
                                      IconButton(
                                          icon: (Icon(Icons.remove_circle_outline)),
                                          onPressed: () => removeFromPlaylist(widget.index, indexMusic), //TODO implementar a funcao de remover da playlist
                                      )
                                  ],
                              );

//                                  Container(
//                                  color: Colors.black,
//                                  child: ListTile(
//
//                                                onLongPress: () => {} ,
//                                                onTap: () => (play(index, indexMusic) ) ,
//                                                leading: Container(height: 50.0, width: 50.0,child: Image.network(control.getMusicasUser()[indexMusic].urlAlbum)),
//                                                title:Text(control.getMusicasUser()[indexMusic].nameMusic, style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.white  )),
//                                  )
//                                );
                            }
                        )
                    ),
                ],
            ),
        )
    );
  }

  void removeFromPlaylist(int indexPlaylist, int indexMusic){
    print("Entrou------------");
    setState(() {
      control.removeMusicFromPLaylist(indexPlaylist, indexMusic);
    });

  }


  void play(int index, int musicIndex){
    playerControl.setPlaylist(control.getPlaylistUser()[index].musicas);
    playerControl.setMusic(control.getPlaylistUser()[index].musicas[musicIndex]);
    playerControl.setIndex(musicIndex);
    audioPlayer.play(playerControl.getMusic.urlAudio);
    playerControl.setStatus(PlayerState.playing);
    PlayerFull();
  }

//  PlaylistPage(int index){
//    this.index = index;
//  }

//  _PlaylistPage(int index){
//    this.index = index;
//  }
}




class AlbumsTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const AlbumsTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SearchTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SearchTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class ArtistTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ArtistTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}


