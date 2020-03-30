import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};
  @override
  Widget build(BuildContext context) {

    //here i receive data from /loading route
    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String img = (data['isday'])? 'dayfinal.jpg': 'nightfinal.jpg';
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("asset/$img"),
             fit: BoxFit.cover,
           ),
         ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton.icon(
                   onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context, "/location");
                   if(result!=null){
                   setState(() {
                     data= result;
                   });
                   }
                 },
                   icon: Icon(Icons.edit_location,color: Colors.white,),
                   label: Text(
                     "Change Location",
                     style: TextStyle(
                       color: Colors.white,
                       letterSpacing: 2.0,
                     ),

                   ),
               ),
               SizedBox(height: 20.0),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     "${data['location']}",
                     style: TextStyle(
                       color: Colors.white,
                       letterSpacing: 2.0,
                       fontSize: 50.0,
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 20.0),
               Text(
                 "${data['time']}",
                 style: TextStyle(
                   color: Colors.white,
                   letterSpacing: 2.0,
                   fontSize: 60.0,
                 ),
               ),
             ],
           ),
         ),
       )

    );
  }
}
