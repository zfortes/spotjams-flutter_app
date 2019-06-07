import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotjams/entities/Music.dart';

class PlayerControl extends BlocBase{
    bool _status;
    int _index ;
    List<Music> _playlist;
    Music _music;
    AudioPlayer audioPlayer;

    var _statusController = StreamController<bool>();
    Stream<bool> get outStatus => _statusController.stream;
    Sink<bool> get inStatus => _statusController.sink;

    var _indexController = StreamController<int>();
    Stream<int> get outIndex => _indexController.stream;
    Sink<int> get inInDex => _indexController.sink;

    var _playlistController = StreamController<List<Music>>();
    Stream<List> get outPlaylist => _playlistController.stream.map((v) => v);
    Sink<List> get inPlaylist => _playlistController.sink;

    var _musicContoller = StreamController<Music>();
    Stream<Music> get outMusic => _musicContoller.stream;
    Sink<Music>  get inMusic => _musicContoller.sink;

    var _audioPlayerControler = StreamController<AudioPlayer>();
    Stream<AudioPlayer> get outAudioPlayer => _audioPlayerControler.stream;
    Sink<AudioPlayer>  get inAudioPlayer => _audioPlayerControler.sink;

    
    void setMusic(Music music){
        inMusic.add(music);
    }

    void setPlaylist(List<Music> list){
        inPlaylist.add(list);
    }

    void setIndex(int data){
        inInDex.add(data);
    }

    void setStatus(bool data){
        inStatus.add(data);
    }
    
    void play(int index){
        audioPlayer.play(_playlist[index].urlAudio);
        setIndex(index);
        setMusic(_playlist[index]);
    }

    int getIndex(){
        return _index;
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
        _audioPlayerControler.close();
        _musicContoller.close();
    }
}
