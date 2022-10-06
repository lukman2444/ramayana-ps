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
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, -10),
            child: Image.asset("assets/1.jpg"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: ListTile(
              leading: Image.network(
                "https://cdn.pixabay.com/photo/2018/02/24/23/05/architecture-3179435_960_720.jpg",
              ),
              title: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
