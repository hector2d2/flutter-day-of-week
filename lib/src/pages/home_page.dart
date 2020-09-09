import 'package:flutter/material.dart';

import 'package:dayoftheweek/src/widgets/mydropdownbutton.dart';
import 'package:dayoftheweek/src/provider/date_provider.dart';
import 'package:dayoftheweek/src/model/day_of_week.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  List<String> listDays;
  List<String> listMonths;

  initValues() {
    listDays = new List<String>();
    listMonths = new List<String>();
    for (int i = 1; i < 32; i++) {
      listDays.add(i.toString());
      if (i < 13) listMonths.add(i.toString());
    }
  }

  inputData(String title, List<String> listValues, bool isMonth) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Text(title),
          MyDropDownButton(listValues, isMonth),
        ],
      ),
    );
  }

  rowForInputData(BuildContext context) {
    final year = Provider.of<DateProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        inputData('Dia', listDays, false),
        SizedBox(width: 30.0),
        inputData('Mes', listMonths, true),
        SizedBox(width: 30.0),
        Container(
          height: 80,
          width: 100,
          child: Column(
            children: <Widget>[
              Text('Año'),
              Container(
                height: 39,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: year.year,
                  ),
                  onChanged: (String value) {
                    year.year = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<DateProvider>(context);
    initValues();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Ingrese la Fecha'),
              SizedBox(height: 20),
              rowForInputData(context),
              RaisedButton(
                onPressed: () {
                  values.dayOfWeek = getDayOfTheWeek(int.parse(values.year),
                      int.parse(values.month), int.parse(values.day));
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 10,),
              Text(values.dayOfWeek),
            ],
          ),
        ),
      ),
    );
  }
}
