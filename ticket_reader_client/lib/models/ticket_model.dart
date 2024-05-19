class Ticket{
  final String? ticketId;
  String? scanTime;
  bool? isScanned;

  Ticket({this.ticketId, this.scanTime, this.isScanned });

  @override
  String toString() {
    // TODO: implement toString
    String toRet = "ticketId" + ticketId! + "\nscanTime: " + scanTime! +"\nisScanned: "+ isScanned.toString();
    return toRet;
  }
}