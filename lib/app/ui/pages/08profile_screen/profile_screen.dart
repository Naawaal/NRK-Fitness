import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/profile_controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileControllerGetx = Get.put(ProfileControllerGetx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffe76f51),
                  Color(0xfff4a261),
                ],
              ),
            ),
            child: IconButton(
              onPressed: () {
                profileControllerGetx.signOutUser();
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ).marginAll(10),
        ],
      ),
    );
  }
}
