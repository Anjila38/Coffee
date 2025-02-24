
import 'package:flutter/material.dart';

import 'detailspage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List items = [
    'Americano',
    'Latte',
    'Espresso',
    'Cappuccino',
    'Mocha',
    'Macchiato',
    'Bubble Tea'
  ];
  List photos = [
    'lib/assets/img1.png',
    'lib/assets/img2.png',
    'lib/assets/img3.png',
    'lib/assets/img4.png',
    'lib/assets/img5.png',
    'lib/assets/img6.png',
    'lib/assets/img7.png',
  ];

  List filteredItems = [];
  List filteredPhotos = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    filteredPhotos = photos;
  }

  void updateSearch(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Filter photos based on the same query for consistent results
      filteredPhotos = photos.take(filteredItems.length).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 227),
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 252, 227)),
        title: Text(
          'Your coffee, your way',
          style: TextStyle(color: const Color.fromARGB(255, 255, 252, 227)),
        ),
        automaticallyImplyLeading: true, // Back button will now work
        backgroundColor: const Color.fromARGB(255, 59, 122, 48),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(filteredItems[index]),
                      leading: Image.asset(
                        filteredPhotos[index],
                        width: 50,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Details(
                                imageDetail: filteredPhotos[index],
                                coffeeItem: filteredItems[index],
                              );
                            },
                          ));
                        },
                        icon: Icon(Icons.arrow_circle_right_rounded),
                        color: const Color(0xFF3B7A30),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
