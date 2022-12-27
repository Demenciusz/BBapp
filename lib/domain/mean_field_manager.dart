import 'dart:math';

import 'package:zaliczenie/cubit/dice/dice_cubit.dart';

import 'package:zaliczenie/cubit/dice/dice_cubit.dart';

class MeanFieldManager {
  List<int> k4List = [];
  List<int> k6List = [];
  List<int> k8List = [];
  List<int> k10List = [];
  List<int> k12List = [];
  List<int> k20List = [];
  List<int> k100List = [];

  double rollMean(CurrentDice currentDice) {
    switch (currentDice) {
      case CurrentDice.k4:
        int x = k4List.length;
        double sum = 0;
        k4List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k6:
        int x = k6List.length;
        double sum = 0;
        k6List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k8:
        int x = k8List.length;
        double sum = 0;
        k8List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k10:
        int x = k10List.length;
        double sum = 0;
        k10List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k12:
        int x = k12List.length;
        double sum = 0;
        k12List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k20:
        int x = k20List.length;
        double sum = 0;
        k20List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
      case CurrentDice.k100:
        int x = k20List.length;
        double sum = 0;
        k4List.forEach((element) {
          sum += element;
        });
        if (x <= 0) {
          return 0;
        } else {
          return (sum / x);
        }
        break;
    }
  }

  String rollList(
    CurrentDice currentDice,
  ) {
    String rolls = '';
    switch (currentDice) {
      case CurrentDice.k4:
        k4List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k6:
        k6List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k8:
        k8List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k10:
        k10List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k12:
        k12List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k20:
        k20List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
      case CurrentDice.k100:
        k100List.forEach((element) {
          rolls += ' $element :';
        });
        return rolls;
        break;
    }
  }

  int diceValue(
    CurrentDice currentDice,
  ) {
    Random random = Random();
    int dValue;
    switch (currentDice) {
      case CurrentDice.k4:
        dValue = random.nextInt(4) + 1;
        k4List.add(dValue);
        break;
      case CurrentDice.k6:
        dValue = random.nextInt(6) + 1;
        k6List.add(dValue);
        break;
      case CurrentDice.k8:
        dValue = random.nextInt(8) + 1;
        k8List.add(dValue);
        break;
      case CurrentDice.k10:
        dValue = random.nextInt(10) + 1;
        k10List.add(dValue);
        break;
      case CurrentDice.k12:
        dValue = random.nextInt(12) + 1;
        k12List.add(dValue);
        break;
      case CurrentDice.k20:
        dValue = random.nextInt(20) + 1;
        k20List.add(dValue);
        break;
      case CurrentDice.k100:
        dValue = random.nextInt(100) + 1;
        k100List.add(dValue);
        break;
    }
    return dValue;
  }
}
