import 'package:audio_stream_player/audio_stream_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../globals_values/globals.dart';

class viewplaces extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class RoundedClipper extends CustomClipper<Path> {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 200);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 200,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _MyHomePageState extends State<viewplaces> {
  GlobalState _store = GlobalState.instance;

  AudioStreamPlayer player = AudioStreamPlayer();
  String url =
      "https://r3---sn-uxaxjvhxbt2u-5atr.googlevideo.com/videoplayback?expire=1570842151&ei=x9GgXdD0D5qX1gbciZzYAw&ip=197.55.82.87&id=o-AKH7TsFcbSWlsm8m6dEmVnpSoW7ZxKdn5K4SHCy3Wf-G&itag=250&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-uxaxjvhxbt2u-5atr%2Csn-hpa7kn7l&ms=au%2Crdu&mv=m&mvi=2&pl=20&gcr=eg&initcwndbps=241250&mime=audio%2Fwebm&gir=yes&clen=3008353&dur=361.421&lmt=1570327724779348&mt=1570820393&fvip=3&keepalive=yes&fexp=23842630&c=WEB&txp=5531432&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cgcr%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHylml4wRgIhAOT2t09yJzXgzBme-8gpHOOcPIGiO65nLmYN6p5eEJYEAiEA2PGyxrKmJrU18t5StyBkOHw9Aii0HHvC2-WuwO7aR_w%3D&sig=ALgxI2wwRgIhAL2znuXnl18GePTqwRrQ06icQ9BA9Vgt_kOKYeeNqAuEAiEAogBrsatdnFuuHXS9vKCCekvGWG3XElxeg3wSCmS3v-g%3D";

  //https://r1---sn-uxaxjvhxbt2u-5atr.googlevideo.com/videoplayback?expire=1569632425&ei=SVyOXYSOIYXi1gbws7CIDw&ip=197.55.130.187&id=o-ANP1WEg2VJWXYFuphiVUEUqm_iNZtkiy-r6RIS12YmM-&itag=250&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-uxaxjvhxbt2u-5atr%2Csn-hpa7zns6&ms=au%2Crdu&mv=m&mvi=0&pl=23&initcwndbps=220000&mime=audio%2Fwebm&gir=yes&clen=3452003&dur=413.961&lmt=1540693674202096&mt=1569610743&fvip=1&keepalive=yes&fexp=23842630&c=WEB&txp=5511222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHylml4wRQIhAIfSAez9tarCidZGcFVEgMZiU1dpO2p4CxK19PhYz8uDAiA6K62AfwE_V5OpSXpPLbNYJ6ishI92DHzCqbguPPlU8w%3D%3D&sig=ALgxI2wwRAIgWbQfWimuIB0iT12XIvRvDKD6b34GZZoQAllPTTkAGQACIBERexLJySsdFDNrNjbfWRAJ4e8t25bAf6C2FIN34gt8
  String Name_Place = "The Pyramids Of Giza";
  int a = 0;
  var description =
      "The Giza Pyramids, built to endure an eternity, have done just that. The monumental tombs are relics of Egypt's Old Kingdom era and were constructed some 4,500 years ago. \n Egypt's pharaohs expected to become gods in the afterlife. To prepare for the next world they erected temples to the gods and massive pyramid tombs for themselves—filled with all the things each ruler would need to guide and sustain himself in the next world. \n Pharaoh Khufu began the first Giza pyramid project, circa 2550 B.C. His Great Pyramid is the largest in Giza and towers some 481 feet (147 meters) above the plateau. Its estimated 2.3 million stone blocks each weigh an average of 2.5 to 15 tons. \n Khufu's son, Pharaoh Khafre, built the second pyramid at Giza, circa 2520 B.C. His necropolis also included the Sphinx, a mysterious limestone monument with the body of a lion and a pharaoh's head. The Sphinx may stand sentinel for the pharaoh's entire tomb complex. \n The third of the Giza Pyramids is considerably smaller than the first two. Built by Pharaoh Menkaure circa 2490 B.C., it featured a much more complex mortuary temple. \n The builders were skilled, well-fed Egyptian workers who lived in a nearby temporary city. Archaeological digs on the fascinating site have revealed a highly organized community, rich with resources, that must have been backed by strong central authority. \n It's likely that communities across Egypt contributed workers, as well as food and other essentials, for what became in some ways a national project to display the wealth and control of the ancient pharaohs.";

  playButton23() {
    if (a == 0 || a == 2) {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              player.play(url);
              setState(() {
                a = 1;
              });
            },
            color: Color(0xfff57e5e),
            iconSize: MediaQuery.of(context).size.width / 10,
          ),
        ],
      );
    } else if (a == 1) {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.pause),
            onPressed: () {
              player.pause();
              setState(() {
                a = 4;
              });
            },
            color: Color(0xfff57e5e),
            iconSize: MediaQuery.of(context).size.width / 10,
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              player.stop();
              setState(() {
                a = 2;
              });
            },
            color: Color(0xfff57e5e),
            iconSize: MediaQuery.of(context).size.width / 10,
          ),
        ],
      );
    } else if (a == 4) {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              player.play(url);
              setState(() {
                a = 1;
              });
            },
            color: Color(0xfff57e5e),
            iconSize: MediaQuery.of(context).size.width / 10,
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              player.stop();
              setState(() {
                a = 2;
              });
            },
            color: Color(0xfff57e5e),
            iconSize: MediaQuery.of(context).size.width / 10,
          ),
        ],
      );
    }
  }

  fun2() {
    player.stop();
  }

  _onclick1() {
    return Firestore.instance.collection('places').getDocuments();
  }

  QuerySnapshot result;

  @override
  _MyHomePageState() {
    hotel1();
  }

  hotel1() async {
    _onclick1().then((result1) {
      setState(() {
        result = result1;
        // print("fffffffffffffffffffffffffffffffffffffffffffffff");
      });
    });
  }

  Widget _resultList1() {
    if (result != null) {
      return prefix0.ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            if (_store.get('order') == result.documents[i].data['name']) {
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      FractionallySizedBox(
                        child: ClipPath(
                          clipper: RoundedClipper(396),
                          child: Image.network(
                            "${result.documents[i].data['img']}",
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.hue,
                          ),
                        ),
                      ),
                      AppBar(
                        iconTheme: IconThemeData(
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),
                      Container(
                        child: Text(
                          "${result.documents[i].data['name']}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 14,
                            color: Color(0xfff57e5e),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          playButton23(),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Text(
                          "${result.documents[i].data['description']}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 25,
                          ),
                        ),
                      )),
                ],
              ));
            } else {
              return prefix0.Container();
            }
          });
    } else {
      return prefix0.Center(
        child: SpinKitDualRing(
          color: Color(0xfff48953),
          size: 50.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: _resultList1(),
    ));
  }
}
