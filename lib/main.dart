import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcalc/BLoc/bloc/calculator_bloc.dart';
import 'package:qcalc/Screens/HomeScreen.dart';
import 'package:qcalc/Theme/QCalcTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences storage = await SharedPreferences.getInstance();
  final bool initialTheme = storage.getBool("_themes") ?? false;
  final bool value = storage.getBool("_notifications") ?? false;

  runApp(Calculator(initialTheme: initialTheme, value: value));
}

class Calculator extends StatefulWidget {
  final bool initialTheme;
  final bool value;

  const Calculator({
    super.key,
    required this.initialTheme,
    required this.value,
  });

  @override
  State<Calculator> createState() => _CalculatorState(initialTheme, value);
}

class _CalculatorState extends State<Calculator> {
  final bool initialTheme;
  final bool value;

  _CalculatorState(this.initialTheme, this.value);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculatorBloc()),
        BlocProvider(
          create: (context) => CalculatorLogics(widget.initialTheme),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CalculatorLogicsNotificationsBLoc(widget.value),
        ),
      ],
      child: BlocBuilder<CalculatorLogics, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: qCalcThemeLight(),
            darkTheme: qCalcThemeDark(),
            themeMode: state == true ? ThemeMode.light : ThemeMode.dark,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
