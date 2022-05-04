import 'package:flutter/material.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:jpn_learn/widgets/keyboard/delete_key.dart';
import 'package:jpn_learn/widgets/keyboard/enter_key.dart';
import 'package:jpn_learn/widgets/keyboard/key_one.dart';
import 'package:provider/provider.dart';

import '../../data/const.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          context.watch<MatrixView>().learnTranscription
              ? ConstData.kbdSizeTranscription.length - 1
              : ConstData.kbdSizeHiragana.length - 1,
          (row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    context.watch<MatrixView>().learnTranscription
                        ? ConstData.kbdSizeTranscription[row]
                        : ConstData.kbdSizeHiragana[row],
                    (column) => KeyOne(
                          keyNumber:
                              context.watch<MatrixView>().learnTranscription
                                  ? ConstData.kbdLineTranscription[row] + column
                                  : ConstData.kbdLineHiragana[row] + column,
                        )),
              ))
        ..add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EnterKey(),
            Row(
              children: List.generate(
                  context.watch<MatrixView>().learnTranscription
                      ? ConstData.kbdSizeTranscription.last
                      : ConstData.kbdSizeHiragana.last,
                  (column) => KeyOne(
                        keyNumber:
                            context.watch<MatrixView>().learnTranscription
                                ? ConstData.kbdLineTranscription.last + column
                                : ConstData.kbdSizeHiragana.last + column,
                      )),
            ),
            const DeleteKey()
          ],
        )),
    );
  }
}
