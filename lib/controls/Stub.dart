import 'package:spotjams/entities/Music.dart';
import 'package:spotjams/entities/Playlist.dart';
class Stub {
    List<Music> musicas;
    List<Playlist> playlists;
    void setMusic(){
        Music M1 = new Music(), M2 = new Music(), M3 = new Music(), M4 = new Music(), M5 = new Music();
        Music M6 = new Music(), M7 = new Music(), M8 = new Music(), M9 = new Music(), M10 = new Music();
        String image = "http://cache.boston.com/resize/bonzai-fba/Globe_Photo/2011/04/14/1302796985_4480/539w.jpg";
        M1.setMusic(" ","SoundHelix Song 1", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3", "T. Schürger");

        M2.setMusic(" ","SoundHelix Song 2", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3", "T. Schürger");

        M3.setMusic(" ","SoundHelix Song 3", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3", "T. Schürger");

        M4.setMusic(" ","SoundHelix Song 4", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3", "T. Schürger");

        M5.setMusic(" ","SoundHelix Song 5", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3", "T. Schürger");

        M6.setMusic(" ","SoundHelix Song 6", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3", "T. Schürger");

        M7.setMusic(" ","SoundHelix Song 7", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3", "T. Schürger");

        M8.setMusic(" ","SoundHelix Song 8", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3", "T. Schürger");

        M9.setMusic(" ","SoundHelix Song 9", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3", "T. Schürger");

        M10.setMusic(" ","SoundHelix Song 10", "T. Schürger", image,
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3", "T. Schürger");
        Music music = new Music();
        music.artist = "Desconhecido";
        music.nameMusic = "Eletro dodo";
        music.urlAudio = "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
        music.urlAlbum = "https://assets.audiomack.com/urbex12/f017a65c74ce89987f5477bab606d9fb.jpeg?width=750&height=750&max=true";


        Music music2 = new Music();
        music2.artist = "Desconhecido";
        music2.nameMusic = "Chata";
        music2.urlAudio = "https://api.soundcloud.com/tracks/295692063/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
        music2.urlAlbum = "https://scontent-ams3-1.cdninstagram.com/vp/0793e118389fa95928869b8ed6662efa/5D41F37A/t51.2885-15/e35/26155550_172117836734423_2160437892134993920_n.jpg?_nc_ht=scontent-ams3-1.cdninstagram.com&se=8&ig_cache_key=MTY4NjU5NTQ4NzczMTYyNjU0OQ%3D%3D.2";


        musicas = new List<Music>();
        musicas.add(M1);
        musicas.add(M2);
        musicas.add(M3);
        musicas.add(M4);
        musicas.add(M5);
        musicas.add(M6);
        musicas.add(M7);
        musicas.add(M8);
        musicas.add(M9);
        musicas.add(M10);
        musicas.add(music);
        musicas.add(music2);


    }

    void setPlaylists(){
        playlists = new List<Playlist>();
        Playlist p = new Playlist();
        Music m;
        p.musicas = new List<Music>();
        musicas.forEach((music) => {
            m = new Music(),
            m.id = music.id,
            m.urlAlbum = music.urlAlbum,
            m.artist = music.artist,
            m.urlAudio = music.urlAudio,
            m.nameMusic = music.nameMusic,
            p.musicas.add(m)
        });
//        p.musicas = musicas;
        p.nome = "Eletronicas";
        p.id_usuario = 25;
        p.num_seguidores = 30;
        playlists.add(p);
    }




    stub(){
        setMusic();
        setPlaylists();
    }

    void removeMusicFromPlaylist(int pn, int m){

        int encontrou = 0;
        print(pn);
        print(m);
        playlists[pn].musicas.removeAt(m);
        print("Saiu");
    }


    List<Playlist> getPlaylistsUser(){
        return playlists;
    }

    List<Music> getMusics(){
        return musicas;
    }


    List<Music> getMusicasUser(){
        return musicas;
    }
}