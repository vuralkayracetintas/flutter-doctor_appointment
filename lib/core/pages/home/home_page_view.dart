import 'package:doctor_appointment/core/widgets/appointment_card.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.padding.medium,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('text'), CircleAvatar()],
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
                    color: Colors.red,
                    margin: context.padding.horizontalNormal,
                    child: Padding(
                      padding: context.padding.low,
                      child: Row(
                        children: [
                          FaIcon(medCat[index]['icon']),
                          SizedBox(
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
          Padding(
            padding: context.padding.onlyTopMedium,
            child: Text('Appointment Today',
                style: context.general.textTheme.titleMedium),
          ),
          AppointmentCard(),
        ],
      ),
    );
  }
}
