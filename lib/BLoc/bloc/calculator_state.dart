part of 'calculator_bloc.dart';

class CalculatorMathsOne extends CalculatorEvent {
  final dynamic work;

  CalculatorMathsOne(this.work);
}

class CalculatorClearAll extends CalculatorEvent {}

class CalculatorResults extends CalculatorEvent {}

class CalculatorLogicsTheme extends CalculatorEvent {
  final bool value;
  CalculatorLogicsTheme(this.value);
}

class CalculatorLogicsNotifications extends CalculatorEvent {
  final bool value;
  CalculatorLogicsNotifications(this.value);
}

class CalculatorThemes extends CalculatorEvent {}

class BlocInitializedState extends CalculatorEvent {}
