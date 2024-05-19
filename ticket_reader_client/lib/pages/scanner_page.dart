import 'package:flutter/material.dart';
import 'package:ticket_reader_client/services/api.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  
  String scanningResultString = "";
  bool scanningResultBool = false;
  TextEditingController ticketIdController = new TextEditingController();

  checkTicketWithDB() async {
    //TimeOfDay timeOfDay = new TimeOfDay.now();
    DateTime dateTime = new DateTime.now();
    String tId = ticketIdController.text;
    String pom = await Api.checkOneTicket({"ticketId" : tId, "scannedTime":dateTime.toString()});
    if(pom.compareTo("VALID TICKET") == 0){
      scanningResultBool=true;
    } else {
      scanningResultBool=false;
    }
    print("scannerpage "+pom + " " + scanningResultBool.toString());
    setState(() {
      scanningResultString = pom;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: ticketIdController,
              
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: "Unesi broj karte...",
                
              ),
            ),
            
            ElevatedButton(
              onPressed: () async{
                await checkTicketWithDB();
                await showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    actions: [
                      TextButton(
                        onPressed: (){Navigator.of(context).pop();}, 
                        child: const Text("Close"), 
                      )
                    ],
                    title: Text(scanningResultBool ? "Uspesno ocitana karta" : "Karta je vec prethodno ocitana"),
                    backgroundColor: scanningResultBool ? Colors.green[300] : Colors.red[300],
                  )
                );
              },//buttonPress, 
              child: const Text("Posalji kartu")
            ),
          ]
        ),
      )
    );
  }
}