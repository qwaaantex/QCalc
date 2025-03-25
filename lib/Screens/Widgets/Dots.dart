import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorLogics bloc = BlocProvider.of<CalculatorLogics>(context);
    CalculatorLogicsNotificationsBLoc blocLogic =
        BlocProvider.of<CalculatorLogicsNotificationsBLoc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CalculatorLogics, bool>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).highlightColor,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          activeColor: Theme.of(context).focusColor,
                          value: state,
                          onChanged: (value) {
                            bloc.add(CalculatorLogicsTheme(value));
                          },
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Сменить тему",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        BlocBuilder<CalculatorLogicsNotificationsBLoc, bool>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).highlightColor,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          activeColor: Theme.of(context).focusColor,
                          value: state,
                          onChanged: (value) {
                            blocLogic.add(CalculatorLogicsNotifications(value));
                          },
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Уведомления",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
