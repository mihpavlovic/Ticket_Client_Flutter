import 'package:flutter/material.dart';
import 'package:ticket_reader_client/pages/list_of_tickets_page.dart';
import 'package:ticket_reader_client/pages/scanner_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    ScannerPage(),
    AllTicketsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(child: Text("Ticket reader app", style: TextStyle(fontWeight: FontWeight.bold),)),
        elevation: 0,
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "Scanner"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "All tickets" 
          )

        ]
      ),
    );
  }
}