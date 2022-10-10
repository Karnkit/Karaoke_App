import 'package:flutter/material.dart';
import '../Bar/MenuBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Book'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const NavigationDrawer(),
        body: Image.network(
          'https://designimages.appypie.com/appbackground/appbackground-23-plant-temptag.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'POP',
    'Rock',
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;

                showResults(context);
              });
        });
  }
}
