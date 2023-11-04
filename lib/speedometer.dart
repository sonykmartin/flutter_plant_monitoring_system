// import 'package:flutter/material.dart';
// import 'package:flutter_gauges/flutter_gauges.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SpeedometerWidget extends StatefulWidget {
//   @override
//   _SpeedometerWidgetState createState() => _SpeedometerWidgetState();
// }

// class _SpeedometerWidgetState extends State<SpeedometerWidget> {
//   double temperature = 0.0;
//   double pressure = 0.0;
//   double soilMoisture = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final apiKey = 'ZN80PFE0AVLPGO4A';
//     final apiUrl = 'https://api.thingspeak.com/update?api_key=$apiKey&results=1';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           temperature = data['feeds'][0]['field1'];
//           pressure = data['feeds'][0]['field2'];
//           soilMoisture = data['feeds'][0]['field3'];
//         });
//       } else {
//         print('HTTP request failed with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error sending HTTP request: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Text(
//             'Temperature: ${temperature.toStringAsFixed(2)}°C',
//             style: TextStyle(fontSize: 20),
//           ),
//           GaugePointer(
//             value: temperature,
//             color: Colors.red,
//           ),
//           Text(
//             'Pressure: ${pressure.toStringAsFixed(2)} kPa',
//             style: TextStyle(fontSize: 20),
//           ),
//           GaugePointer(
//             value: pressure,
//             color: Colors.blue,
//           ),
//           Text(
//             'Soil Moisture: ${soilMoisture.toStringAsFixed(2)}%',
//             style: TextStyle(fontSize: 20),
//           ),
//           GaugePointer(
//             value: soilMoisture,
//             color: Colors.green,
//           ),
//         ],
//       ),
//     );
//   }
// }
