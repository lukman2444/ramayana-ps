import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class StackVoid1 extends StatefulWidget {
  const StackVoid1({super.key});

  @override
  State<StackVoid1> createState() => _StackVoid1State();
}

class _StackVoid1State extends State<StackVoid1> {
  final _editingController = TextEditingController();
  String data = '';

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

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
                TextField(
                  decoration:
                      InputDecoration(contentPadding: EdgeInsets.all(10)),
                  readOnly: false,
                  controller: _editingController..text = '$_scanBarcode\n',
                ),
                SizedBox(height: 30),
                Container(
                  color: Color.fromARGB(255, 255, 17, 17),
                  // margin: EdgeInsets.only(top: 170),
                  height: 50,
                  child: Container(
                    color: Color.fromARGB(255, 255, 17, 17),
                    margin: EdgeInsets.only(right: 7),
                    width: 500,
                    child: TextButton(
                      child: Text(
                        'Generate',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _scanBarcode = _editingController.text;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 233, 214, 214),
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    child: TextButton(
                      child: Text(
                        'Scan Barcode',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      onPressed: () => scanBarcodeNormal(),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: QrImage(
                          embeddedImage: AssetImage('assets/ramayana.png'),
                          data: '$_scanBarcode',
                          version: QrVersions.auto,
                          size: 150.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
