import 'package:flutter/material.dart';

import 'package:nrk_fitness/app/ui/pages/07gym_screen/gym_content.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class GymSchedules extends StatelessWidget {
  const GymSchedules({super.key});

  static const routeName = '/gym-schedules';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back',
            style: TextStyle(
              color: Color(0xffF70000),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            )),
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffF70000),
            weight: 2,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _gymSchedules(),
            const SizedBox(height: 20),
            _headerText(),
            const SizedBox(height: 15),
            _headerContent(),
            const SizedBox(height: 20),
            _imageContainer(context),
            const SizedBox(height: 15),
            _secondHeader(),
            _buttomContent(),
            const SizedBox(height: 15),
            _credit(),
          ],
        ),
      ),
    );
  }

  Widget _gymSchedules() {
    return GymContent(
      title: 'Learning',
      subTitle: 'Gym',
      bgColor: const Color(0xffFFF5F0),
      subTitleColor: const Color(0xffE55913),
      titleColor: const Color(0xffF2AB87),
      bSubTitile: 'Schedules',
      image: 'assets/png/gym.png',
      onTap: () {},
    );
  }

  Widget _headerText() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.topLeft,
      child: const Text(
        'Consectetur adipiscing elit.',
        style: TextStyle(
          fontSize: 24,
          color: Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _headerContent() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: const Text(
        TextConst.textConst,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff808080),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _imageContainer(context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/gym_image.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _secondHeader() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      alignment: Alignment.topLeft,
      child: const Text(
        'Sed id.',
        style: TextStyle(
          fontSize: 24,
          color: Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buttomContent() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: const Text(
        TextConst.buttomConst,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff808080),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _credit() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          RichText(
              text: const TextSpan(
            children: [
              TextSpan(
                text: 'written by ',
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'NRK Fitness ',
                style: TextStyle(
                  color: Color(0xffF70000),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'on 13th Jan 2022',
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
