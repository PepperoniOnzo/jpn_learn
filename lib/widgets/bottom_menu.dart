import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Divider(
            color: AppColors.additionalText,
            thickness: 2,
          ),
          Divider(
            color: AppColors.additionalText,
            thickness: 2,
            endIndent: 10,
            indent: 10,
          )
        ],
      ),
    );
  }
}
