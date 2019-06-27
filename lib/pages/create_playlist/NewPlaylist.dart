import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
              children: <Widget>[
                  Container(
                    child: Center(
                          child: Text("New playlist", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .1, color: Colors.black87 ))
                      )
                  )
              ],
          ),
        )
    );
  }
}
