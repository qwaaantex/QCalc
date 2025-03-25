import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:qcalc/Screens/Widgets/CalculatorButtons.dart';
import 'package:qcalc/Screens/Widgets/CalculatorField.dart';
import 'package:qcalc/Screens/Widgets/Dots.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.deepOrange.shade400,
                builder: (context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.11,
                          height: MediaQuery.of(context).size.height * 0.01,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 12),
                        Dots(),
                        SizedBox(height: 18),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(
              HugeIcons.strokeRoundedMoreVertical,
              color: Theme.of(context).iconTheme.color,
              size: 34,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [CalculatorField(), CalculatorButtons()],
      ),
    );
  }
}
