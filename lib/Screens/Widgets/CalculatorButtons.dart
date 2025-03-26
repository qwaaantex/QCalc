import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';

class CalculatorButtons extends StatefulWidget {
  const CalculatorButtons({super.key});

  @override
  State<CalculatorButtons> createState() => _CalculatorButtonsState();
}

class _CalculatorButtonsState extends State<CalculatorButtons> {
  final List firstLine = ["-", "(", ")", "%"];
  final List twoLine = ["^", "/", "*", "AC"];
  final List thirdLine = ["7", "8", "9", "-"];
  final List fourthLine = ["4", "5", "6", "+"];
  final List fifthLine = ["1", "2", "3"];
  final List sixthLine = ["%", "0", ","];

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
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: firstLine.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).cardColor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              bloc.add(CalculatorMathsOne(firstLine[index]));
                            },
                            child: Text(
                              firstLine[index],
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: twoLine.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).cardColor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              if (index == twoLine.length - 1) {
                                bloc.add(CalculatorClearAll());
                              } else {
                                bloc.add(CalculatorMathsOne(twoLine[index]));
                              }
                            },
                            child: Text(
                              twoLine[index],
                              style:
                                  index != 3
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 28,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: thirdLine.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).cardColor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              bloc.add(CalculatorMathsOne(thirdLine[index]));
                            },
                            child: Text(
                              thirdLine[index],
                              style:
                                  index != 3
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 28,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fourthLine.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context).cardColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          bloc.add(CalculatorMathsOne(fourthLine[index]));
                        },
                        child: Text(
                          fourthLine[index],
                          style:
                              index != 3
                                  ? Theme.of(context).textTheme.bodyMedium
                                  : TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 28,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.1,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: fifthLine.length,

                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Theme.of(context).cardColor,
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.1,
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            bloc.add(
                                              CalculatorMathsOne(
                                                fifthLine[index],
                                              ),
                                            );
                                          },
                                          child: Text(
                                            fifthLine[index],
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.1,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sixthLine.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Theme.of(context).cardColor,
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.1,
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            bloc.add(
                                              CalculatorMathsOne(
                                                sixthLine[index],
                                              ),
                                            );
                                          },
                                          child: Text(
                                            sixthLine[index],
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: TextButton(
                          onPressed: () {
                            bloc.add(CalculatorResults());
                          },
                          child: Text(
                            "=",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
