List<String> getMonth(int m) {
  if (m == 1) return ['ENE', 'ENERO'];
  if (m == 2) return ['FEB', 'FEBRERO'];
  if (m == 3) return ['MAR', 'MARZO'];
  if (m == 4) return ['ABR', 'ABRIL'];
  if (m == 5) return ['MAY', 'MAYO'];
  if (m == 6) return ['JUN', 'JUNIO'];
  if (m == 7) return ['JUL', 'JULIO'];
  if (m == 8) return ['AGO', 'AGOSTO'];
  if (m == 9) return ['SEP', 'SEPTIEMBRE'];
  if (m == 10) return ['OCT', 'OCTUBRE'];
  if (m == 11) return ['NOV', 'NOVIEMBRE'];
  if (m == 12) return ['DIC', 'DICIEMBRE'];
}

void printDayCalendary(int m, int di, bool b) {
  int d = 0;
  int _di = 0;
  if (di == 0)
    _di = 3;
  else if (di == 1)
    _di = 4;
  else if (di == 2)
    _di = 5;
  else if (di == 3)
    _di = 6;
  else if (di == 4)
    _di = 0;
  else if (di == 5)
    _di = 1;
  else if (di == 6) _di = 2;

  if (m == 1)
    d = 31;
  else if (m == 2) {
    if (b == true)
      d = 29;
    else
      d = 28;
  } else if (m == 3)
    d = 31;
  else if (m == 4)
    d = 30;
  else if (m == 5)
    d = 31;
  else if (m == 6)
    d = 30;
  else if (m == 7)
    d = 31;
  else if (m == 8)
    d = 31;
  else if (m == 9)
    d = 30;
  else if (m == 10)
    d = 31;
  else if (m == 11)
    d = 30;
  else if (m == 12) d = 31;

  // List<String> daysincal = new List<String>();

  // int lengthdaysincal = d + _di;
  // if (lengthdaysincal > 28 && lengthdaysincal <= 35)
  //   for (int i = 0; i < 35; i++) daysincal.add('- -');
  // else if (lengthdaysincal > 35)
  //   for (int i = 0; i < 42; i++) daysincal.add('- -');
  // else
  //   for (int i = 0; i < 28; i++) daysincal.add('- -');

  // for (int i = 1; i < d + 1; i++) {
  //   if (i >= 10)
  //     daysincal[_di] = i.toString() + ' ';
  //   else
  //     daysincal[_di] = ' ' + i.toString() + ' ';
  //   _di = _di + 1;
  // }

  // int i = 0;
  // int end = daysincal.length;
  // String r = '';
  // while (i < end) {
  //   for (int j = 0; j < 7; j++) {
  //     // print(daysincal[i]);
  //     r += daysincal[i] + ' ';
  //     i = i + 1;
  //   }
  //   // print('');
  //   r += '/n';
  // }
}

int getMonthDiference(int m) {
  if (m == 1 || m == 7)
    return 3;
  else if (m == 2 || m == 10)
    return 4;
  else if (m == 3 || m == 6 || m == 0)
    return 0;
  else if (m == 4 || m == 12)
    return 2;
  else if (m == 5)
    return 5;
  else if (m == 8 || m == 11)
    return 6;
  else if (m == 9) return 1;
}

String getDayInText(int d) {
  if (d == 0)
    return 'MIERCOLES';
  else if (d == 1)
    return 'JUEVES';
  else if (d == 2)
    return 'VIERNES';
  else if (d == 3)
    return 'SABADO';
  else if (d == 4)
    return 'DOMINGO';
  else if (d == 5)
    return 'LUNES';
  else if (d == 6) return 'MARTES';
}

String getDayOfTheWeek(int year, int month, int day) {
  try{
  if (year > 0) {
    if (month > 0 && month < 13) {
      if (day > 0 && day < 32) {
        List<String> monthInText = getMonth(month);
        // printHeader(year,monthInText[0]);
        int yearreference = 2020;
        bool leapYear = false;
        int numLeapYear = 0;
        int yeardiference = 0;
        int dayfeb29 = 0;
        int leapYearReference = 489;
        yeardiference = year - yearreference;
        int monthDiference = getMonthDiference(month - 1);
        numLeapYear = ((((year - 1) / 4).toInt() -
                ((year - 1) / 100).toInt() +
                ((year - 1) / 400).toInt())) -
            leapYearReference;
        if (year % 4 == 0 && year % 100 != 0 ||
            year % 100 == 0 && year % 400 == 0)
          leapYear = true;
        else if (month > 2) dayfeb29 = -1;
        int firstDayInMonth =
            (monthDiference + yeardiference + numLeapYear + dayfeb29) % 7;
        printDayCalendary(month, firstDayInMonth, leapYear);
        String dayInText = getDayInText((day - 1 + firstDayInMonth) % 7);
        print('');
        String r = 'EL ' +
            day.toString() +
            ' DE ' +
            monthInText[1] +
            ' DE ' +
            year.toString() +
            ' ES ' +
            dayInText;
        return r;
      } else
        return 'EL DÍA ESTÁ FUERA DE RANGO';
    } else
      return 'EL MES ESTÁ FUERA DE RANGO';
  } else
    return 'EL AÑO ESTÁ FUERA DE RANGO';

  }catch(Exception){
    return 'Limite de valor alcanzado';
  }
}
