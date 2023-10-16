import 'package:doctor_appointment/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class DoctorDetailsView extends StatefulWidget {
  const DoctorDetailsView({super.key});

  @override
  State<DoctorDetailsView> createState() => _DoctorDetailsViewState();
}

class _DoctorDetailsViewState extends State<DoctorDetailsView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Deteails',
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: FaIcon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const AboutDoctor(),
              SizedBox(height: context.sized.height * 0.02),
              const DetailBody(),
              Padding(
                padding: context.padding.low,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Doctor',
                      style: context.general.textTheme.titleMedium,
                    ),
                    SizedBox(height: context.sized.height * 0.02),
                    Text(
                      'General surgery specialist. Proficient in surgical interventions and operations, including emergency surgical cases.',
                      style: context.general.textTheme.bodyMedium,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.border.lowBorderRadius),
                    minimumSize: Size(context.sized.width * 0.89,
                        context.sized.height * 0.05),
                  ),
                  onPressed: () {
                    context.route.navigateName('book_appointment');
                  },
                  child: const Text('Book Appointment'))
            ],
          ),
        ),
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.low,
      margin: context.padding.onlyBottomLow,
      child: Column(
        children: [
          Row(
            children: [
              const InfoCard(
                title: 'Patients',
                value: '100',
              ),
              SizedBox(width: context.sized.width * 0.02),
              const InfoCard(
                title: 'Exprerience',
                value: '10 years',
              ),
              SizedBox(width: context.sized.width * 0.02),
              const InfoCard(
                title: 'Rating',
                value: '4.5',
              )
            ],
          )
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: context.sized.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: context.border.normalBorderRadius,
          color: Colors.purpleAccent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.general.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.sized.height * 0.01),
          Text(
            value,
            style: context.general.textTheme.titleMedium,
          )
        ],
      ),
    ));
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
            "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg?w=1380&t=st=1697382252~exp=1697382852~hmac=4f6c791c0eefdee55a488197636720093ab05138a46d2beb609a11176531ebf0",
          ),
          radius: context.sized.height * 0.12,
        ),
        SizedBox(height: context.sized.height * 0.02),
        Text(
          'Doctor Name',
          style: context.general.textTheme.displaySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: context.sized.height * 0.02),
        Text(
          'Medical School, University of Istanbul (MD)',
          style: context.general.textTheme.bodyMedium,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.sized.height * 0.02),
        Text(
          'City General Hospital',
          style: context.general.textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
