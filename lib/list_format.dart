import 'package:flutter/material.dart';
import 'package:materi/form_data_local.dart';

import 'package:materi/database/db.dart';
import 'package:materi/models/models_form.dart';

class ListActivityPage extends StatefulWidget {
  const ListActivityPage({Key? key}) : super(key: key);

  @override
  _ListActivityPageState createState() => _ListActivityPageState();
}

class _ListActivityPageState extends State<ListActivityPage> {
  List<Activityy> listActivity = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    //menjalankan fungsi getallkontak saat pertama kali dimuat
    _getAllActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text("List Activity"),
        ),
      ),
      body: ListView.builder(
          itemCount: listActivity.length,
          itemBuilder: (context, index) {
            Activityy activityy = listActivity[index];
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                ),
                title: Text('${activityy.fullname}'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("nik: ${activityy.nik}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Subdivisi: ${activityy.subdivisi}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Status: ${activityy.status}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Lokasi: ${activityy.location}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Status: ${activityy.status}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Deskripsi: ${activityy.description}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Target: ${activityy.target}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Date Visit: ${activityy.dateVisit}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("STK Numbers: ${activityy.stkNumbers}"),
                    ),
                  ],
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(activityy);
                          },
                          icon: Icon(Icons.edit)),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: Text("Information"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "Yakin ingin Menghapus Data ${activityy.fullname}")
                                ],
                              ),
                            ),
                            //terdapat 2 button.
                            //jika ya maka jalankan _deleteKontak() dan tutup dialog
                            //jika tidak maka tutup dialog
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    _deleteActivity(activityy, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ya")),
                              TextButton(
                                child: Text('Tidak'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  //mengambil semua data Kontak
  Future<void> _getAllActivity() async {
    //list menampung data dari database
    var list = await db.getAllFormat();

    //ada perubahanan state
    setState(() {
      //hapus data pada listKontak
      listActivity.clear();

      //lakukan perulangan pada variabel list
      list!.forEach((activityy) {
        //masukan data ke listKontak
        listActivity.add(Activityy.fromMap(activityy));
      });
    });
  }

  //menghapus data Kontak
  Future<void> _deleteActivity(Activityy activityy, int position) async {
    await db.deleteActivityy(activityy.id_act!);
    setState(() {
      listActivity.removeAt(position);
    });
  }

  // membuka halaman tambah Kontak
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormAct()));
    if (result == 'save') {
      await _getAllActivity();
    }
  }

  //membuka halaman edit Kontak
  Future<void> _openFormEdit(Activityy activityy) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormAct(activityy: activityy)));
    if (result == 'update') {
      await _getAllActivity();
    }
  }
}
