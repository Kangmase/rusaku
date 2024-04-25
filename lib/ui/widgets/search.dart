import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GFSearchBar(
            searchList: list,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListItemBuilder: (item) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            onItemSelected: (item) {
              setState(() {
                print('$item');
              });
            },
          ),
        ],
      ),
    );
  }
}
