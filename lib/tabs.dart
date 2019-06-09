import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            height: 50.0,
            child: new TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(text: "Playlists",),
                Tab(text: "Albums",),
                Tab(text: "Artists",),
                Tab(text: "Search",),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                  itemBuilder: (context, position) {
                      return Card(
                          child: ListTile(
                            leading: Icon(Icons.playlist_play),
                            title:Text("Playlist 1", ),
                          )
                      );
                  }
//                      Card(
//                          child: Padding(
//                              padding: const EdgeInsets.all(16.0),
//                              child: Text(position.toString(), style: TextStyle(fontSize: 22.0),),
//                              ),
//                      );},
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),


//      length: 3,
//      child: Column (
//        children: <Widget> [
//          TabBar(isScrollable: true, tabs: [
//            new Tab(text: 'Tab 1', icon: new Icon(Icons.directions_car)),
//            new Tab(text: 'Tab 2', icon: new Icon(Icons.directions_walk)),
//            new Tab(text: 'Tab 3', icon: new Icon(Icons.directions_bike)),
//          ]),
//
//
//        TabBarView(
//          children: [
//            new ListView(
//              children: <Widget>[
//                Text("Tab 1"),
//              ],
//            ),
//            new ListView(
//                children: <Widget>[
//                    Text("Tesxto")
//                 ],
//            ),
//            new ListView(
//              children: <Widget>[
//                Text("Tesxto")
//              ],
//            ),
//          ],
//        ),
//        ]
//      ),
    );




//    Row(
//      crossAxisAlignment: CrossAxisAlignment.end,
//      children: <Widget>[
//        SizedBox(width: 24),
//        PlaylistTab(text: 'Playlists', isSelected: false),
//        ArtistTab(text: 'Artists', isSelected: true),
//        AlbumsTab(text: 'Albums', isSelected: false),
//        SearchTab(text: 'Search', isSelected: false),
//      ],
//    );
  }
}

class AlbumsTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const AlbumsTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SearchTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SearchTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class ArtistTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ArtistTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class PlaylistTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const PlaylistTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
