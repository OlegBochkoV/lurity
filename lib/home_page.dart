import 'package:flutter/material.dart';
import 'package:maps/content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Icon(
              Icons.crop_square_sharp,
              color: Colors.black,
            ),
            Text(
              'logo',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {},
              child:
                  const Text('data 1', style: TextStyle(color: Colors.black))),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
            child: Opacity(
              opacity: 0.5,
              child: VerticalDivider(
                width: 10,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {},
              child:
                  const Text('data 2', style: TextStyle(color: Colors.black))),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
            child: Opacity(
              opacity: 0.5,
              child: VerticalDivider(
                width: 10,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {},
              child:
                  const Text('data 3', style: TextStyle(color: Colors.black))),
          const Padding(
            padding: EdgeInsets.only(left: 40),
          )
        ],
      ),
      body: Content(),
    );
  }
}
