import 'package:flutter/material.dart';

import 'package:dayoftheweek/src/pages/home_page.dart';
import 'package:dayoftheweek/src/provider/date_provider.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new DateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DayOfTheWeek',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Dia de la semana'),
            ),
            body: HomePage()),
      ),
    );
  }
}
