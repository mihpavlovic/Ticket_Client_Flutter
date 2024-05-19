import "dart:convert";

import "package:http/http.dart" as http;
import "package:ticket_reader_client/models/ticket_model.dart";

class Api{
  static const baseUrl = "http://10.0.2.2:4000/tickets";


  //dohvatanje svih karata 
  static getAllTickets() async{
    List<Ticket> tickets_from_db = [];
    
    var url = Uri.parse("${baseUrl}/getAll");
    
    try{
      final res = await http.get(url);

      if(res.statusCode == 200){
        var data = jsonDecode(res.body);
        print(data);
        data.forEach((value)=>{
          tickets_from_db.add(
            Ticket(ticketId: value['ticketId'], scanTime: value['scannedTime'], isScanned: value['isScanned'])
          )
        }
        );
        tickets_from_db.forEach((element) { print(element.toString()); });
        return tickets_from_db;
      } else {
        return [];
      }
    } catch(e){
      print(e.toString());
    }
  }
}