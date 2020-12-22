import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Patient"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search username..",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black26),
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    )
                    // Container(
                    //     padding: EdgeInsets.all(10),
                    //     child: RaisedButton(
                    //       padding: EdgeInsets.all(10),
                    //       child: (Image.asset("images/search_vector.png")),
                    //       onPressed: () {},
                    //     ))
                  ],
                ))
          ],
        )));
  }
}
