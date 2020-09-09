import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier{
  String _day = '1';
  String _month = '1';
  String _year = DateTime.now().year.toString();
  String _dayOfWeek = '';

  set day(String value){
    this._day = value;
    notifyListeners();
  }

  String get day => this._day;

  set month(String value){
    this._month = value;
    notifyListeners();
  }

  String get month => this._month;
  
  set year(String value){
    this._year = value;
    notifyListeners();
  }

  String get year => this._year;

  set dayOfWeek(String value){
    this._dayOfWeek = value;
    notifyListeners();
  }

  String get dayOfWeek => this._dayOfWeek;
}