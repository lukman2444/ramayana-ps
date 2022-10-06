import 'package:flutter/material.dart';

class StackTugas extends StatelessWidget {
  const StackTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi pertama'),
        backgroundColor: Colors.pink,
        elevation: 7.0,
        leading: Icon(Icons.home),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text('Menu1')),
              PopupMenuItem(child: Text('Menu2')),
              PopupMenuItem(child: Text('Menu3')),
            ];
          })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Colors.red[200],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(top: 250),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('Rp, 100.000,00')
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.newspaper_sharp),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('12/11/2022')
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('Rp, 100.000,00')
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('Rp, 100.000,00')
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('Rp, 100.000,00')
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
                  height: 110,
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 75,
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produk Jeans'),
                            Text('Celana Pria'),
                          ],
                        ),
                        Text('Rp, 100.000,00')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.pink[300],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Penghasilan',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rp. 2000.000',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pengeluaran',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rp. 2000.000',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ],
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'My Name Is Lukman Dwi Yulianto',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '085249608543',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
