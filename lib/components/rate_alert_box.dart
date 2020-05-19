import 'package:flutter/material.dart';
import 'dart:ui';

class RateAlertBox extends StatelessWidget {
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
                child: Text("Title"),
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
        content: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus ullamcorper erat, non sodales tortor rhoncus id. Nullam pulvinar vehicula metus. Nulla pulvinar eu enim ac condimentum. Duis fringilla egestas ex, at egestas leo bibendum a. Integer feugiat leo id nibh gravida mattis. Morbi hendrerit non nulla id vestibulum. "),
        actions: <Widget>[],
      ),
    );
  }
}
