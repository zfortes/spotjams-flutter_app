import 'package:spotjams/entities/Music.dart';
import 'dart:convert';

class Music_service{
  final String id;
  final String nameMusic;
  final String nameAlbum;
  final String urlAlbum;
  final String urlAudio;
  final String artist;

  Music_service({
    this.id,
    this.nameMusic,
    this.urlAlbum,
    this.urlAudio,
    this.artist,
    this.nameAlbum,
  }) ;

  factory Music_service.fromJson(Map<String, dynamic> json){
    return new Music_service(
      id: json['id'],
      nameMusic: json['musica'],
      nameAlbum: json['album'],
      urlAudio: json['path_arquivo'],
      artist: json['artista']
    );
  }
}

List<Music> convertFromMusic_service(List<Music_service> list){
  List<Music> musics = new List<Music>();
  String urlAlbum = "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg?auto=format&q=60&fit=max&w=930";
  Music music;
  for (Music_service i in list) {
    music =  new Music();
    print(i.nameMusic);
    music.setMusic(i.id, i.nameMusic, i.nameAlbum, urlAlbum, i.urlAudio, i.artist, );
    musics.add(music);
  }
  return musics;
}