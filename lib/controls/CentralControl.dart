import 'dart:core' as prefix0;
import 'dart:core';

import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Music.dart' as prefix1;
import 'package:spotjams/entities/Playlist.dart';

import 'Stub.dart';

class CentralControl{
    Stub stub = new Stub();
    List<Music> musicas;
    List<Playlist> playlists;
     void setMusicasStub(){
         stub.setMusic();
         stub.setPlaylists();
         this.playlists = stub.getPlaylistsUser();
        this.musicas = stub.getMusicasUser();
    }

    void removeMusicFromPlaylist(int indexPlaylist, int indexMusic){
       stub.removeMusicFromPlaylist(playlists[indexPlaylist].idPlaylist, playlists[indexPlaylist].musicas[indexMusic);
    }


    List<Music> getMusicasUser(){
         return this.musicas;
    }

    List<Playlist> getPlaylistUser(){
        return stub.getPlaylistsUser();
    }

    CentralControl(){
         setMusicasStub();
    }
}