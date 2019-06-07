import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotjams/entities/Music.dart';

class PlayerControl extends BlocBase{
    var _status; // 0 = stop, 1 = play, 2 = paused
    int _index ;
    List<Music> _playlist;
    Music _music;
//    AudioPlayer _player = AudioPlayer();

    var _statusController = BehaviorSubject<dynamic>();
    Stream<dynamic> get outStatus => _statusController.stream;
    Sink<dynamic> get inStatus => _statusController.sink;
    dynamic get getStatus => _statusController.value;

    var _indexController = BehaviorSubject<int>();
    Stream<int> get outIndex => _indexController.stream;
    Sink<int> get inInDex => _indexController.sink;
    int get getIndex => _indexController.value;

    var _playlistController = BehaviorSubject<List<Music>>();
    Stream<List> get outPlaylist => _playlistController.stream.map((v) => v);
    Sink<List> get inPlaylist => _playlistController.sink;
    List<Music> get getPlaylist => _playlistController.value;

    var _musicContoller = BehaviorSubject<Music>();
    Stream<Music> get outMusic => _musicContoller.stream;
    Music get getMusic => _musicContoller.value;
    Sink<Music>  get inMusic => _musicContoller.sink;

    
    void setMusic(Music music){
        inMusic.add(music);
    }

    void setPlaylist(List<Music> list){
        inPlaylist.add(list);
    }

    void setIndex(int data){
        inInDex.add(data);
    }

    void setStatus(var data){
        inStatus.add(data);
    }
    
    void play(int index){
        setIndex(index);
        setMusic(_playlist[index]);
    }


    
    
//    @override
//    void initState() {
//        addmusic();
//        super.initState();
//
//    }

//    void addmusic(){
//        Music music = new Music();
////        playlist = new List<Music>();
//        music.artist = "Desconhecido";
//        music.nameMusic = "Eletro dodo";
//        music.urlAudio = "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
//        music.urlAlbum = "https://assets.audiomack.com/urbex12/f017a65c74ce89987f5477bab606d9fb.jpeg?width=750&height=750&max=true";
//        playlist.add(music);
//
//        Music music2 = new Music();
//        music2.artist = "Desconhecido";
//        music2.nameMusic = "Chata";
//        music2.urlAudio = "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
//        music2.urlAlbum = "https://www.google.com.br/url?sa=i&source=images&cd=&ved=2ahUKEwjSuPi_vNXiAhXzJrkGHU8sAs4QjRx6BAgBEAU&url=http%3A%2F%2Fwww.openculture.com%2F2018%2F02%2Fenter-the-cover-art-archive.html&psig=AOvVaw3V921WZ51dPB9kqf7Wnohw&ust=1559931680266148";
//        playlist.add(music2);
//        index = 0;
//
//    }





    //  PlayerInfo(){
//    this.audioPlayer = new AudioPlayer();
//  }

    @override
    void dispose(){
        _indexController.close();
        _playlistController.close();
        _statusController.close();
        _musicContoller.close();
    }
}
