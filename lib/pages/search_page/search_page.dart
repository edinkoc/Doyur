import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
         body: SearchWidget(),
      ),
    );
  }
}


class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  List<String> _searchResults = [];

  void _performSearch() {

    List<String> mockResults = [
      'item 1',
      'item 2',
      'item 3',
      'item 4',
    ];

    setState(() {
      _searchResults = mockResults
          .where((result) => result.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (text) {
              setState(() {
                _searchText = text;
              });
            },
            style: TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: 'Search for what you need!',
              hintStyle: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchText = '';
                    _searchResults.clear();
                  });
                },
              ),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _searchResults[index],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                // Add onTap action for each result if needed
              );
            },
          ),
        ),
      ],
    );
  }
}
