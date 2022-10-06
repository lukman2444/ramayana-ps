import 'package:flutter/material.dart';
import 'package:materi/form_data_local.dart';
import 'package:materi/list_act.dart';
import 'package:materi/list_act2.dart';
import 'package:materi/list_format.dart';
import 'package:materi/list_user.dart';
import 'package:materi/login.dart';
import 'package:materi/print_harga.dart';
import 'package:materi/profile1.dart';
import 'package:materi/profile2.dart';
import 'package:materi/profile3.dart';
import 'package:materi/ramayana1.dart';
import 'package:materi/ramayana2.dart';
import 'package:materi/ramayana3.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.red,
        elevation: 7.0,
        leading: Icon(Icons.home),
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
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return LoginActivity();
              })));
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return StackProfile2();
              })));
            },
          ),
          IconButton(
            icon: Icon(Icons.power_settings_new_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return Harga();
              })));
            },
          ),
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
            height: 75,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 25, 25),
            ),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
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
                      '   My Name Is Lukman Dwi Yulianto',
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
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/ramayana.png",
                      height: 140,
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 180, 20, 0),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 25, 25),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 700),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_circle_rounded,
                                  color: Colors.white, size: 35),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return FormAct();
                                })));
                              },
                            ),
                            Text(
                              'Add Activity',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.file_copy_outlined,
                                  color: Colors.white, size: 35),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return History();
                                })));
                              },
                            ),
                            Text(
                              'List Activity',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.file_copy_outlined,
                                  color: Colors.white, size: 35),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return StackVoid1();
                                })));
                              },
                            ),
                            Text(
                              'Void',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.data_saver_on_outlined,
                                  color: Colors.white, size: 35),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return ListActivityPage();
                                })));
                              },
                            ),
                            Text(
                              'Data Lokal',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 25, 25),
                      ),
                      height: MediaQuery.of(context).size.width / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(Icons.menu, color: Colors.white, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
