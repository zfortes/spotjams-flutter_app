import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotjams/entities/Artist.dart';
import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Playlist.dart';
import 'package:spotjams/services/Artist_service.dart';
import 'package:spotjams/services/Music_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:spotjams/services/Playlist_service.dart';

var url = "10.0.2.2";


class Repository{
    Music music;


    Future<List<Music>> getMusics() async {
        final response =
        await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=1");

        if (response.statusCode == 200) {
            // If the call to the server was successful, parse the JSON.
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                var j =  json.decode(response.body);
                print(j);
        //        print(new Post.fromJson(json.decode(response.body)).id.toString()+  "  " + Post.fromJson(json.decode(response.body)).title);
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                List<Music>  list = new   List<Music>();
                List<Music_service> musics = new List<Music_service>.from(j.map((i)=> Music_service.fromJson(i)).toList());
                list = convertFromMusic_service(musics);
//                print("TAMANHO LISTAAAAAAAAAA");
//                print(list.length);

//                list.add(music.setMusic(nameM, nameA, urlAlbum, urlAudio, artist))
            return list;//Post.fromJson(json.decode(response.body));
        } else {
            // If that call was not successful, throw an error.
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }
    }

    Future<void> deletePlaylist(String id) async {
        String url = "http://10.0.2.2:2345?method=delete&db=bd&operation=1&tabela=musicas_playlists&playlist_id='$id'";
        await http.get(Uri.encodeFull(url));
        url = "http://10.0.2.2:2345?method=delete&db=bd&operation=1&tabela=playlists&id='$id'";
        await http.get(Uri.encodeFull(url));
//        await http.get();
    }

    Future<void> removeFromPlaylist(String indexPlaylist, String indexMusic) async {
      String url = "http://10.0.2.2:2345?method=delete&db=bd&operation=1&tabela=musicas_playlists&musica_id=$indexMusic&playlist_id=$indexPlaylist";
      await http.get(Uri.encodeFull(url));
    }



    Future<int> createPlaylist(String name, String id_user) async {
        String url = "http://10.0.2.2:2345?method=post&db=bd&operation=1&tabela=playlists&nome='$name'&usuario_id=$id_user";

        final response = await http.get(Uri.encodeFull(url));
    }

    Future<int> addMusictoPlaylist(String id, String m) async {
        String url = "http://10.0.2.2:2345?method=post&db=bd&operation=1&tabela=musicas_playlists&musica_id=$m&playlist_id=$id";
        final response = await http.get(Uri.encodeFull(url));
    }

    Future<List<Music>> getMusicsFromPlaylist(String pid) async {
        final response =
            await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=5&id='$pid'");
        if (response.statusCode == 200) {
            // If the call to the server was successful, parse the JSON.
//            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            var j =  json.decode(response.body);
            print(j);
            //        print(new Post.fromJson(json.decode(response.body)).id.toString()+  "  " + Post.fromJson(json.decode(response.body)).title);

            List<Music>  list = new   List<Music>();
            List<Music_service> musics = new List<Music_service>.from(j.map((i)=> Music_service.fromJson(i)).toList());
            list = convertFromMusic_service(musics);
            print("TAMANHO getmusics");
            print(list.length);


//                list.add(music.setMusic(nameM, nameA, urlAlbum, urlAudio, artist))
            return list;//Post.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }
    }

    Future<List<Playlist>> getPlaylistsUser(String id_user) async{
        final response =
        await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=4&usuario_id='$id_user'");
        if (response.statusCode == 200) {

            var j =  json.decode(response.body);
            List<Playlist>  list = new   List<Playlist>();
//            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee playlist");
//            print(j);

            List<Playlist_service> playlists = new List<Playlist_service>.from(j.map((i)=> Playlist_service.fromJson(i)).toList());
//            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee playlist");
            list = convertFromPlaylist_service(playlists);

//            print("TAMANHO LISTAAAAAAAAAA PLaylist");
//            print(list.length);

//                list.add(music.setMusic(nameM, nameA, urlAlbum, urlAudio, artist))
            return list;//Post.fromJson(json.decode(response.body));
        } else {
            // If that call was not successful, throw an error.
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }

    }

    Future<List<Artist>> getTopArtist() async {
        final response =
            await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=8");
        if (response.statusCode == 200) {
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            var j =  json.decode(response.body);
            List<Artist>  list = new   List<Artist>();
            List<Artist_service> artists = new List<Artist_service>.from(j.map((i)=> Artist_service.fromJson(i)).toList());
            list = convertFromArtist_service(artists);

            return list;//Post.fromJson(json.decode(response.body));
        } else {
            // If that call was not successful, throw an error.
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }

    }

}

