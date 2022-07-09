// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:tap_take/Screens/Payment/payment.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/constants.dart';

class Scheduling extends StatefulWidget {
  const Scheduling({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SchedulingStateState createState() => _SchedulingStateState();
}

class _SchedulingStateState extends State<Scheduling> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendamento"),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: size.height * 0.02, child: Container()),
          FlutterCalendar(
              selectionMode: CalendarSelectionMode.single,
              minDate: DateTime.now().subtract(const Duration(days: 0)),
              maxDate: DateTime.utc(2030, 3, 14),
              focusedDate: DateTime.now(),
              locale: "pt_BR",
              textStyle: const CalendarTextStyle(
                  selectedDayTextColor: kPrimaryColor,
                  dayOfWeekTextColor: kPrimaryColor,
                  dayTextColor: Colors.white,
                  outsideDayTextColor: kSecondaryColor,
                  focusedDayTextColor: Colors.yellow,
                  headerTextStyle: TextStyle(color: kPrimaryColor)),
              style: const CalendarStyle(
                  headerLeftIcon: Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                  ),
                  headerRightIcon: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                  )),
              onDayPressed: (DateTime date) {}),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
            text: "Próximo",
            press: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Payment(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
        ]),
      ),
    );
  }
}
