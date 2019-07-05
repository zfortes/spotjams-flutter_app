import 'package:spotjams/entities/Playlist.dart';

class Playlist_service{
    final String id;
    final String nome;
    final String imagem;

    Playlist_service({
        this.id,
        this.nome,
        this.imagem,
    }) ;

    factory Playlist_service.fromJson(Map<String, dynamic> json){
        return new Playlist_service(
            id: json['id'],
            nome: json['nome'],
            imagem: json['imagem'],

        );
    }
}


List<Playlist> convertFromPlaylist_service(List<Playlist_service> list){
    List<Playlist> playlists = new List<Playlist>();
    String urlAlbum = "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg?auto=format&q=60&fit=max&w=930";
    Playlist p;
    for (Playlist_service i in list) {
        p =  new Playlist();
//        print(i.nameMusic);
        p.setPlaylist(i.id, i.nome, i.imagem);
        playlists.add(p);
    }
    return playlists;
}