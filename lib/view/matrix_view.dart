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
  int _getRandFilter() => Random().nextInt(filter.length);

  void refreshMatrix() {
    _currentRow = 0;
    _currentCol = 0;
    if (filter.length == 0) {
      matrix = List.generate(ConstData.maxMatrix, (i) {
        return List.generate(ConstData.maxMatrix, (j) {
          int position = _getRand();
          return learnTranscription
              ? Letter(ConstData.hiragana.entries.elementAt(position).key,
                  ConstData.hiragana.entries.elementAt(position).value, '')
              : Letter(ConstData.hiragana.entries.elementAt(position).value,
                  ConstData.hiragana.entries.elementAt(position).key, '');
        });
      });
    } else {
      matrix = List.generate(ConstData.maxMatrix, (i) {
        return List.generate(ConstData.maxMatrix, (j) {
          int position = _getRandFilter();
          return learnTranscription
              ? Letter(
                  filter[position],
                  ConstData.hiragana.entries
                      .firstWhere((element) => element.key == filter[position])
                      .value,
                  '')
              : Letter(
                  ConstData.hiragana.entries
                      .firstWhere((element) => element.key == filter[position])
                      .value,
                  filter[position],
                  '');
        });
      });
    }
    notifyListeners();
  }

  void addFilter(String letter) {
    if (!filter.contains(letter)) {
      filter.add(letter);
      notifyListeners();
    }
  }

  void deleteFilter(String letter) {
    if (filter.contains(letter)) {
      filter.remove(letter);
      notifyListeners();
    }
  }

  void addLetter(String entered) {
    if (_currentCol < ConstData.maxMatrix) {
      if (_currentCol < ConstData.maxMatrix - 1) {
        matrix[_currentRow][_currentCol].entered = entered;
        _currentCol++;
      } else {
        matrix[_currentRow][_currentCol].entered = entered;
      }
      notifyListeners();
    }
  }

  void removeLetter() {
    if (matrix[_currentRow][_currentCol].entered != '') {
      matrix[_currentRow][_currentCol].entered = '';
      notifyListeners();
    } else {
      if (_currentCol != 0) {
        matrix[_currentRow][_currentCol - 1].entered = '';
        _currentCol--;
        notifyListeners();
      }
    }
  }

  void checkAnswers() {
    if (_currentCol == ConstData.maxMatrix - 1) {
      for (var i = 0; i < ConstData.maxMatrix; i++) {
        if (matrix[_currentRow][i].entered ==
            matrix[_currentRow][i].answer.toUpperCase()) {
          matrix[_currentRow][i].isCorrect = true;
        }
        matrix[_currentRow][i].isChecked = true;
      }
      _currentRow++;
      _currentCol = 0;
      notifyListeners();
      return;
    }

    if (_currentRow == ConstData.maxMatrix) {
      _currentCol = 0;
      _currentRow = 0;
      refreshMatrix();
      notifyListeners();
    }
  }
}
