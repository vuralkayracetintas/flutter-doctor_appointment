import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:table_calendar/table_calendar.dart';

class BoookAppintment extends StatefulWidget {
  const BoookAppintment({super.key});

  @override
  State<BoookAppintment> createState() => _BoookAppintmentState();
}

class _BoookAppintmentState extends State<BoookAppintment> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentday = DateTime.now();
  int? _currentIndex;
  bool _isExpanded = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  bool _isWeekend = false;
  bool control = true;

  _BoookAppintmentState() {
    control = _timeSelected && _dateSelected ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                tableCalendar(),
                Padding(
                  padding: context.padding.medium,
                  child: Text(
                    'Select Consultation Time',
                    style: context.general.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    child: const Text(
                      'Weekend is not available, please select another day ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: context.padding.medium,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.deepPurple
                                : null,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index}"00 ${index + 9 > 11 ? ' PM' : 'AM'}',
                            textAlign: TextAlign.center,
                          ),
                        ));
                  }, childCount: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              child: CustomButton(
                width: context.sized.width,
                title: 'Make Appoontment',
                onPressed: () {
                  context.route.navigateName('success_booked');
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Text x() => const Text('text');
  Widget tableCalendar() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2030),
      currentDay: _currentday,
      rowHeight: 45,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentday = selectedDay;
          _focusedDay = focusedDay;
          _dateSelected = true;

          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable})
      : super(key: key);

  final double width;
  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
