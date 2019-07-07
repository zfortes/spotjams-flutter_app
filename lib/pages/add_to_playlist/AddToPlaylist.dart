import 'package:flutter/material.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/home_page.dart';
import 'package:flutter/widgets.dart';

class AddToPlaylist extends StatelessWidget {
    String m;
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
              future: control.getPlaylistsUser(playerControl.getid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print("TAMANHO");
//            print(snapshot.data.length);
                  if (snapshot.hasData) {
                      print(snapshot.hasData);
//                      print(snapshot.data.length);
                      return Scaffold(
                          body: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                  return Container(
                                      padding: EdgeInsets.only(
                                          top: 30,
                                          left: 40,
                                          right: 40,
                                      ),
                                      child: GestureDetector(
                                          onTap: () {
                                              addMusictoPlaylist(snapshot.data[index].id);
                                              Navigator.pop(context);
                                          },
                                          child: Container(
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
                                      )

                                  );


                              }),

                      );
                  }else{return Container();}
              })

      );
  }
  void addMusictoPlaylist(String id){
      control.addMusictoPlaylist(id, m);
  }

  AddToPlaylist(String music){
      this.m = music;
  }

}
