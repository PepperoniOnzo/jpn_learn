import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/data/const.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text('HIRIGANA', style: TextStyle(fontSize: 18)),
          Column(
            children:
                List.generate(ConstData.filterHiragana.length, (index) {
                  return Row(children: [
                    Text('ALL'),
                  ]);
                }),
          ),
          TextButton(
              onPressed: () {
                context.read<MatrixView>().refreshMatrix();
              },
              child: Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryContent, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text('Acept',
                      style: TextStyle(fontSize: 18, color: Colors.white)))),
        ],
      ),
    );
  }
}
