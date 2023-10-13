import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
        color: Colors.red,
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(),
            title: const Text('Doctor Name'),
            subtitle: const Text('Doctor Category'),
          )
        ]));
  }
}
