import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StackVoid extends StatelessWidget {
  const StackVoid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Void'),
        backgroundColor: Colors.red,
        elevation: 7.0,
        //leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.attach_money),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(Icons.attach_money),
          //   onPressed: () {},
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 200, 20, 0),
          //   height: 20,
          //   decoration: BoxDecoration(
          //     color: Colors.green[200],
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          // ),
          // IconButton(
          //   icon: Icon(Icons.power_settings_new_rounded),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () {},
          // ),
          // PopupMenuButton(itemBuilder: (BuildContext context) {
          //   return [
          //     PopupMenuItem(child: Text('Menu1')),
          //     PopupMenuItem(child: Text('Menu2')),
          //     PopupMenuItem(child: Text('Menu3')),
          //   ];
          // })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 235, 235),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 230, 230),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '  Void Activity',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      'code',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 17, 17),
                margin: EdgeInsets.only(top: 170),
                height: 50,
                child: Container(
                  color: Color.fromARGB(255, 255, 17, 17),
                  margin: EdgeInsets.only(right: 7),
                  width: 500,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Generate',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 233, 214, 214),
                width: 350,
                height: 50,
                margin: EdgeInsets.fromLTRB(20, 230, 10, 0),
                child: Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Scan Barcode',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(120, 300, 10, 0),
                child: QrImage(
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 150.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
