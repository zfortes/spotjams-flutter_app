import 'package:flutter/material.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/home_page.dart';
import 'package:flutter/widgets.dart';

class AddToPlaylist extends StatelessWidget {
    List<Playlist> puser;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            title: "Playlists",
            home: Scaffold(
                appBar: AppBar(title: Text("Playlist", style: TextStyle(
                    fontWeight: FontWeight
                        .bold,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width * 0.04,
                    color: Colors
                        .black87),), backgroundColor: Colors.white,),
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 0.0),
                        child:
    //                            Container(
                                     ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: puser.length,
                                        itemBuilder: (context, indexP){
                                            return  Text(control.getPlaylistUser()[indexP].nome);

                                        }
                                    )
    //                            )


                    ),
                )
        )
    );
//    );





  }

  AddToPlaylist(){
      puser = control.getPlaylistUser();
  }

}
