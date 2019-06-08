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


    AudioPlayerState _audioPlayerState;
    StreamSubscription _durationSubscription;
    StreamSubscription _positionSubscription;
    StreamSubscription _playerCompleteSubscription;
    Duration duration;
    Duration position;
//     positionController;

    var _durationController = BehaviorSubject<Duration>();
    Stream<Duration> get outDuration => _durationController.stream.map((v) => v);
    Sink<Duration> get inDuration => _durationController.sink;
    Duration get getDuration => _durationController.value;

    var _positionController = BehaviorSubject<Duration>();
    Stream<Duration> get outPosition => _positionController.stream.map((v) => v);
    Sink<Duration> get inPosition => _positionController.sink;
    Duration get getPosition => _positionController.value;

    void setDuration(Duration data){
        inDuration.add(data);
    }

    void setPosition(Duration data){
        inPosition.add(data);
    }




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
