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

  runApp(Calculator(initialTheme: initialTheme));
}

class Calculator extends StatefulWidget {
  final bool initialTheme;
  const Calculator({super.key, required this.initialTheme});

  @override
  State<Calculator> createState() => _CalculatorState(initialTheme);
}

class _CalculatorState extends State<Calculator> {
  final bool initialTheme;
  _CalculatorState(this.initialTheme);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculatorBloc()),
        BlocProvider(
          create: (context) => CalculatorLogics(widget.initialTheme),
          lazy: false,
        ),
        BlocProvider(create: (context) => CalculatorLogicsNotificationsBLoc()),
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
