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

  @override
  void onInit() async {
    super.onInit();
    getQUestion();
  }

  List<QuestionList> questionList = [];

  Future<void> getQUestion() async {
    isLoading = true;
    try {
      Question? question = await exerciseRepo.getQuestion(exerciseId, email);
      if (question != null) {
        questionList = question.data!;
        questionLength = question.data!.length;
        SuccessSnack.show(message: 'Selamat Mengerjakan!!!');
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
