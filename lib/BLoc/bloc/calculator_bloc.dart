import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiny_expr/tiny_expr.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, String> {
  CalculatorBloc() : super("0") {
    on<CalculatorMathsOne>((event, emit) {
      if (state == "0") {
        emit(event.work);
      } else {
        emit(state + event.work);
      }
    });
    on<CalculatorDelete>((event, emit) {
      if (state.length != 1) {
      emit(state.substring(0, state.length - 1).toString());
      } else {
        emit("0");
      }
    });
    on<CalculatorClearAll>((event, emit) {
      emit('0');
    });
    on<CalculatorResults>((event, emit) {
      if (state.contains(RegExp(r'[0-9]'))) {
        try {
          final result = TinyExpr(state).evaluate();
          emit(
            (result % 1) != 0
                ? result.toStringAsFixed(4).toString()
                : result.round().toString(),
          );
        } catch (e) {
          emit("Ошибка");
        }
      } else {
        emit("Ошибка");
      }
    });
  }
}

class CalculatorLogics extends Bloc<CalculatorEvent, bool> {
  CalculatorLogics(bool initialTheme) : super(initialTheme) {
    on<CalculatorLogicsTheme>((event, emit) async {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      emit(event.value);
      storage.setBool("_themes", event.value);
    });
  }
}

class CalculatorLogicsNotificationsBLoc extends Bloc<CalculatorEvent, bool> {
  CalculatorLogicsNotificationsBLoc(bool value) : super(value) {
    on<CalculatorLogicsNotifications>((event, emit) async {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      emit(event.value);
      storage.setBool("_notifications", state);
    });
  }
}
