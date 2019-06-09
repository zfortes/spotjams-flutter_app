import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class ListTabs extends StatefulWidget {
    @override
    _ListTabs createState() => _ListTabs();
}

class _ListTabs extends State<ListTabs> {
//    PageController pageController;
//    double pageOffset = 0;
//    final List<String> entries = <String>['A', 'B', 'C'];
//    int posicao  = 3;
    //Teste

    @override
    void initState() {
        super.initState();
//        pageController = PageController(viewportFraction: 0.8);
//        pageController.addListener(() {
//            setState(() => pageOffset = pageController.page);
//        });
    }

    @override
    void dispose() {
//        pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return
//            height: MediaQuery.of(context).size.height*0.80,
            Container(

                color: Colors.red   ,
                child: ListView (
                    children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.ac_unit),
                            title: Text("Tirulo"),
                            subtitle: Text("Subtitulo"),
                            trailing: Icon(Icons.print),
                        )
                    ],
//                itemCount: 3,
//                    itemBuilder: (context, index) {
//                        return Text("Teste", style: TextStyle (fontSize: 22.0,  color: Colors.red));
//                                padding: const EdgeInsets.all (16.0),
//                            child: Text (),
//                            ),

//                },
            )
        );


    }
}

//class SlidingCard extends StatelessWidget {
//    final String name;
//    final String date;
//    final String assetName;
//    final double offset;
//
//    const SlidingCard({
//        Key key,
//    }) : super(key: key);
//
//    @override
//    Widget build(BuildContext context) {
//        double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
//        return Transform.translate(
//            offset: Offset(-32 * gauss * offset.sign, 0),
//            child: Card(
//                margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
//                elevation: 8,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//                child: Column(
//                    children: <Widget>[
//                        ClipRRect(
//                            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//                            child: Image.asset(
//                                'assets/$assetName',
//                                height: MediaQuery.of(context).size.height * 0.3,
//                                alignment: Alignment(-offset.abs(), 0),
//                                fit: BoxFit.none,
//                            ),
//                        ),
//                        SizedBox(height: 8),
//                        Expanded(
//                            child: CardContent(
//                                name: name,
//                                date: date,
//                                offset: gauss,
//                            ),
//                        ),
//                    ],
//                ),
//            ),
//        );
//    }
//}
//
//class CardContent extends StatelessWidget {
//    final String name;
//    final String date;
//    final double offset;
//
//    const CardContent(
//        {Key key,
//            @required this.name,
//            @required this.date,
//            @required this.offset})
//        : super(key: key);
//
//    @override
//    Widget build(BuildContext context) {
//        return Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                    Transform.translate(
//                        offset: Offset(8 * offset, 0),
//                        child: Text(name, style: TextStyle(fontSize: 20)),
//                    ),
//                    SizedBox(height: 8),
//                    Transform.translate(
//                        offset: Offset(32 * offset, 0),
//                        child: Text(
//                            date,
//                            style: TextStyle(color: Colors.grey),
//                        ),
//                    ),
//                    Spacer(),
//                    Row(
//                        children: <Widget>[
//                            Transform.translate(
//                                offset: Offset(48 * offset, 0),
//                                child: RaisedButton(
//                                    color: Color(0xFF162A49),
//                                    child: Transform.translate(
//                                        offset: Offset(24 * offset, 0),
//                                        child: Text('Reserve'),
//                                    ),
//                                    textColor: Colors.white,
//                                    shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(32),
//                                    ),
//                                    onPressed: () {},
//                                ),
//                            ),
//                            Spacer(),
//                            Transform.translate(
//                                offset: Offset(32 * offset, 0),
//                                child: Text(
//                                    '0.00 \$',
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 20,
//                                    ),
//                                ),
//                            ),
//                            SizedBox(width: 16),
//                        ],
//                    )
//                ],
//            ),
//        );
//    }
//}
