import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:month_calculator/month_calculator.dart';

void main() {
  test('ensures the proper count of february', () {
    final DayMonthCount threeMonths = MonthCalculator.monthsInRange(DateTimeRange(start: DateTime(2021, 12, 20), end: DateTime(2022, 3, 19)));
    final DayMonthCount fourMonths = MonthCalculator.monthsInRange(DateTimeRange(start: DateTime(2021, 12, 20), end: DateTime(2022, 3, 20)));

    expect(threeMonths.months, 3);
    expect(fourMonths.months, 4);
  });
  test('ensures the counting of leap years', () {
    final DayMonthCount threeMonths = MonthCalculator.monthsInRange(DateTimeRange(start: DateTime(2023, 12, 20), end: DateTime(2024, 3, 20)));
    final DayMonthCount fourMonths = MonthCalculator.monthsInRange(DateTimeRange(start: DateTime(2023, 12, 20), end: DateTime(2024, 3, 21)));
    expect(threeMonths.months, 3);
    expect(fourMonths.months, 4);
  });
}
