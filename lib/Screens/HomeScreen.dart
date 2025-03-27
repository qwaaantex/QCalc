import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:qcalc/Screens/Widgets/CalculatorButtons.dart';
import 'package:qcalc/Screens/Widgets/Dots.dart';
import 'package:qcalc/Screens/MathEqulations.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) {
                  return SlideTransition(
                    position: animation1.drive(
                      Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
                    ),
                    child: MathEqulation(),
                  );
                },
              ),
            );
          },
          icon: Icon(
            HugeIcons.strokeRoundedMath,
            color: Theme.of(context).iconTheme.color,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.005,

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
      body: CalculatorButtons(),
    );
  }
}
