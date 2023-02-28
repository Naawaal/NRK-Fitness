import 'package:flutter/material.dart';

class SecondSplahImage extends StatelessWidget {
  const SecondSplahImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 135,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/png/secondSplash.png',
          ),
        ),
      ),
    );
  }
}
