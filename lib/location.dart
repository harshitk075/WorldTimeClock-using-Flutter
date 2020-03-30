import 'package:flutter/material.dart';
import 'package:worldclockapp/services/world_time.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<Worldtime> locations = [
    Worldtime('London','uk.png','Europe/London'),
    Worldtime('Athens','greece.png','Europe/Berlin'),
    Worldtime('Cairo','egypt.png','Africa/Cairo'),
    Worldtime('Nairobi','kenya.png','Africa/Nairobi'),
  ];

  void changedata(index) async {
    Worldtime inst = locations[index];
    await inst.getdata();
    Navigator.pop(context , {
      'location' : inst.location,
      'flag'     : inst.flag,
      'time'     : inst.time,
      'isday'    : inst.isday,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Location"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(    //this is another method than Map to print/enumerate list items
          itemCount: locations.length,
          itemBuilder: (context,index){
             return Card(
               child: ListTile(
                 onTap: (){
                    changedata(index);
                 },
                 title: Text(locations[index].location),
                 leading: CircleAvatar(
                  backgroundImage:  AssetImage("asset/${locations[index].flag}"),
                 )
               ),
             );
          },
      )
    );
  }
}
