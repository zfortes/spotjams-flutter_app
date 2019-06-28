import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:spotjams/home_page.dart';

class NewPlaylist extends StatefulWidget {

  @override
  _NewPlaylistState createState() => _NewPlaylistState();
}

class _NewPlaylistState extends State<NewPlaylist> {
    String _name_playlist;
    final myController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                padding: EdgeInsets.only(
                    top: 60,
                    left: 40,
                    right: 40,
                ),
                color: Colors.white,
                child: ListView(
                    children: <Widget>[
                        Center(
                            child: Container(
                                width: 400.0,
                                height: 60.0,
                                child: Text(
                                    ('Nova playlist'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Arial', fontSize: 50.0, fontWeight: FontWeight.bold
                                    ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0), color: Colors.white),
                            ),
                        ),
                        SizedBox(
                            height: 80,
                        ),
                        Form(
                            key: _formKey,
                                child: TextFormField(
                                autofocus: false,
                                controller: myController,
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                    setState(() {
                                        _name_playlist = value;
                                    });
                                },
                                validator: (value) {
                                    if (value.isEmpty) {
                                        return 'Digite um nome';
                                    }
                                },
                                decoration: InputDecoration(
                                    labelText: "Nome da nova playlist",
                                    labelStyle: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),
                                ),
                                style: TextStyle(fontSize: 20),
                            ),
                        ),
//                    TextFormField(
//                        autofocus: false,
//                        keyboardType: TextInputType.number,
//                        inputFormatters: <TextInputFormatter>[
//                            LengthLimitingTextInputFormatter(11),
//                        ],
//                        decoration: InputDecoration(
//                            labelText: "CPF",
//                            labelStyle: TextStyle(
//                                color: Colors.black38,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20,
//                            ),
//                        ),
//                        style: TextStyle(fontSize: 20),
//                    ),
//                    TextFormField(
//                        autofocus: false,
//                        keyboardType: TextInputType.datetime,
//                        inputFormatters: <TextInputFormatter>[
//                            LengthLimitingTextInputFormatter(10),
//                        ],
//                        decoration: InputDecoration(
//                            labelText: "Data de Nascimento",
//                            labelStyle: TextStyle(
//                                color: Colors.black38,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20,
//                            ),
//                        ),
//                        style: TextStyle(fontSize: 20),
//                    ),
//                    TextFormField(
//                        autofocus: false,
//                        keyboardType: TextInputType.emailAddress,
//                        decoration: InputDecoration(
//                            labelText: "Email",
//                            labelStyle: TextStyle(
//                                color: Colors.black38,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20,
//                            ),
//                        ),
//                        style: TextStyle(fontSize: 20),
//                    ),
                        SizedBox(
                            height: 130,
                        ),
                        Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Color(0xFF19B37A),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                ),
                            ),
                            child: SizedBox.expand(
                                child: FlatButton(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            Text(
                                                "Criar playlist",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                ),
                                                textAlign: TextAlign.center,
                                            ),
                                        ],
                                    ),
                                    onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                            // If the form is valid, display a Snackbar.
//                                            Scaffold.of(context)
//                                                .showSnackBar(SnackBar(content: Text('Processing Data')));
//                                            Navigator.pop(context);
                                            createPlaylist(myController.text);
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                    return AlertDialog(
                                                        // Retrieve the text the that user has entered by using the
                                                        // TextEditingController.
                                                        content: Text(myController.text),
                                                    );
                                                },
                                            );
                                        }

                                    },
                                ),
                            ),
                        ),
                        SizedBox(
                            height: 20,
                        ),
                        Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Color(0xFF000000),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                ),
                            ),
                            child: SizedBox.expand(
                                child: FlatButton(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            Text(
                                                "Voltar",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                ),
                                                textAlign: TextAlign.center,
                                            ),
                                        ],
                                    ),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }



    createPlaylist(String name){
        control.createPlaylist(name);
    }
}


//
//
//class NewPlaylist extends StatelessWidget {
//
//}
