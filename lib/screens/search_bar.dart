import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: 0,
        left: 10,
        right: 10,
      ),
      child: SafeArea(
        child: SearchBar(
          onSearch: null,
          onItemFound: null,
          searchBarStyle: SearchBarStyle(),
        ),
      ),
    );
  }
}
