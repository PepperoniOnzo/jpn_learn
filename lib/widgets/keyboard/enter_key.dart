import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../data/colors.dart';
import '../../view/matrix_view.dart';

class EnterKey extends StatelessWidget {
  const EnterKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.additionalContent,
      ),
      child: GestureDetector(
        onTap: (() {
          context.read<MatrixView>().checkAnswers();
        }),
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(6),
          child: const Text('ENTER', style: TextStyle(fontSize: 20)),
        )),
      ),
    );
  }
}
