import 'dart:core' as prefix0;
import 'dart:core';

import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/repository/Repository.dart';
import 'Stub.dart';

class CentralControl{


    Repository repo = new Repository();
//    Stub stub = new Stub();
    List<Music> musicas;
    List<Playlist> playlists;
//     prefix0.Future setMusicasStub() async {
//         stub.setMusic();
//         stub.setPlaylists();
//         this.playlists = await stub.getPlaylistsUser();
//        this.musicas = stub.getMusicasUser();
//    }

//    void removeMusicFromPLaylist(int indexPlaylist, int indexMusic){
//       stub.removeMusicFromPlaylist(indexPlaylist, indexMusic);
//    }

    void deletePlaylist(String id){
        repo.deletePlaylist(id);
    }

    List<Music> getMusicasUser(){
        getMusics();
         return this.musicas;
    }

    Future removeFromPlaylist(String indexPlaylist, String indexMusic) async {
        await repo.removeFromPlaylist(indexPlaylist, indexMusic);
    }



    Future<List<Playlist>> getPlaylistsUser() async {
         this.playlists = await repo.getPlaylistsUser("1");
        return await repo.getPlaylistsUser("1");
    }

    Future<List<Music>> getMusicsFromPlaylist(String pid) async{
        return await repo.getMusicsFromPlaylist(pid);
    }

    Future<List<Music>> getMusics() async {
        musicas = await repo.getMusics();

         return await repo.getMusics();
//        return stub.getMusics();
    }

    Future<void> createPlaylist(String name) async {
        return await repo.createPlaylist(name, 1.toString());
//        return stub.getMusics();
    }
    Future<int> addMusictoPlaylist(String id, String m) async{
        repo.addMusictoPlaylist(id, m);
    }


    CentralControl(){
//         setMusicasStub();
    }
}