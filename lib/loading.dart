import 'package:flutter/material.dart';
import 'package:worldclockapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  settime() async{
     Worldtime inst= Worldtime("kolkata","S","Asia/kolkata");
     //call getdatamethod
     await inst.getdata();
     //print time variable;
    //but we have to wait for the response before printing
     setState(() {
       //here i redirect to home page with my data to print
       //pushReplacementNamed  replaces the beneath window screen with current
       Navigator.pushReplacementNamed(context, '/home', arguments: {
             'location' : inst.location,
             'flag'     : inst.flag,
             'time'     : inst.time,
             'isday'    : inst.isday,
       });
     });
  }
  @override
  void initState() {
    super.initState();
    settime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
