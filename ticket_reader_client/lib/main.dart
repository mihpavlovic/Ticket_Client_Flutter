import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Proba servera")
        ),
        body: ListView(
          
          children: [
            Center(child: ElevatedButton(onPressed: ()async{
              
            final response = await http.get(Uri.parse('http://10.0.2.2:4000/tickets/getAll'));
              print("response i got ${response.body}");
              
            },
            child: Text("okokkk")
            )),
            
          ]
        )
      )
    );
  }
}

