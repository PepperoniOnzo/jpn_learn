import 'package:flutter/material.dart';
import 'package:jpn_learn/widgets/keyboard/delete_key.dart';
import 'package:jpn_learn/widgets/keyboard/enter_key.dart';
import 'package:jpn_learn/widgets/keyboard/key_one.dart';

import '../../data/const.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          ConstData.kbdSizeTranscription.length - 1,
          (row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    ConstData.kbdSizeTranscription[row],
                    (column) => KeyOne(
                          keyNumber:
                              ConstData.kbdLineTranscription[row] + column,
                        )),
              ))
        ..add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EnterKey(),
            Row(
              children: List.generate(
                  ConstData.kbdSizeTranscription.last,
                  (column) => KeyOne(
                        keyNumber: ConstData.kbdLineTranscription.last + column,
                      )),
            ),
            const DeleteKey()
          ],
        )),
    );
  }
}
