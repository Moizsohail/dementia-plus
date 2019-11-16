import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.text, {this.page, this.expanded = true});
  final page;
  final String text;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child:
          SizedBox(width: MediaQuery.of(context).size.width*0.8, child:Center(child: Text(text))),
      padding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        (this.page != Null)
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => this.page))
            : null;
      },
    );
  }
}

class ImageCardButton extends StatelessWidget {
  ImageCardButton(this.text,{this.page});
  final String text;
  final page;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: InkWell(
          onTap: () {(this.page != Null)
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => this.page))
            : null;},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(this.text)],
          )),
      elevation: 2.0,
      margin: EdgeInsets.all(5.0),
    );
  }
}
