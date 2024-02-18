import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> nobelPrizes = [];
  List<IconData> icons = [
    Icons.collections_bookmark,
    Icons.tungsten_sharp,
    Icons.star
  ];

  @override
  void initState() {
    super.initState();
    fetchNobelPrizes();
  }

  Future<void> fetchNobelPrizes() async {
    final response = await http
        .get(Uri.parse("https://irfangul92.github.io/index.json"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        nobelPrizes = data["nobelPrizes"];
      });
    } else {
      print("Error: Unable to fetch data. Status code ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text(
            'Nobel Prizes',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: nobelPrizes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index % icons.length],
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Year: ${nobelPrizes[index]['awardYear']}${'-'} ${nobelPrizes[index]['category']},',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900, fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedScreen(
                                      noblePrizeDetails: nobelPrizes[index],
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, ),
                          child: Text(
                            'Date Awarded: ${nobelPrizes[index]['dateAwarded']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50,  bottom: 10),
                          child: Text(
                            'laureates: ${nobelPrizes[index]['laureates'][0]['knownName']}',
                            style: const TextStyle(
                                fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 0, bottom: 5, right: 10),
                          child: Text(
                            'Motivation: ${nobelPrizes[index]['laureates'][0]['motivation']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
