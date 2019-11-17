import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(this.mySearchController);
  final mySearchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search..",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
              controller: mySearchController,
            )),
        Expanded(
            flex: 1,
            child: RaisedButton(
              child: Icon(Icons.add),
              shape: CircleBorder(),
              onPressed: () {},
            ))
      ],
    );
  }
}
