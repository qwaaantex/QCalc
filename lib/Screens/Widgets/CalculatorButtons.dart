import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';
import 'package:qcalc/Screens/Widgets/CalculatorField.dart';

class CalculatorButtons extends StatefulWidget {
  const CalculatorButtons({super.key});

  @override
  State<CalculatorButtons> createState() => _CalculatorButtonsState();
}

class _CalculatorButtonsState extends State<CalculatorButtons> {
  final List firstLine = ["log", "(", ")", "%"];
  final List twoLine = ["^", "/", "*", "AC"];
  final List thirdLine = ["7", "8", "9", "-"];
  final List fourthLine = ["4", "5", "6", "+"];
  final List fifthLine = ["1", "2", "3", "!"];
  final List sixthLine = ["sin", "0", ",", "="];

  @override
  Widget build(BuildContext context) {
    CalculatorBloc bloc = BlocProvider.of<CalculatorBloc>(context);
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).canvasColor,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CalculatorField(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: firstLine.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: index == firstLine.length - 1 ?Theme.of(context).disabledColor : Theme.of(context).primaryColorLight
                      
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (index == 0) {
                            bloc.add(CalculatorMathsOne("log("));
                          } else {
                            bloc.add(CalculatorMathsOne(firstLine[index]));
                          }
                        },
                        child: Text(
                          firstLine[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: twoLine.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: index == twoLine.length - 1 ? Theme.of(context).disabledColor : Theme.of(context).cardColor
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (index == 0) {
                              bloc.add(CalculatorDelete());
                            } 
                          else if (index == twoLine.length - 1) {
                            bloc.add(CalculatorClearAll());
                          } else {
                            bloc.add(CalculatorMathsOne(twoLine[index]));
                          }
                        },
                        child: index == twoLine.length - 4 ? Icon(Icons.cancel_outlined, color: Theme.of(context).textTheme.bodyMedium?.color, size: 30,) :
                            index != twoLine.length - 1
                                ? Text(
                                  twoLine[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                                : Icon(
                                  HugeIcons.strokeRoundedDelete03,
                                  color:
                                      Theme.of(
                                        context,
                                      ).textTheme.bodyMedium?.color,
                                  size: 32,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: thirdLine.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: index == thirdLine.length - 1 ? Theme.of(context).disabledColor : Theme.of(context).cardColor
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          bloc.add(CalculatorMathsOne(thirdLine[index]));
                        },
                        child: Text(
                          thirdLine[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: fourthLine.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: index == fourthLine.length - 1 ? Theme.of(context).disabledColor : Theme.of(context).cardColor
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          bloc.add(CalculatorMathsOne(fourthLine[index]));
                        },
                        child: Text(
                          fourthLine[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fifthLine.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: index == fifthLine.length - 1 ? Theme.of(context).disabledColor : Theme.of(context).cardColor
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          bloc.add(CalculatorMathsOne(fifthLine[index]));
                        },
                        child: Text(
                          fifthLine[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,

            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: sixthLine.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color:
                          index == sixthLine.length - 1
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).cardColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (index != sixthLine.length - 1) {
                            if (index == 0) {
                              bloc.add(CalculatorMathsOne("sin("));
                            } else {
                              bloc.add(CalculatorMathsOne(sixthLine[index]));
                            }
                          } else {
                            bloc.add(CalculatorResults());
                          }
                        },
                        child: Text(
                          sixthLine[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
