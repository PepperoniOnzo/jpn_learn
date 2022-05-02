import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../data/colors.dart';
import '../../view/matrix_view.dart';

class DeleteKey extends StatelessWidget {
  const DeleteKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 50,
      ),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.additionalContent,
      ),
      child: GestureDetector(
        onTap: (() {
          context.read<MatrixView>().removeLetter();
        }),
        child: Center(
            child: Container(
          padding: EdgeInsets.all(6),
          child: const Icon(Icons.keyboard_double_arrow_left_outlined,
              size: 22, color: Colors.white),
        )),
      ),
    );
  }
}
