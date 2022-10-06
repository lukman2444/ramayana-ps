import 'package:flutter/material.dart';
import 'package:materi/form_data_local.dart';

import 'package:materi/database/db.dart';
import 'package:materi/models/models_form.dart';

class Historyy extends StatefulWidget {
  const Historyy({super.key});

  @override
  State<Historyy> createState() => _HistoryyState();
}

class _HistoryyState extends State<Historyy> {
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
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            isCollapsed: true,
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
            // suffixText: 'Search'
          ),
        ),
        // TextField(
        //    decoration: InputDecoration(border: OutlineInputBorder(),
        //       focusColor: Colors.white,
        //         labelText: 'Search',
        //         prefixIcon: Icon(Icons.search),
        //         ),
        // ),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20,
        toolbarHeight: 75,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_1),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: 120,
              width: 500,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 15, 15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 3,
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text('List Activity',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700))),
          Container(
              margin: EdgeInsets.only(left: 230, top: 90),
              child: Text('Lukman Dwi Yulianto',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
          Container(
            margin: EdgeInsets.only(top: 120),
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 5, blurRadius: 15)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('ALL',
                    style: TextStyle(
                        color: Color.fromARGB(221, 101, 89, 89),
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
                Text('TRASH',
                    style: TextStyle(
                        color: Color.fromARGB(221, 101, 89, 89),
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 170),
              color: Colors.white,
              child: ListView.builder(
                  itemCount: listActivity.length,
                  itemBuilder: (context, index) {
                    Activityy activityy = listActivity[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ListTile(
                        leading: Text('${activityy.id_act}'),
                        title: Text('${activityy.fullname}'),
                        trailing: IconButton(
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
                        ),
                        subtitle: Text('${activityy.subdivisi}'),
                        tileColor: Colors.green[100],
                      ),
                    );
                  })
              // children: AktivitasModel.aktivitaslist.map((e) {
              //   print('nama user ${e.fullname}');
              //   return ListTile(
              //     leading: Text('${e.id_act}'),
              //     title: Text('${e.fullname}'),
              //     trailing: IconButton(
              //       icon: Icon(Icons.delete),
              //       onPressed: () {
              //         deleteData(e.id_act);
              //       },
              //     ),
              //     subtitle: Text('${e.subdivisi}'),
              //     tileColor: Colors.green[100],
              //   );
              // }).toList(),
              //),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 17, 17),
          child: Icon(Icons.add),
          onPressed: () {
            _openFormCreate();
          }),
    );
  }

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
