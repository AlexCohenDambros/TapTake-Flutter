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
  TimeOfDay? time = TimeOfDay.now();

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
          FlutterCalendar(
              selectionMode: CalendarSelectionMode.single,
              minDate: DateTime.now().subtract(const Duration(days: 0)),
              maxDate: DateTime.now().subtract(const Duration(days: 30)),
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
          const Text(
            "Selecione um horário: ",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: kSecondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () async {
                  TimeOfDay? newtime = await showTimePicker(
                    context: context,
                    initialTime: time!,
                  );
                  if (newtime != null) {
                    setState(() {
                      time = newtime;
                    });
                  }
                },
                child: Text(
                  "${time!.hour.toString()}:${time!.minute.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
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
