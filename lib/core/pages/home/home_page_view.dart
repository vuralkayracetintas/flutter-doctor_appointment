import 'package:doctor_appointment/core/widgets/appointment_card.dart';
import 'package:doctor_appointment/core/widgets/doctor_card.dart';
import 'package:doctor_appointment/core/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> medCat = [
      {
        'icon': FontAwesomeIcons.userDoctor,
        'text': 'General',
      },
      {
        'icon': FontAwesomeIcons.heartPulse,
        'text': 'Cardiology',
      },
      {
        'icon': FontAwesomeIcons.lungs,
        'text': 'Respirations',
      },
      {
        'icon': FontAwesomeIcons.hand,
        'text': 'Dermatology',
      },
      {
        'icon': FontAwesomeIcons.personPregnant,
        'text': 'Gynecology',
      },
      {
        'icon': FontAwesomeIcons.userDoctor,
        'text': 'Dental',
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.low,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User Name ',
                      style: context.general.textTheme.titleLarge),
                  CircleAvatar(
                    radius: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: context.padding.low,
              child: Text('Categories',
                  style: context.general.textTheme.headlineMedium),
            ),
            SizedBox(
              height: context.sized.height * 0.05,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      // color: Colors.red,
                      margin: context.padding.horizontalNormal,
                      child: Padding(
                        padding: context.padding.low,
                        child: Row(
                          children: [
                            FaIcon(medCat[index]['icon']),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              medCat[index]['text'],
                              style: context.general.textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
            SizedBox(height: context.sized.height * 0.03),
            Padding(
              padding: context.padding.low,
              child: Text('Appointment Today',
                  style: context.general.textTheme.titleMedium),
            ),
            const AppointmentCard(),
            Padding(
              padding: context.padding.low,
              child: Text('Top Doctors',
                  style: context.general.textTheme.titleMedium),
            ),
            Column(
                children: List.generate(
                    10,
                    (index) => DoctorCard(
                          route: 'doc_details',
                        )))
          ],
        ),
      ),
    );
  }
}
