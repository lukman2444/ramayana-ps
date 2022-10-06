// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:materi/ramayana.dart';
// import 'dart:io';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:syncfusion_flutter_barcodes/barcodes.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:barcode_image/barcode_image.dart';
// import 'package:flutter_barcode_sdk/flutter_barcode_sdk.dart';

// import 'package:loading_indicator/loading_indicator.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class RamayanaProfile3 extends StatefulWidget {
  //const RamayanaProfile({Key? key}) : super(key: key);

  @override
  _RamayanaProfile3 createState() => _RamayanaProfile3();
//State<RamayanaProfile> createState() => _RamayanaProfile();
}

class _RamayanaProfile3 extends State<RamayanaProfile3> {
  //const RamayanaActivity({Key? key}) : super(key: key);
  bool isOn = false;
  Widget myWidget = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage('assets/7.png'), fit: BoxFit.fill)),
      ));

  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  ElevatedButton(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: Color.fromARGB(250, 236, 7, 7),
          actions: <Widget>[],
          elevation: 20,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Activity();
                }));
              })),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 320),
          child: ListView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 20),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 20),
                    Text(
                      'ID',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: scanID..text = '$_scanBarcode',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Divisi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(),
                    SizedBox(height: 30),
                  ],
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 0, right: 0),
                alignment: Alignment.center,
                height: 50,
                //width: 370,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _scanBarcode = scanID.text;
                    });
                  },
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(250, 236, 7, 7),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 272,
          decoration: BoxDecoration(
            color: Color.fromARGB(250, 213, 198, 198),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: <Widget>[
                  // Image.asset(
                  //   alignment: Alignment.center,
                  //   "assets/1.png",
                  //   height: 280,
                  //   width: 300),
                  AnimatedSwitcher(
                    child: myWidget,
                    duration: Duration(seconds: 1),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  ),
                  SizedBox(height: 10),
                  Switch(
                      value: isOn,
                      key: ValueKey(1),
                      activeThumbImage: AssetImage("assets/ram.png"),
                      inactiveThumbImage: AssetImage("assets/ram.png"),
                      hoverColor: Colors.orange,
                      activeColor: Colors.red,
                      dragStartBehavior: DragStartBehavior.start,
                      onChanged: (newValue) {
                        isOn = newValue;
                        setState(() {
                          if (isOn)
                            myWidget = Container(
                              key: ValueKey(1),
                              width: 350,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage('assets/9.png'),
                                      fit: BoxFit.fill)),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 180, bottom: 10, left: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    QrImage(
                                      foregroundColor: Colors.white,
                                      data: "$_scanBarcode",
                                      version: QrVersions.auto,
                                      size: 50,
                                    ),
                                    SfBarcodeGenerator(
                                      value: '$_scanBarcode',
                                      symbology: QRCode(),
                                      showValue: true,
                                      backgroundColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          else
                            myWidget = Container(
                              key: ValueKey(2),
                              width: 350,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage('assets/7.png'),
                                      fit: BoxFit.fill)),
                            );
                        });
                      })
                ],
              ),
            )),
      ]),
    );
  }
}
