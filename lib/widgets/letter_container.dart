import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

class LetterContainer extends StatelessWidget {
  const LetterContainer({Key? key, required this.column, required this.row})
      : super(key: key);

  final int column, row;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(5),
            child: Text(
              context.watch<MatrixView>().matrix[row][column].show,
              style: TextStyle(fontSize: 23),
            )),
        Container(
          // margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.05,
              maxWidth: MediaQuery.of(context).size.height * 0.05),
          decoration: BoxDecoration(
            color: context.watch<MatrixView>().matrix[row][column].isChecked
                ? context.watch<MatrixView>().matrix[row][column].isCorrect
                    ? AppColors.correctAnswer
                    : Colors.redAccent
                : Colors.transparent,
            border: Border.all(
                color: context.watch<MatrixView>().matrix[row][column].isChecked
                    ? context.watch<MatrixView>().matrix[row][column].isCorrect
                        ? AppColors.correctAnswer
                        : Colors.redAccent
                    : AppColors.primaryContent,
                width: 2),
          ),
          child: Center(
              child: Text(
                  context.watch<MatrixView>().matrix[row][column].isChecked
                      ? context.watch<MatrixView>().matrix[row][column].answer.toUpperCase()
                      : context.watch<MatrixView>().matrix[row][column].entered,
                  style: TextStyle(fontSize: 18))),
        )
      ],
    );
  }
}
