import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
   final List<Map<String, dynamic>> _allProduct = [
    {"id": 1, "name": "Andy", "age": 12},
    {"id": 2, "name": "soriya", "age": 22},
    {"id": 3, "name": "Andy", "age": 12},
    {"id": 4, "name": "soriya", "age": 22},
    {"id": 5, "name": "Andy", "age": 12},
    {"id": 6, "name": "soriya", "age": 22},
  ];
  List<Map<String, dynamic>> _foundUser =[];
  @override
  void initState() {
    _foundUser=_allProduct;
    super.initState();
  }
  void _runFilter(String enterKeyword){
     List<Map<String, dynamic>> _results =[];
     if(enterKeyword.isEmpty){
      _results=_allProduct;
     }else{
      _results=_allProduct
       .where((user) => user['name'].toLowerCase().contains(enterKeyword.toLowerCase()))
         .toList();
     }
     setState(() {
       _foundUser=_results;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                hintText: 'Search', 
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foundUser.length,
              itemBuilder: (context, index) {
                final product = _foundUser[index];
                return Card(
                  color: Colors.green,
                  child: ListTile(
                    leading: Text(product['id'].toString()),
                    title: Text('${product["name"]}'),
                    subtitle: Text('${product["age"]}'),
                    // Add more widgets to display additional information
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
