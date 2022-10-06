import 'package:flutter/material.dart';
import 'package:materi/database/db.dart';
import 'package:materi/list_format.dart';
import 'package:materi/models/models_form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormAct extends StatefulWidget {
  final Activityy? activityy;

  FormAct({this.activityy});

  @override
  _FormActState createState() => _FormActState();
}

class _FormActState extends State<FormAct> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DbHelper db = DbHelper();

  TextEditingController? id_act;
  TextEditingController? nik;
  TextEditingController? fullname;
  TextEditingController? subdivisi;
  TextEditingController? location;
  TextEditingController? status;
  TextEditingController? description;
  TextEditingController? target;
  TextEditingController? dateVisit;
  TextEditingController? stkNumbers;

  @override
  void initState() {
    nik = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.nik);

    fullname = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.fullname);

    subdivisi = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.subdivisi);

    location = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.location);

    status = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.status);

    description = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.description);

    target = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.target);

    dateVisit = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.dateVisit);

    stkNumbers = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.stkNumbers);

    super.initState();
  }

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
        title: Text('Add Activity'),
        backgroundColor: Colors.red,
        elevation: 7.0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NIK',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: nik,
                    decoration: InputDecoration(
                      labelText: 'NIK',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "Required"),
                      controller: fullname,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sub Divisi',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "Required"),
                      controller: subdivisi,
                      decoration: InputDecoration(
                        labelText: 'Subdivisi',
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lokasi',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: location,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Please Search Store ......',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                        controller: status,
                        decoration: InputDecoration(
                          labelText: 'Status',
                        ),
                      ),
                    ])),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "Required"),
                      controller: description,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Target',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: target,
                    decoration: InputDecoration(
                      labelText: 'Target',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date Visit',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: dateVisit,
                    decoration: InputDecoration(
                      labelText: 'Date Visit',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "Required"),
                      controller: stkNumbers,
                      decoration: InputDecoration(
                        labelText: 'STK Numbers',
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: (widget.activityy == null)
                    ? Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: () {
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
                    upsertActivityy();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> upsertActivityy() async {
    if (widget.activityy != null) {
      //update
      await db.updateActivityy(Activityy.fromMap({
        'id_act': widget.activityy!.id_act,
        'nik': nik!.text,
        'fullname': fullname!.text,
        'subdivisi': subdivisi!.text,
        'location': location!.text,
        'status': status!.text,
        'description': description!.text,
        'target': target!.text,
        'dateVisit': dateVisit!.text,
        'stkNumbers': stkNumbers!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveActivityy(Activityy(
        nik: nik!.text,
        fullname: fullname!.text,
        subdivisi: subdivisi!.text,
        location: location!.text,
        status: status!.text,
        description: description!.text,
        target: target!.text,
        dateVisit: dateVisit!.text,
        stkNumbers: stkNumbers!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
