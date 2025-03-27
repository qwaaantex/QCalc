import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorLogics bloc = BlocProvider.of<CalculatorLogics>(context);
    CalculatorLogicsNotificationsBLoc blocLogic =
        BlocProvider.of<CalculatorLogicsNotificationsBLoc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                  color: Theme.of(context).cardColor,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          activeColor: Colors.yellow[700],
                          activeTrackColor: Theme.of(context).dividerColor,
                          trackOutlineColor:
                              WidgetStateProperty.resolveWith<Color?>((
                                Set<WidgetState> states,
                              ) {
                                return Theme.of(context).shadowColor;
                              }),
                          value: state,
                          onChanged: (value) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                message: "Тема приложения сменена",
                                textStyle: TextStyle(
                                  color: Theme.of(context).indicatorColor,
                                  fontSize: 18,
                                ),
                              ),
                            );
                            Navigator.pop(context);
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
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return SlideTransition(
                              position: animation.drive(
                                Tween(
                                  begin: Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ),
                              ),
                              child: child,
                            );
                          },
                          child: Icon(
                            key: ValueKey<bool>(state),
                            state != true
                                ? HugeIcons.strokeRoundedMoon
                                : Icons.wb_sunny_outlined,
                            size: 24,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        BlocConsumer<CalculatorLogicsNotificationsBLoc, bool>(
          listener: (context, state) async {
            switch (state) {
              case true:
                final status = await Permission.notification.request();
                if (status.isGranted) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: "Уведомления включены",
                      textStyle:
                          Theme.of(context).textTheme.labelMedium ??
                          TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  );
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Упс.. Ошибка!",
                      textStyle:
                          Theme.of(context).textTheme.labelMedium ??
                          TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  );
                }
                break;

              case false:
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: "Уведомления выключены",
                    textStyle:
                        Theme.of(context).textTheme.labelMedium ??
                        TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
                break;
            }
          },

          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).cardColor,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          activeTrackColor: Theme.of(context).dividerColor,
                          trackOutlineColor:
                              WidgetStateProperty.resolveWith<Color?>((
                                Set<WidgetState> states,
                              ) {
                                return Theme.of(context).shadowColor;
                              }),
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
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return SlideTransition(
                              position: animation.drive(
                                Tween(
                                  begin: Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ),
                              ),
                              child: child,
                            );
                          },
                          child: Icon(
                            state == true
                                ? HugeIcons.strokeRoundedNotificationBlock01
                                : HugeIcons.strokeRoundedNotification01,
                            color: Theme.of(context).indicatorColor,
                            size: 24,
                            key: ValueKey<bool>(state),
                          ),
                        ),
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
