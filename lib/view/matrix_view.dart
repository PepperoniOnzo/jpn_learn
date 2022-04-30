import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jpn_learn/data/const.dart';
import 'package:jpn_learn/model/letter.dart';

class MatrixView with ChangeNotifier {
  // ignore: prefer_final_fields
  int _currentRow = 0, _currentCol = 0, _maxHiragan = ConstData.hiragana.length;

  bool learnTranscription = true;

  List<String> filter = [];
  List<List<Letter>> matrix = [[]];

  MatrixView() {
    refreshMatrix();
  }

  int _getRand() => Random().nextInt(_maxHiragan);

  void refreshMatrix() {
    if (filter.length == 0) {
      matrix = List.generate(ConstData.maxMatrix, (i) {
        return List.generate(ConstData.maxMatrix, (j) {
          int position = _getRand();
          return Letter(ConstData.hiragana.entries.elementAt(position).key,
              ConstData.hiragana.entries.elementAt(position).value, '');
        });
      });
    }
    notifyListeners();
  }

  void addLetter(String entered) {
    if (_currentCol < ConstData.maxMatrix) {
      matrix[_currentRow][_currentCol].entered = entered;
      _currentCol++;
      notifyListeners();
    }
  }

  void removeLetter() {
    if (_currentCol > 0) {
      matrix[_currentRow][_currentCol].entered = '';
      _currentCol--;
      notifyListeners();
    }
  }

  void checkAnswers() {
    for (var i = 0; i < ConstData.maxMatrix; i++) {
      if (matrix[_currentRow][i].entered == matrix[_currentRow][i].answer) {
        matrix[_currentRow][i].isCorrect = true;
        matrix[_currentRow][i].isChecked = true;
      }
    }
    notifyListeners();
  }
}
