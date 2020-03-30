import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class Worldtime{

   String location;
   String time;
   String flag;
   String url;
   bool isday;
   //constructor
   Worldtime(String a,String b,String c)
   {
     location=a;
     flag=b;
     url=c;
   }

    Future<void> getdata() async {
    Response response = await get("http://worldtimeapi.org/api/timezone/$url");
    Map data= jsonDecode(response.body);
    if(data.length==1)
      {
        time= data["error"];
      }
    else {
      String datetime = data["datetime"];
      String offsethrs = data["utc_offset"].substring(1, 3);
      String offsetmin = data["utc_offset"].substring(4, 6);
      //print(data["datetime"]);
      //print(offsethrs);
      //print(offsetmin);
      //flutter inbuilt function to convert data time string to date time object
      DateTime utc = DateTime.parse(datetime);
      DateTime localtime = utc.add(
          Duration(hours: int.parse(offsethrs), minutes: int.parse(offsetmin)));

      isday = (localtime.hour>6 && localtime.hour<19) ? true : false ;
      time = DateFormat.jm().format(localtime);
    }
  }
}