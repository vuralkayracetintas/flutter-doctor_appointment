import 'package:doctor_appointment/core/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        // color: Colors.red,
        child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: const Text('Doctor Name'),
          subtitle: const Text('Doctor Category'),
        ),
        ScheduleCard(),
        Padding(
          padding: context.padding.low,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Button cancel',
                    style: context.general.textTheme.labelLarge,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: context.sized.width * 0.02),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Button Complete',
                    style: context.general.textTheme.labelLarge,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
