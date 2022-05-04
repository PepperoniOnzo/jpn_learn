import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

class FilterType extends StatefulWidget {
  const FilterType({Key? key}) : super(key: key);

  @override
  State<FilterType> createState() => _FilterTypeState();
}

class _FilterTypeState extends State<FilterType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (() {
            setState(() {
              if (context.read<MatrixView>().learnTranscription != true) {
                context.read<MatrixView>().learnTranscription = true;
                context.read<MatrixView>().refreshMatrix();
              }
            });
          }),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.3,
            ),
            child: Column(
              children: [
                Text('HIRIGANA', style: TextStyle(fontSize: 18)),
                AnimatedOpacity(
                  opacity:
                      context.read<MatrixView>().learnTranscription ? 1.0 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            setState(() {
              if (context.read<MatrixView>().learnTranscription != false) {
                context.read<MatrixView>().learnTranscription = false;
                context.read<MatrixView>().refreshMatrix();
              }
            });
          }),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.4,
            ),
            child: Column(
              children: [
                Text('TRANSCRIPTION', style: TextStyle(fontSize: 18)),
                AnimatedOpacity(
                  opacity:
                      !context.read<MatrixView>().learnTranscription ? 1.0 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
