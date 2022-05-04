import 'package:flutter/material.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

class FilterLetter extends StatefulWidget {
  const FilterLetter(
      {Key? key, required this.letter, required this.initElevated})
      : super(key: key);
  final String letter;
  final bool initElevated;

  @override
  State<FilterLetter> createState() => FilterLetterState();
}

class FilterLetterState extends State<FilterLetter> {
  @override
  void initState() {
    _isElevated = widget.initElevated;
    super.initState();
  }

  changeState() => setState(() {
        _isElevated = !_isElevated;
      });

  getStatus() => _isElevated;

  late bool _isElevated;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (!_isElevated) {
              _isElevated = !_isElevated;
              context.read<MatrixView>().addFilter(widget.letter);
            } else {
              _isElevated = !_isElevated;
              context.read<MatrixView>().deleteFilter(widget.letter);
            }
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.all(5),
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
          child: Text(widget.letter, style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
