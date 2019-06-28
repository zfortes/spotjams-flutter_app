import 'dart:core' as prefix0;
import 'dart:core';

import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Music.dart' as prefix1;
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/repository/Repository.dart';
import 'Stub.dart';

class CentralControl{


    Repository repo = new Repository();
    Stub stub = new Stub();
    List<Music> musicas;
    List<Playlist> playlists;
     void setMusicasStub(){
         stub.setMusic();
         stub.setPlaylists();
         this.playlists = stub.getPlaylistsUser();
        this.musicas = stub.getMusicasUser();
    }

    void removeMusicFromPLaylist(int indexPlaylist, int indexMusic){
       stub.removeMusicFromPlaylist(indexPlaylist, indexMusic);
    }


    List<Music> getMusicasUser(){
         return this.musicas;
    }

    List<Playlist> getPlaylistUser(){
        return stub.getPlaylistsUser();
    }

    Future<List<Music>> getMusics() async {
         return await repo.getMusics();
//        return stub.getMusics();
    }

    Future<void> createPlaylist(String name) async {
        return await repo.createPlaylist(name, 1);
//        return stub.getMusics();
    }

    CentralControl(){
         setMusicasStub();
    }
}