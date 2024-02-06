import 'package:dio/dio.dart';
import 'package:flutter_block/data/models/user_list_model.dart';

final dio = Dio();

//app_service.dart

class AppService {
  Future<UserListResponse> fetchUserList(int page, int limit) async {
    final res =
        await dio.get('https://reqres.in/api/users?page=$page&per_page=$limit');
    if (res.statusCode != 200) {
      throw Exception(res.data['errorMessage']);
    }
    return UserListResponse.fromJson(res.data);
  }
}
