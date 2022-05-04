import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/data/const.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

class KeyOne extends StatelessWidget {
  const KeyOne({Key? key, required this.keyNumber}) : super(key: key);

  final int keyNumber;

  @override
  Widget build(BuildContext context) {
  String letter = context.watch<MatrixView>().learnTranscription
                  ? ConstData.hiragana.values.elementAt(keyNumber).toUpperCase()
                  : ConstData.hiragana.keys.elementAt(keyNumber);
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.additionalContent,
      ),
      child: GestureDetector(
        onTap: (() {
          context.read<MatrixView>().addLetter(letter);
        }),
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(6),
          child: Text(
              letter,
              style: const TextStyle(fontSize: 20)),
        )),
      ),
    );
  }
}
