import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Container(
        width: context.sized.width,
        padding: context.padding.low,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today),
            SizedBox(width: context.sized.width * 0.02),
            const Text('Monday, 11.22.2021'),
            SizedBox(width: context.sized.width * 0.05),
            const Icon(Icons.access_alarm),
            SizedBox(width: context.sized.width * 0.02),
            const Flexible(child: Text('2.00'))
          ],
        ),
      ),
    );
  }
}
