import 'package:mini_e_learning/app/data/models/user_model.dart';
import 'package:mini_e_learning/app/data/models/user_regis_model.dart';
import 'package:mini_e_learning/app/data/utils/app_constant.dart';
import '../services/dio_client.dart';

abstract class UserRepository {
  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel?> registerUser(UserRegistration model);
}

class UserRepositoryImpl implements UserRepository {
  final DioClient _dioClient;

  UserRepositoryImpl(this._dioClient);

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final result = await _dioClient.get(
        AppConstant.getUserByEmail,
        queryParameters: {"email": email},
      );

      UserModel res = UserModel.fromJson(result);

      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('getUserByEmail failed: $e');
    }
  }

  @override
  Future<UserModel?> registerUser(UserRegistration model) async {
    try {
      final result = await _dioClient.post(
        AppConstant.registerUser,
        body: model.toMap(),
      );

      UserModel res = UserModel.fromJson(result);

      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('registerUser failed: $e');
    }
  }
}