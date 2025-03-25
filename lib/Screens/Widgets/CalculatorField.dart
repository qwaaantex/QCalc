import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';

class CalculatorField extends StatefulWidget {
  const CalculatorField({super.key});

  @override
  State<CalculatorField> createState() => _CalculatorFieldState();
}

class _CalculatorFieldState extends State<CalculatorField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BlocBuilder<CalculatorBloc, dynamic>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        state.toString(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
