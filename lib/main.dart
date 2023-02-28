import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:nrk_fitness/nrk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const NrkFitness(),
  );
}
