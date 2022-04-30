import 'package:flutter/material.dart';
import 'package:jpn_learn/widgets/key_one.dart';

import '../data/const.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          ConstData.kbdSizeTranscription.length,
          (row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    ConstData.kbdSizeTranscription[row],
                    (column) => KeyOne(
                      keyNumber: ConstData.kbdLineTranscription[row] + column,
                    )),
              )),
    );
  }
}
