import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/widgets/filter/filter.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _bottomSheetFilter(context);
      },
      child: Container(
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
      ),
    );
  }

  void _bottomSheetFilter(BuildContext context) {
    showModalBottomSheet(
      
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.43,
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Filter(),
          );
        });
  }
}
