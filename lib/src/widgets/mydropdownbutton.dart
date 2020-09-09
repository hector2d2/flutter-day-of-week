import 'package:flutter/material.dart';

import 'package:dayoftheweek/src/provider/date_provider.dart';

import 'package:provider/provider.dart';

class MyDropDownButton extends StatelessWidget {
  List<String> listValues;
  bool isMonth;
  MyDropDownButton(List<String> lV,iM){
    this.listValues = lV;
    this.isMonth = iM;
  }

  @override
  Widget build(BuildContext context) {
  final values = Provider.of<DateProvider>(context);
    return DropdownButton<String>(
      value: this.isMonth ? values.month : values.day,
      items: this.listValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String value) {
          this.isMonth ? values.month = value : values.day = value;
      },
      iconSize: 24,
      icon: Icon(Icons.arrow_downward,color: Colors.blue,),
      style: TextStyle(fontSize: 20,color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      

    );
  }
}