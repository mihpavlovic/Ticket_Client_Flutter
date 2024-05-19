import 'package:flutter/material.dart';
import 'package:ticket_reader_client/models/ticket_model.dart';
import 'package:ticket_reader_client/services/api.dart';
class AllTicketsPage extends StatefulWidget {
  const AllTicketsPage({super.key});

  @override
  State<AllTicketsPage> createState() => _AllTicketsPageState();
}

class _AllTicketsPageState extends State<AllTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Api.getAllTickets(), 
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          } else {
            List<Ticket> pdata = snapshot.data;
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index ){
                return ListTile(
                  leading: const Icon(Icons.qr_code),
                  title: Text("${pdata[index].ticketId}"),
                  subtitle: Text("${pdata[index].isScanned}"),
                  trailing: Text("${pdata[index].scanTime}"),
                );
              }
              );
          }
          
        },
        )
    );
  }
}