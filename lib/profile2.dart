import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
// import 'package:barcode_flutter/barcode_flutter.dart';

class StackProfile2 extends StatefulWidget {
  const StackProfile2({super.key});

  @override
  State<StackProfile2> createState() => _StackProfile2State();
}

class _StackProfile2State extends State<StackProfile2> {
  bool isON = false;
  Widget myWidget = Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            image: DecorationImage(
                image: AssetImage('assets/8.png'), fit: BoxFit.fill),
          )));
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
        title: Text('Profile'),
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
          ListView(
            children: [
              Container(
                height: 380,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                // child: Container(
                //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedSwitcher(
                      child: myWidget,
                      duration: Duration(seconds: 1),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                    Switch(
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red[200],
                        value: isON,
                        onChanged: (newValue) {
                          isON = newValue;
                          setState(() {
                            if (isON)
                              myWidget = Container(
                                key: ValueKey(1),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 400,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage('assets/10.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 70, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: QrImage(
                                                embeddedImage: AssetImage(
                                                    'assets/ramayana.png'),
                                                data: '$_scanBarcode',
                                                version: QrVersions.auto,
                                                size: 80.0,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              height: 80,
                                              width: 350,
                                              child: SfBarcodeGenerator(
                                                value: '$_scanBarcode',
                                                symbology: QRCode(),
                                                showValue: true,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            else
                              myWidget = Container(
                                  key: ValueKey(2),
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                      width: 400,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage('assets/8.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      )));
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'NIK',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 10),
                    Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 10),
                    Text(
                      'Sub Divisi',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 10),
                    Text(
                      'code',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(contentPadding: EdgeInsets.all(10)),
                      readOnly: false,
                      controller: _editingController..text = '$_scanBarcode\n',
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 17, 17),
                margin: EdgeInsets.only(top: 40),
                height: 50,
                child: Container(
                  color: Color.fromARGB(255, 255, 17, 17),
                  margin: EdgeInsets.only(right: 7),
                  width: 500,
                  child: TextButton(
                    child: Text(
                      'UPLOAD',
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
            ],
          ),
        ],
      ),
    );
  }
}
