import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // variables

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  static const _months = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Окрябрь', 'Ноябрь', 'Декабрь', ];
  final Radius _borderRadius = Radius.circular(12);
  String _month = _months[DateTime.now().month];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Calendar
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 35),
            Container (
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Wrap (

                  children: [
                    Padding(
                        padding: EdgeInsets.all(3),
                        child: Text( _month, style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 35,
                        ),
                      ),
                    ),

                    TableCalendar(
                      headerVisible: false,
                      firstDay: DateTime.utc(2020),
                      lastDay: DateTime.utc(2050),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekHeight: 24.0,
                      locale: 'ru_RU',

                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },

                      onDaySelected: (selectedDay, focusedDay){
                        if (!isSameDay(_selectedDay, selectedDay)){
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        }
                      },

                      onPageChanged: (focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                          _month = _months[focusedDay.month - 1];
                        });
                      },

                      // Styles

                      daysOfWeekStyle: DaysOfWeekStyle(

                        weekdayStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),

                        weekendStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          color: Colors.blue[700],
                          fontSize: 20,
                        ),


                      ),

                      calendarStyle: CalendarStyle(

                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(_borderRadius),
                        ),

                        todayDecoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.all(_borderRadius),
                        ),

                        defaultTextStyle: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),

                        todayTextStyle: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.black,
                        ),

                        selectedTextStyle: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.white,
                        ),

                        outsideTextStyle: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.grey,
                        ),

                        holidayTextStyle: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.redAccent,
                        ),

                        weekendTextStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.blue[700],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
