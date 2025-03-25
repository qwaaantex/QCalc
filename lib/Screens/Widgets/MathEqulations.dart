import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MathEqulation extends StatefulWidget {
  const MathEqulation({super.key});

  @override
  State<MathEqulation> createState() => _MathEqulationState();
}

class _MathEqulationState extends State<MathEqulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            color: Theme.of(context).iconTheme.color,
            size: 34,
          ),
        ),
      ),
    );
  }
}
