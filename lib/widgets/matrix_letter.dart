import 'package:flutter/material.dart';
import 'package:jpn_learn/data/const.dart';
import 'package:jpn_learn/widgets/widjets.dart';

class MatrixLetter extends StatelessWidget {
  const MatrixLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          ConstData.maxMatrix,
          (row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    ConstData.maxMatrix,
                    (column) => Container(
                        padding: const EdgeInsets.all(5),
                        child: LetterContainer(column: column, row: row))),
              )),
    );
  }
}
