import 'dart:developer';

import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/models/question_list_model.dart';
import 'package:mini_e_learning/app/data/repository/exercise_repository.dart';
import 'package:mini_e_learning/app/widget/snackbar_widget.dart';

class QuestionController extends GetxController {
  final ExerciseRepository exerciseRepo;

  QuestionController(this.exerciseRepo);

  String exerciseId = Get.arguments['exerciseId'];
  String email = Get.arguments['email'];
  bool isLoading = true;
  int currentQuestionIndex = 0;
  int questionLength = 0;
  List<int> answeredQuestion = [];
  String selectedOption = '';
  List<String> questionBankList = [];
  List<String> answerList = [];
  List<QuestionList> questionList = [];

  @override
  void onInit() async {
    super.onInit();
    getQUestion();
  }

  Future<void> getQUestion() async {
    isLoading = true;
    update();
    try {
      Question? question = await exerciseRepo.getQuestion(exerciseId, email);
      if (question != null) {
        log(question.message!);
        log(question.data.toString());
        if (question.data!.isNotEmpty) {
          questionList = question.data!;
          questionLength = question.data!.length;
          for (var i = 0; i < questionLength; i++) {
            questionBankList.add(question.data![i].bankQuestionId!);
            answerList.add('');
          }
          SuccessSnack.show(message: 'Selamat Mengerjakan!!!');
        } else {
          ErrorSnack.show(message: 'Belum ada soal yang bisa dikerjakan!!!');
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
