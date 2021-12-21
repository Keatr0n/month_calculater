import 'package:flutter/material.dart';
import 'package:month_calculator/month_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Month calendar',
      home: Scaffold(
        body: Center(child: DatePickerButtons()),
      ),
    );
  }
}

class DatePickerButtons extends StatelessWidget {
  const DatePickerButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Get date range length"),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 3650)),
        ).then((firstDate) {
          if (firstDate == null) return;
          showDatePicker(
            context: context,
            initialDate: firstDate.add(const Duration(days: 1)),
            firstDate: firstDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            selectableDayPredicate: (date) {
              if (date.isBefore(firstDate)) return false;
              return true;
            },
          ).then((lastDate) {
            // show a dialog with the date range length
            if (lastDate == null) return;
            final dateRange = DateTimeRange(start: firstDate, end: lastDate);
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Date range length"),
                  content: Text(
                    "${MonthCalculator.monthsInRange(dateRange).months} months and ${MonthCalculator.monthsInRange(dateRange).days} days",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });
        });
      },
    );
  }
}
