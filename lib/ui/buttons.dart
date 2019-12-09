import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.text,
      {this.page, this.expanded = true, this.bgcolor, this.onpressed});
  final page;
  final bgcolor;
  final VoidCallback onpressed;
  final String text;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ))),
      padding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      color: (bgcolor == null) ? Theme.of(context).primaryColor : bgcolor,
      onPressed: () {
        if (this.page != null)
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => this.page));
        if (onpressed != null) onpressed();
      },
    );
  }
}

class ImageCardButton extends StatelessWidget {
  ImageCardButton(this.text, {this.page, this.image, this.bgColor});
  final Color bgColor;
  final String text;
  final String image;
  final page;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
          onTap: () {
            if (this.page != Null)
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => this.page));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(this.text, style: TextStyle(fontSize: 16))],
          )),
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
    );
  }
}
