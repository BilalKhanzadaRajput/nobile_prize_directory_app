import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final dynamic noblePrizeDetails;

  const DetailedScreen({Key? key, required this.noblePrizeDetails})
      : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text(
            'Detailed Screen',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                width: 500,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Laureates: ${widget.noblePrizeDetails['laureates'][0]['knownName']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.event_note,
                      color: Colors.blue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'awardYear: ${widget.noblePrizeDetails['awardYear']}',
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.category, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text('category: ${widget.noblePrizeDetails['category']}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                            'FullName: ${widget.noblePrizeDetails['categoryFullName']}',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                        'Date Awarded: ${widget.noblePrizeDetails['dateAwarded']}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                        'prize Amount: ${widget.noblePrizeDetails['prizeAmount']}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                        'prize Amount Adjusted: ${widget.noblePrizeDetails['prizeAmountAdjusted']}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb_outline, color: Colors.blue),
                    const SizedBox(width: 8),
                    Container(
                      width: 300, // Set a suitable width for your paragraph
                      child: Text(
                        'Motivation For Award: ${widget.noblePrizeDetails['laureates'][0]['motivation']}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
