import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:materi/login.dart';
import 'package:materi/ramayana.dart';
import 'package:materi/stack_tugas.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class DaftarActivity extends StatefulWidget {
  @override
  _DaftarActivity createState() => _DaftarActivity();
}

class _DaftarActivity extends State<DaftarActivity> {
  final controller_nama_user = TextEditingController();
  final controller_password = TextEditingController();
  final controller_subdivisi = TextEditingController();

  var dio = Dio();
  late Size ukuranlayar;
  var akses = 'usr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('  Add Activity'),
      //   backgroundColor: Colors.red,
      //   elevation: 7.0,
      //   //leading: Icon(Icons.arrow_back),
      //   actions: <Widget>[
      //     // IconButton(
      //     //   icon: Icon(Icons.attach_money),
      //     //   onPressed: () {},
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.attach_money),
      //     //   onPressed: () {},
      //     // ),
      //     // Container(
      //     //   margin: EdgeInsets.fromLTRB(20, 200, 20, 0),
      //     //   height: 20,
      //     //   decoration: BoxDecoration(
      //     //     color: Colors.green[200],
      //     //     borderRadius: BorderRadius.circular(50),
      //     //   ),
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.power_settings_new_rounded),
      //     //   onPressed: () {},
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.shopping_cart),
      //     //   onPressed: () {},
      //     // ),
      //     // PopupMenuButton(itemBuilder: (BuildContext context) {
      //     //   return [
      //     //     PopupMenuItem(child: Text('Menu1')),
      //     //     PopupMenuItem(child: Text('Menu2')),
      //     //     PopupMenuItem(child: Text('Menu3')),
      //     //   ];
      //     // })
      //   ],
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          //   height: 50,
          //   width: 400,
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 230, 230, 230),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         '  Form Activity',
          //         style: TextStyle(
          //           fontWeight: FontWeight.w900,
          //           color: Colors.black,
          //           fontSize: 15,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
                height: 100,
                width: 400,
                // decoration: BoxDecoration(
                //   // color: Color.fromARGB(255, 230, 230, 230),
                //   borderRadius: BorderRadius.circular(10),
                // //),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/ramayana.png",
                      height: 80,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text('Daftar Akun',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: controller_nama_user,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      controller: controller_password,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: controller_subdivisi,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          labelText: 'Sub Divisi',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginActivity();
                        }));
                        DateTime now = new DateTime.now();
                        var formData = FormData.fromMap({
                          'nama_user': controller_nama_user.text,
                          'password': controller_password.text,
                          'subdivisi': controller_subdivisi.text,
                          // 'data_gambar': await MultipartFile.fromFile(
                          //   _image?.path,
                          //   filename: 'data_gambar${now.toString()}.png'
                          // ),
                        });
                        var response = await dio.post(
                            'http://ramayana.joeloecs.com/mobileapi/tambah_user.php',
                            data: formData);
                        print(
                            'Berhasil, ${controller_nama_user.text}, ${controller_password.text}, ${controller_subdivisi.text},');
                      },
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Kembali',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginActivity();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          //   child: ListView(
          //     children: <Widget>[
          //       Text(
          //         'NIK',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Full Name',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Sub Divisi',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Date Visit',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Located',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       SizedBox(height: 15),
          //       TextField(
          // keyboardType: TextInputType.multiline,
          // decoration: InputDecoration(
          //   prefixIcon: Icon(Icons.search),
          //   labelText: 'Please Search Store ......',
          //   border: OutlineInputBorder(),
          // ),
          //       ),
          //       SizedBox(height: 10),
          //       SizedBox(height: 10),
          //       Text(
          //         'Description',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Target',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'STK Numbers',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Upload Foto',
          //         style: TextStyle(
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
