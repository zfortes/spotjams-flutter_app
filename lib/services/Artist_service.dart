import 'package:spotjams/entities/Artist.dart';
import 'package:spotjams/entities/Music.dart';

class Artist_service{
  final String nome;
  final String aparicoes;

  Artist_service({
   this.nome,
    this.aparicoes
  }) ;

  factory Artist_service.fromJson(Map<String, dynamic> json){
    return new Artist_service(
        nome: json['nome_artista'],
        aparicoes: json['aparicoes'],
    );
  }
}

List<Artist> convertFromArtist_service(List<Artist_service> list){
  List<Artist> artists = new List<Artist>();
  Artist a;
  for (Artist_service i in list) {
    a =  new Artist();
//    print(i.nameMusic);
//    print(i.urlAudio.toString());
    a.setArtist(i.nome, i.aparicoes);
    artists.add(a);
  }
  return artists;
}