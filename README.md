<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This will calculate the days and months in a givin date time range.
It will also account for leap years.

So if we have a range like this 
``` dart 
  DateTimeRange(start: DateTime(2023, 12, 20), end: DateTime(2024, 3, 21))
```
It will return 4 months and 0 days, but if we run the same thing with 2021 and 2022 we'll get 4 months and 1 day.

## Usage



```dart
final DateTimeRange rangeToMeasure = DateTimeRange(start: DateTime(2023, 12, 20), end: DateTime(2024, 3, 21));

final DayMonthCount count = MonthCalculator.monthsInRange(rangeToMeasure);

print("${count.months} months and ${count.days} days");
```

## Additional information

Feel free to make a PR if ya wanna add something cool or just improve efficiency.
