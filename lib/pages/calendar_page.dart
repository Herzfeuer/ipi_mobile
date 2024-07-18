import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertest2/event.dart';

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
  final Radius _borderRadius = const Radius.circular(12);
  String _month = '';

  static const _months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Окрябрь',
    'Ноябрь',
    'Декабрь',
  ];

  Map <DateTime, List<Event>> _events = {};

  // Functions
  List<Event> _getEventsForDay( DateTime day ) {
    return _events[day] ?? [];
  }

  // Initialisation
  @override
  void initState() {
    super.initState();

    // initializing month string
    _month = _months[DateTime.now().month - 1];

    // initializing some events for example
    _events[DateTime.utc(2024,7,18)] = [
      Event('Пасхалочка')
    ];
  }

  // Builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Calendar
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(height: 35),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      _month,
                      style: const TextStyle(
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

                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
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

                    eventLoader: _getEventsForDay,

                    // Styles

                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: const TextStyle(
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

          SizedBox(height: 10,),

          // События
          Expanded (
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay ?? _focusedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay ?? _focusedDay)[index];
                return Card (
                  color: Colors.blue[50],
                  shadowColor: Colors.transparent,
                  child: ListTile(
                    title: Text(event.title, style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black,
                    ),),
                    // trailing: Text('${event.time}'),
                    onTap: () {
                      // Handle event tap
                      debugPrint('Tapped on $event');
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
