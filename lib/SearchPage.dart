import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<String> _jobOffers = [
    'Software Engineer',
    'Data Scientist',
    'UX/UI Designer',
    // Add more job offers as needed
  ];

  List<String> _filteredJobOffers = [];

  @override
  void initState() {
    super.initState();
    _filteredJobOffers = _jobOffers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildSearchBar(),
          buildFilterOptions(),
          Expanded(
            child: buildJobList(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Search Page'),
      // Customize your app bar as needed
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (query) {
          setState(() {
            _searchQuery = query;
            _filteredJobOffers = _jobOffers
                .where((job) =>
                job.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();
          });
        },
        decoration: InputDecoration(
          labelText: 'Search for a job',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget buildFilterOptions() {
    // Implement your filter options here
    // For example, you can use DropdownButton or ToggleButtons
    // to allow users to filter job offers based on categories, locations, etc.
    return Container(
      // Add your filter widgets here
    );
  }

  Widget buildJobList() {
    return ListView.builder(
      itemCount: _filteredJobOffers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_filteredJobOffers[index]),
          // Add more details or customize the list item as needed
        );
      },
    );
  }
}

