import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/colors.dart';
import '../../data/const.dart';
import '../../view/matrix_view.dart';

class AllFilterRow extends StatefulWidget {
  const AllFilterRow(
      {Key? key,
      required this.row,
      required this.initElevated,
      required this.changeFilterStates})
      : super(key: key);
  final int row;
  final bool initElevated;
  final Function changeFilterStates;

  @override
  State<AllFilterRow> createState() => _AllFilterRowState();
}

class _AllFilterRowState extends State<AllFilterRow> {
  @override
  void initState() {
    _isElevated = widget.initElevated;
    super.initState();
  }

  late bool _isElevated;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (!_isElevated) {
              _isElevated = !_isElevated;
              for (var i = 0; i < ConstData.filterHiragana[widget.row]; i++) {
                context.read<MatrixView>().addFilter(
                    ConstData.hiragana.keys.elementAt(i + 8 * widget.row));
              }
            } else {
              _isElevated = !_isElevated;
              for (var i = 0; i < ConstData.filterHiragana[widget.row]; i++) {
                context.read<MatrixView>().deleteFilter(
                    ConstData.hiragana.keys.elementAt(i + 8 * widget.row));
              }
            }
            widget.changeFilterStates(widget.row, _isElevated);
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 8),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(50),
              boxShadow: _isElevated
                  ? [
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-1, -1),
                          spreadRadius: 1),
                    ]
                  : null),
          child: Text('AL', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
