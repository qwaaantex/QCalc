import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        style: Theme.of(context).textTheme.labelLarge,
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
                Navigator.pop(context);
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: "Уведомления выключены",
                    textStyle:
                        Theme.of(context).textTheme.labelMedium ??
                        TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
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
                        style: Theme.of(context).textTheme.labelLarge,
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
