import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:materi/screen/animasi_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lukman Dwi',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Aplikasi pertama'),
          backgroundColor: Colors.pink,
          elevation: 7.0,
          leading: Icon(Icons.home),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_money),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Animasi()));
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text('Menu1')),
                PopupMenuItem(child: Text('Menu2')),
                PopupMenuItem(child: Text('Menu3')),
              ];
            })
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'PRIBADI',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'KELUARGA',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'TEMAN',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.yellow,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.facebook_sharp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.streetview_sharp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
