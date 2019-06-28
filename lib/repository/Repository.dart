import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core' as prefix0;
import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/services/Music_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = "10.0.2.2";


class Repository{
    Music music;


    Future<List<Music>> getMusics() async {
        final response =
        await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=1");

        if (response.statusCode == 200) {
            // If the call to the server was successful, parse the JSON.
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                var j =  json.decode(response.body);
                print(j);
        //        print(new Post.fromJson(json.decode(response.body)).id.toString()+  "  " + Post.fromJson(json.decode(response.body)).title);
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                List<Music>  list = new   List<Music>();
                List<Music_service> musics = new List<Music_service>.from(j.map((i)=> Music_service.fromJson(i)).toList());
                list = convertFromMusic_service(musics);
                print("TAMANHO LISTAAAAAAAAAA");
                print(list.length);

//                list.add(music.setMusic(nameM, nameA, urlAlbum, urlAudio, artist))
            return list;//Post.fromJson(json.decode(response.body));
        } else {
            // If that call was not successful, throw an error.
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }
    }

    Future<int> createPlaylist(String name, int id_user) async {
        String url = "http://10.0.2.2:2345?method=post&db=bd&operation=1&tabela=playlists&nome='$name'&usuario_id=$id_user";
        final response = await http.get(Uri.encodeFull(url));
    }

}

