import 'dart:core' as prefix0;
import 'dart:core';

import 'package:spotjams/entities/Music.dart';
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