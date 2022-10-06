import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:materi/list_act.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivity createState() => _AddActivity();
}

class _AddActivity extends State<AddActivity> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller_nik = TextEditingController();
  final controller_fullname = TextEditingController();
  final controller_subdivisi = TextEditingController();
  final controller_location = TextEditingController();
  final controller_status = TextEditingController();
  final controller_description = TextEditingController();
  final controller_target = TextEditingController();
  final controller_date_visit = TextEditingController();
  final controller_stk_numbers = TextEditingController();
  final controller_data_gambar = TextEditingController();
  bool obscure = true;

  var dio = Dio();
  late Size ukuranlayar;
  var akses = 'usr';

  var selected;
  final List<String> data = ['Status', 'Lajang', 'Menikah', 'Janda', 'Duda'];

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
        title: Text('  Add Activity'),
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
                  '  Form Activity',
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
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'NIK',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_nik,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_fullname,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sub Divisi',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_subdivisi,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Date Visit',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_date_visit,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Located',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_location,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Please Search Store ......',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton(
                    value: selected,
                    hint: Text(
                      'Status',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selected = value;
                      });
                    },
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Target',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_target,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'STK Numbers',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: controller_stk_numbers,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Upload Foto',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.image),
                      TextButton(
                          onPressed: () {
                            myAlert();
                          },
                          child: Text('Upload Foto')),
                      SizedBox(height: 10),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                    color: Colors.red,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      'Validation Successful',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return History();
                                }));
                                DateTime now = new DateTime.now();
                                var formData = FormData.fromMap({
                                  'nik': controller_nik.text,
                                  'fullname': controller_fullname.text,
                                  'subdivisi': controller_subdivisi.text,
                                  'date_visit ': controller_date_visit.text,
                                  'location': controller_location.text,
                                  'status': controller_status.text,
                                  'description': controller_description.text,
                                  'target': controller_target.text,
                                  'stk_numbers': controller_stk_numbers.text,
                                  // 'data_gambar': await MultipartFile.fromFile(
                                  //   _image?.path,
                                  //   filename: 'data_gambar${now.toString()}.png'
                                  // ),
                                });
                                var response = await dio.post(
                                    'http://ramayana.joeloecs.com/mobileapi/tambah_act.php',
                                    data: formData);
                                print(
                                    'Berhasil, ${controller_nik.text}, ${controller_fullname.text}, ${controller_subdivisi.text}, ${controller_date_visit.text}, ${controller_location.text}, ${controller_status.text}, ${controller_description.text}, ${controller_target.text}, ${controller_stk_numbers.text}, ');
                              }
                            },
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
