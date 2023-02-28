import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/data/api/get_user_name.dart';
import 'package:nrk_fitness/app/data/models/user_name_model.dart';
import 'package:nrk_fitness/app/ui/pages/07gym_screen/gym_content.dart';
import 'package:nrk_fitness/app/ui/pages/07gym_screen/gym_sch.dart';

import 'package:nrk_fitness/app/ui/pages/07gym_screen/week_bar.dart';

class GymScreen extends StatefulWidget {
  const GymScreen({super.key});

  @override
  State<GymScreen> createState() => _GymScreenState();
}

class _GymScreenState extends State<GymScreen> {
  late Future<UserNameModel> userNameModel;
  @override
  void initState() {
    super.initState();
    userNameModel = GetUserName().getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back,',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFA1A1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FutureBuilder<UserNameModel>(
                  future: userNameModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    } else if (snapshot.hasError) {}
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/png/logo.png',
              height: 75,
              width: 75,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                color: Color(0xffFFE9E9),
                thickness: 1,
              ),
              const SizedBox(
                height: 16,
              ),
              _showToadyDate(),
              const SizedBox(
                height: 16,
              ),
              _shoWweekBar(),
              const SizedBox(
                height: 15,
              ),
              _moMessage(),
              const SizedBox(
                height: 15,
              ),
              _loginFor(),
              const SizedBox(
                height: 15,
              ),
              _gymContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showToadyDate() {
    return Row(
      children: [
        const Text(
          'Sep 22',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xfff70000),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Text(
            'W12',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xffFFA1A1),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          children: [
            _leftRightArrow(),
          ],
        )
      ],
    );
  }

  Widget _leftRightArrow() {
    return Row(
      children: const [
        Icon(
          Icons.arrow_back_ios,
          size: 15,
          color: Color(0xffFA0000),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Color(0xffFA0000),
        ),
      ],
    );
  }

  Widget _shoWweekBar() {
    return SizedBox(
      height: 90,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: const [
                WeekBar(
                  color: Color(0xffF4FED7),
                  textColor: Color(0xff6AC868),
                  day: '14',
                  date: 'Mon',
                  dayColor: Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffF4FED7),
                  textColor: Color(0xff6AC868),
                  date: 'Tue',
                  day: '15',
                  dayColor: Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffFFEBEB),
                  textColor: Color(0xffFF0000),
                  date: 'Wed',
                  day: '16',
                  dayColor: Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffF4FED7),
                  textColor: Color(0xff6AC868),
                  date: 'Thu',
                  day: '17',
                  dayColor: Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                    color: Color(0xffF4FED7),
                    textColor: Color(0xff6AC868),
                    date: 'Fri',
                    day: '18',
                    dayColor: Colors.transparent),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffFFFFFF),
                  textColor: Color(0xffff0000),
                  date: 'Sat',
                  day: '19',
                  dayColor: Color(0xffFF0000),
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffFFFFFF),
                  textColor: Color(0xffD0D0D0),
                  date: 'Sun',
                  day: '20',
                  dayColor: Color(0xffD0D0D0),
                ),
                SizedBox(
                  width: 10,
                ),
                WeekBar(
                  color: Color(0xffFFFFFF),
                  textColor: Color(0xffD0D0D0),
                  date: 'Sun',
                  day: '20',
                  dayColor: Color(0xffD0D0D0),
                ),
              ],
            ),
          ]),
    );
  }

  Widget _moMessage() {
    return Stack(
      children: [
        Container(
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xffDAFFD3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Text(
            'You have no workout today',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff18C33E),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginFor() {
    return const Text(
      'Login for today, 19th',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xffFF0000),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _gymContent(context) {
    return Column(
      children: [
        GymContent(
          title: 'Learning',
          subTitle: 'Gym',
          bgColor: const Color(0xffFFF5F0),
          subTitleColor: const Color(0xffE55913),
          titleColor: const Color(0xffF2AB87),
          bSubTitile: 'Schedules',
          image: 'assets/png/gym.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GymSchedules(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        GymContent(
          title: 'Learning',
          subTitle: 'Workout',
          bgColor: const Color(0xffF0FFF9),
          subTitleColor: const Color(0xff00C677),
          titleColor: const Color(0xff8AC6AE),
          bSubTitile: 'Routines',
          image: 'assets/png/todo.png',
          onTap: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        GymContent(
          title: 'Learning',
          subTitle: 'Diet',
          bgColor: const Color(0xffF7F0FF),
          subTitleColor: const Color(0xff7200F4),
          titleColor: const Color(0xffB681F2),
          bSubTitile: 'planning',
          image: 'assets/png/apple.png',
          onTap: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        GymContent(
          title: 'Learning',
          subTitle: 'Cardio',
          titleColor: const Color(0xff81AEF2),
          bgColor: const Color(0xffE3F7FF),
          subTitleColor: const Color(0xff0053F4),
          bSubTitile: 'planning',
          image: 'assets/png/heart.png',
          onTap: () {},
        )
      ],
    );
  }
}
