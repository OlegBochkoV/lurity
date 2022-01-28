import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as googlemaps;
import 'dart:ui' as ui;

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            color: Colors.blueGrey[100],
            child: const SingleChildScrollView(),
          ),
        ),
        Expanded(
            flex: 3,
            child: Stack(children: [
              getMap(),
              bottomControll(context),
            ]))
      ],
    );
  }
}

Widget bottomControll(BuildContext context) {
  var today = DateTime.now();
  var sevenDaysFromNow = today.add(const Duration(days: 7));
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 0, 6, 56)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Screens', style: TextStyle(color: Colors.white60)),
                Text('0',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Locations', style: TextStyle(color: Colors.white60)),
                Text('0',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Plays', style: TextStyle(color: Colors.white60)),
                Text('0',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Budget', style: TextStyle(color: Colors.white60)),
                Text('0,00 €',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Campaign duration',
                    style: TextStyle(color: Colors.white60)),
                Text('7 days',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2100),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    backgroundColor: MaterialStateProperty.all(Colors.white))),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: sevenDaysFromNow,
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2100),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          '${sevenDaysFromNow.day}.${sevenDaysFromNow.month}.${sevenDaysFromNow.year}',
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    backgroundColor: MaterialStateProperty.all(Colors.white))),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text('Countine'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 0, 240, 176))))
          ],
        ),
      ),
    ),
  );
}

Widget getMap() {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng1 = googlemaps.LatLng(53.168664669129406, 24.48673223572488);

    final mapOptions = googlemaps.MapOptions()
      ..zoom = 6
      ..center = googlemaps.LatLng(53.91205725769009, 27.55255376799117);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = googlemaps.GMap(elem, mapOptions);

    final infowindow = googlemaps.InfoWindow()
      ..content =
          '<img src="https://res.cloudinary.com/lurity/image/upload/w_300/v1640001424/t64jftreyv1kpuwppngo.png"><br><center><b><font color="black">Label Text</font><b><br><center><b><font color="black">Trololo</font><b>';
    final marker = googlemaps.Marker(googlemaps.MarkerOptions()
      ..map = map
      ..position = myLatlng1);
    marker.onClick.listen((e) {
      infowindow.open(map, marker);
    });

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
