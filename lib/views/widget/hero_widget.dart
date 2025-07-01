import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero1',
      child: AspectRatio(
        aspectRatio: 1920 / 1080,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'asset/images/leaves.jpg',
            color: Colors.amberAccent,
            colorBlendMode: BlendMode.darken,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
