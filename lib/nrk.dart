import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/routes/routes.dart';
import 'package:nrk_fitness/app/ui/theme/fonts.dart';

class NrkFitness extends StatelessWidget {
  const NrkFitness({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: FontConst.primaryFonts,
      ),
      getPages: Routes.appRoutes(),
    );
  }
}
