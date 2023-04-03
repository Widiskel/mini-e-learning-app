import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:mini_e_learning/app/modules/question/controllers/question_controller.dart';

class AnswerWidget extends StatelessWidget {
  final String option;
  final dynamic question;
  final dynamic questionImg;
  final QuestionController controller;

  const AnswerWidget({
    Key? key,
    required this.option,
    this.question,
    this.questionImg,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedOption = option;
        controller.answerList[controller.currentQuestionIndex] = (option);
        controller.answeredQuestion.add(controller.currentQuestionIndex);
        controller.update();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color:
              option == controller.answerList[controller.currentQuestionIndex]
                  ? ColorPallete.bgColor
                  : Colors.white,
          border: Border.all(
            width: 1.0,
            color: ColorPallete.answerBorder,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$option.'),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                children: [
                  HtmlWidget(
                    question,
                  ),
                  questionImg != null
                      ? Image.network(
                          questionImg,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        )
                      : const Center()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
