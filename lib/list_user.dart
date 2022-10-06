import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:materi/models/models_user.dart';
import 'package:http/http.dart' as http;

// import 'package:url_launcher/url_launcher.dart';
// import 'package:dio/dio.dart';
class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  void fetchProduk() async {
    UserModel.userlist.clear();
    final responseku = await http.post(
        Uri.parse('http://ramayana.joeloecs.com/mobileapi/fetch_data_user.php'),
        body: {
          "id_user": 'nothing',
        });
    var data = jsonDecode(responseku.body);
    if (data[0]['result'] == '1') {
      int count = data[1].length;
      for (int i = 0; i < count; i++) {
        UserModel.userlist.add(UserModel.fromjson(data[1][i]));
      }
      print('check length ${UserModel.userlist.length}');
      print(data[1].toString());
    } else {
      print('NO DATA');
    }
    setState(() {});
  }

  void deleteData(id_user) async {
    UserModel.userlist.clear();
    final responseku = await http.post(
        Uri.parse(
            'http://ramayana.joeloecs.com/mobileapi/deleted_data_user.php'),
        body: {
          "id_user": id_user,
        });
    var data = jsonDecode(responseku.body);
    if (['value'] == 1) {
      setState(() {
        fetchProduk();
      });

      print('check length ${UserModel.userlist.length}');
    } else {
      print('NO DATA');
    }
    setState(() {
      fetchProduk();
    });
  }

  void initState() {
    super.initState();

    fetchProduk();
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
      body: Stack(children: <Widget>[
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
            child: Text('Adhelia Putri Wardhana',
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
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 15)
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
            child: ListView(
              children: UserModel.userlist.map((e) {
                print('nama user ${e.nama_user}');
                return ListTile(
                  leading: Text('${e.id_user}'),
                  title: Text('${e.nama_user}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteData(e.id_user);
                    },
                  ),
                  subtitle: Text('${e.password}'),
                  tileColor: Colors.green[100],
                );
              }).toList(),
            ))
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 17, 17),
          child: Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
