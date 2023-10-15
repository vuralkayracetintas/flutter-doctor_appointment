import 'package:doctor_appointment/core/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppintmentsView extends StatefulWidget {
  const AppintmentsView({super.key});

  @override
  State<AppintmentsView> createState() => _AppintmentsViewState();
}

enum FilterStatus { upcoming, complate, cancel }

class _AppintmentsViewState extends State<AppintmentsView> {
  FilterStatus status = FilterStatus.upcoming;

  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      'doctor_name': 'Doctor Name',
      'doctor_profile': 'Doctor Category',
      'category': 'Category A',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Doctor Name',
      'doctor_profile': 'Doctor Category',
      'category': 'Category B',
      'status': FilterStatus.complate,
    },
    {
      'doctor_name': 'Doctor Name',
      'doctor_profile': 'Doctor Category',
      'category': 'Category C',
      'status': FilterStatus.complate,
    },
    {
      'doctor_name': 'Doctor Name',
      'doctor_profile': 'Doctor Category',
      'category': 'Doctor Category',
      'status': FilterStatus.cancel,
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complate':
      //     schedule['status'] = FilterStatus.complate;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          Text(
            'text',
            style: context.general.textTheme.headlineLarge,
          ),
          Padding(
            padding: context.padding.low,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: context.general.randomColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complate) {
                                  status = FilterStatus.complate;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Container(
                              height: context.sized.dynamicHeight(0.05),
                              width: context.sized.dynamicWidth(0.33),
                              child: Center(
                                child: Text(
                                  filterStatus.name,
                                  style:
                                      context.general.textTheme.headlineSmall,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    height: context.sized.dynamicHeight(0.05),
                    width: context.sized.dynamicWidth(0.33),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: context.general.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: filteredSchedules.length,
            itemBuilder: (context, index) {
              var _schedule = schedules[index];
              bool isLastItems = schedules.length + 1 == index;

              return Padding(
                padding: context.padding.low,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: isLastItems
                      ? EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: Padding(
                    padding: context.padding.low,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(),
                            SizedBox(width: context.sized.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _schedule['doctor_name'],
                                  // style: context.general.textTheme.titleMedium,
                                ),
                                Text(_schedule['category']),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 123, 115),
                                borderRadius: BorderRadius.circular(20)),
                            child: ScheduleCard(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Cancel')),
                              ),
                              SizedBox(width: context.sized.width * 0.1),
                              Expanded(
                                child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Reshedule')),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
