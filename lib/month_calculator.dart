library month_calculator;

import 'package:flutter/material.dart';

/// internal function to check leap years
bool _isLeapYear(int year) {
  if (year % 100 == 0) return year % 400 == 0;
  return year % 4 == 0;
}

/// Holds the months and days in a dateTimeRange.
///
/// Returned by MonthCalculator.monthsInRange
class DayMonthCount {
  final int months;
  final int days;

  DayMonthCount(this.days, this.months);

  @override
  String toString() {
    return '{days: $days months: $months}';
  }
}

/// ## MonthCalculator
///
/// Calculates the number of months and days in a givin dateTimeRange.
///
/// Used like this:
/// ```dart
/// MonthCalculator.monthsInRange(DateTimeRange(start: startDate, end: endDate));
/// ```
///
/// This makes it really easy to calculate the number of months and days in a date range while accounting for leap years and uneven months.
class MonthCalculator {
  /// Returns the number of days and months in a givin dateTimeRange.
  static DayMonthCount monthsInRange(DateTimeRange range) {
    DateTime currentDate = range.start;
    int daysLeft = range.end.difference(range.start).inDays;
    int months = 0;

    while (true) {
      months++;
      if (currentDate.month < 12) {
        int daysLeftAfterSubtraction = daysLeft -
            DateTime(currentDate.year, currentDate.month + 1, 1)
                .subtract(const Duration(days: 1))
                .day;

        if (currentDate.month == 2 && _isLeapYear(currentDate.year)) {
          daysLeftAfterSubtraction--;
        }
        if (daysLeftAfterSubtraction < 0) {
          return DayMonthCount(daysLeft, months);
        }

        daysLeft = daysLeftAfterSubtraction;
        currentDate = DateTime(currentDate.year, currentDate.month + 1, 1);
      } else {
        int daysLeftAfterSubtraction = daysLeft - 31;
        if (daysLeftAfterSubtraction < 0) {
          return DayMonthCount(daysLeft, months);
        }
        // this is december so we already know all the numbers
        currentDate = DateTime(currentDate.year + 1, 1);
        daysLeft -= 31;
      }
    }
  }
}
