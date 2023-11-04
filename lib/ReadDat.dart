import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataDisplayScreen extends StatefulWidget {
  @override
  _DataDisplayScreenState createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  late Future<Map<String, dynamic>> latestData;

  Future<Map<String, dynamic>> fetchDataFromThingSpeak() async {
    final response = await http.get(
        Uri.parse('https://api.thingspeak.com/channels/2332099/feeds.json?api_key=31FCQSDRXNP2ATNZ'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final feeds = List<Map<String, dynamic>>.from(jsonResponse['feeds']);
      if (feeds.isNotEmpty) {
        return feeds.first; 
      }
    }
    throw Exception('Failed to fetch data from ThingSpeak');
  }

  @override
  void initState() {
    super.initState();
    latestData = fetchDataFromThingSpeak();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest ThingSpeak Data'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: latestData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListTile(
              title: Text('Latest Entry'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${data['field4']}'),
                  Text('Soil Moisture: ${data['field5']}'),
                  Text('Timestamp: ${data['created_at']}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
