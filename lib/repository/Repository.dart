import 'dart:async';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:spotjams/entities/Music.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = "10.0.2.2";



//
//class MusicDTO {
//    final int userId;
//    final int id;
//    final String title;
//    final String body;
//
//    Post({this.userId, this.id, this.title, this.body});
//
//    factory Post.fromJson(Map<String, dynamic> json) {
//        return Post(
//            userId: json['userId'],
//            id: json['id'],
//            title: json['title'],
//            body: json['body'],
//        );
//    }
//}


class Repository{
    Music music;


    Future<List<Music>> getMusics() async {
        base64Encode();
        print("Entrou =================================================================================");
        final response =
        await http.get("http://10.0.2.2:2345/?method=get&db=bd&operation=1");

        print("Saiu =================================================================================");
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
                music = new Music();

//                list.add(music.setMusic(nameM, nameA, urlAlbum, urlAudio, artist))
            return null;//Post.fromJson(json.decode(response.body));
        } else {
            // If that call was not successful, throw an error.
            print("Lascouseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            throw Exception('Failed to load post |||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        }
    }
//    Future<http.Response> fetchPost() async {
//
//        final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print(response.body);
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
////        return response;
//        if (response.statusCode == 200) {
//            // If the call to the server was successful, parse the JSON.
//
//            return null;
//        } else {
//            // If that call was not successful, throw an error.
//            throw Exception('Failed to load post');
//        }
//
//
//    }
}