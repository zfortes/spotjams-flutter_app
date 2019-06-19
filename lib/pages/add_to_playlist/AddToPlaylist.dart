import 'package:flutter/material.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/home_page.dart';
import 'package:flutter/widgets.dart';

class AddToPlaylist extends StatelessWidget {
    List<Playlist> puser;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 0.0),
                    child:Column(
                        children: <Widget>[
                            ListView.builder(
                                itemBuilder: (context, indexP){
                                    return ListTile(
        //                                onTap: ,
                                        title: Text(puser[indexP].nome),
                                    );
                                }
                            )
                        ],
                    )
                ),
            )
        )
    );





  }

  AddToPlaylist(){
      puser = control.getPlaylistUser();
  }

}
