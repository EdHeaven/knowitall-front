import 'package:flutter/material.dart';
import 'package:knowitall/data/tests.dart';
import 'package:knowitall/model/local/test.dart';
import 'package:knowitall/model/local/option.dart';
import 'package:knowitall/model/local/question.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({Key? key, required this.test}) : super(key: key);

  final Test test;
  // final PageController controller;
  // final ValueChanged<int> onChangedPage;
  // final ValueChanged<Option> onClickedOption;

  @override
  Widget build(BuildContext context) => PageView.builder(
        itemCount: test.questions.length,
        itemBuilder: (BuildContext context, int index) {
          final question = test.questions[index];

          return buildQuestion(question: question);
        },
      );

  Widget buildQuestion({
    required Question question,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              question.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            // SizedBox(height: 8),
            // Text(
            //   'Choose your answer from below',
            //   style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            // ),
            // SizedBox(height: 32),
            // Expanded(
            //   child: OptionsWidget(
            //     question: question,
            //     onClickedOption: onClickedOption,
            //   ),
            // ),
          ],
        ),
      );
}
