import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

void printLog(dynamic printed) {
  if (kDebugMode) {
    print(printed);
  }
}

String dateToString(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
}

String momentTime(String? dateInput) {
  final temp = (DateTime.tryParse(dateInput ?? '') ?? DateTime.now());

  final moment = Moment(temp);

  return moment.calendar();
}
