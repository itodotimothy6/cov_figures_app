import 'package:flutter/material.dart';
import 'dart:ui';


class RateAlertBox extends StatelessWidget {
  final String title;
  final String content;

  RateAlertBox({this.title,this.content});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(title),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        content: Text(content,textAlign: TextAlign.left,),
        actions: <Widget>[],
      ),
    );
  }
}
