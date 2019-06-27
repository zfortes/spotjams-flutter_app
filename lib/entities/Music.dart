import 'dart:core';

class Music {
    String id;
    String nameMusic;
    String nameArtist;
    String nameAlbum;
    String urlAlbum;
    String urlAudio;
    String artist;



    void setMusic(String id, String nameM, String nameA, String urlAlbum, String urlAudio, String artist){
        this.id = id;
        this.nameMusic = nameM;
        this.nameArtist = nameA;
        this.urlAlbum = urlAlbum;
        this.urlAudio = urlAudio;
        this.artist = artist;
    }
}