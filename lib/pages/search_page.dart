import 'package:covfiguresapp/pages/compare_page.dart';
import 'package:covfiguresapp/pages/loading_page.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/data/states.dart';
import 'package:covfiguresapp/services/get_data.dart';
import 'dart:io' show Platform;

class SearchPage extends StatelessWidget {
  static const id = 'search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurpleWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SearchBar<String>(
            onSearch: search,
            hintText: "Search US counties",
            emptyWidget: Center(
              child: Text(
                "No results found",
                style: kTextStyle.copyWith(color: kFontColor2, fontSize: 18),
              ),
            ),
            cancellationWidget: Text('Clear'),
            onItemFound: (String location, int index) {
              return FlatButton(
                onPressed: () async {
                  await addLocation(location, context);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    location,
                    style: kTextStyle.copyWith(
                      color: kFontColor2,
                      fontSize: 18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: kMainPurple),
                    ),
                  ),
                ),
              );
            },
            searchBarStyle: SearchBarStyle(
              backgroundColor: kSearchBarColor,
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.all(0),
            ),
            icon: searchBarIcon(),
            minimumChars: 1,
          ),
        ),
      ),
    );
  }

  Container searchBarIcon() => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: kMainPurple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Icon(
          Icons.search,
          color: kPurpleWhite,
        ),
      );

  Future<List<String>> search(String search) async {
    List<String> searchResult = [];
    population.keys.toList().forEach((value) {
      if (value.toLowerCase().contains(search.toLowerCase())) {
        searchResult.add(value);
      }
    });
    return searchResult;
  }

  Future addLocation(String key, BuildContext context) async {
    try {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoadingPage(initialPage: false);
      }));

      var data = await Data().getUSData();
      userLocations[key] = data[key];

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ComparePage();
      }));
    } catch (e) {
      print(e);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            return AlertDialog(
              title: Text("Error getting location data"),
              content: Text('Please try again'),
              elevation: 24,
              actions: <Widget>[
                FlatButton(
                  child: Text("Return to Compare Page"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ComparePage();
                    }));
                  },
                )
              ],
            );
          }
          return CupertinoAlertDialog(
            title: Text("Error getting location data"),
            content: Text('Please try again'),
            actions: <Widget>[
              FlatButton(
                child: Text("Return to Compare Page"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ComparePage();
                  }));
                },
              )
            ],
          );
        },
      );
    }
  }
}
