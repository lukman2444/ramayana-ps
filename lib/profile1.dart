import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:barcode_flutter/barcode_flutter.dart';

class StackProfile extends StatefulWidget {
  const StackProfile({super.key});

  @override
  State<StackProfile> createState() => _StackProfileState();
}

class _StackProfileState extends State<StackProfile> {
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
                height: 450,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 23, 23),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        image != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image.file(
                                    //to show image, you type like this.
                                    File(image!.path),
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.fromLTRB(170, 30, 170, 0),
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  // color: Color.fromARGB(255, 255, 17, 17),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                ),
                              ),
                        // Text(
                        //   "No Image",
                        //   style: TextStyle(fontSize: 20, color: Colors.white),
                        // ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            '240798',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            myAlert();
                          },
                          child: Text('Upload Photo'),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              QrImage(
                                data: '',
                                version: QrVersions.auto,
                                size: 100.0,
                                foregroundColor: Colors.white,
                              ),
                              // BarCodeImage(
                              //   backgroundColor: Colors.white,
                              //   params: Code128BarCodeParams(
                              //     "0460545",
                              //     lineWidth:
                              //         1.2, // width for a single black/white bar (default: 2.0)
                              //     barHeight:
                              //         100.0, // height for the entire widget (default: 100.0)
                              //     withText:
                              //         true, // Render with text label or not (default: false)
                              //   ),
                              //   onError: (error) {
                              //     // Error handler
                              //     print('error = $error');
                              //   },
                              // ),
                            ],
                          ),
                        )

                        //if image not null show the image
                        //if image null show text
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
            ],
          ),
        ],
      ),
    );
  }
}
