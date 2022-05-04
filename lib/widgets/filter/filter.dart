import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/data/const.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:jpn_learn/widgets/filter/filter_letter.dart';
import 'package:jpn_learn/widgets/filter/filter_type.dart';
import 'package:provider/provider.dart';

import 'filter_all_row.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final List<GlobalKey<FilterLetterState>> _allFilterRowKeys =
      List.generate(ConstData.hiragana.length, (index) => GlobalKey());

  _changeFilterStates(int row, bool status) {
    for (var i = 0; i < ConstData.filterHiragana[row]; i++) {
      if (_allFilterRowKeys[i + row * 8].currentState!.getStatus() != status) {
        _allFilterRowKeys[i + row * 8].currentState!.changeState();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const FilterType(),
          Column(
            children:
                List.generate(ConstData.filterHiragana.length, (rowIndex) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AllFilterRow(
                      changeFilterStates: _changeFilterStates,
                      row: rowIndex,
                      initElevated: context.read<MatrixView>().filter.any(
                          (element) => ConstData.hiragana.keys
                              .skip(rowIndex * 8)
                              .take(ConstData.filterHiragana[rowIndex] - 1)
                              .contains(element)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            ConstData.filterHiragana[rowIndex], (letterIndex) {
                          return FilterLetter(
                            key: _allFilterRowKeys[rowIndex * 8 + letterIndex],
                            letter: ConstData.hiragana.keys
                                .elementAt(letterIndex + 8 * rowIndex),
                            initElevated: context
                                .read<MatrixView>()
                                .filter
                                .contains(ConstData.hiragana.keys
                                    .elementAt(letterIndex + 8 * rowIndex)),
                          );
                        }),
                      ),
                    )
                  ]);
            }),
          ),
          TextButton(
              onPressed: () {
                context.read<MatrixView>().refreshMatrix();
              },
              child: Container(
                  padding:
                      const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryContent, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text('Refresh',
                      style: TextStyle(fontSize: 18, color: Colors.white)))),
        ],
      ),
    );
  }
}
