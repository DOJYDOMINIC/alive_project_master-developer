// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiPage extends StatefulWidget {
//   @override
//   _ApiPageState createState() => _ApiPageState();
// }
//
// class _ApiPageState extends State<ApiPage> {
//   String response = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 fetchBlocks();
//               },
//               child: Text('Fetch Blocks'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Response:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(response),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> fetchBlocks() async {
//     final url = Uri.parse('http://192.168.1.52:8080/blocks?selectedDistrict=$select');
//
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         // Request successful, update the response state
//         setState(() {
//           this.response = response.body;
//         });
//       } else {
//         // Request failed, handle the error
//         setState(() {
//           this.response = 'Request failed with status code: ${response.statusCode}';
//         });
//       }
//     } catch (error) {
//       // An error occurred during the request
//       setState(() {
//         this.response = 'Request error: $error';
//       });
//     }
//   }
// }
