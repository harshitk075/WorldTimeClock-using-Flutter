import 'package:flutter/material.dart';
import 'package:worldclockapp/home.dart';
import 'package:worldclockapp/loading.dart';
import 'package:worldclockapp/location.dart';

void main() => runApp(MaterialApp(
  //we will start by defining routes to move between screens
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
  },
));
