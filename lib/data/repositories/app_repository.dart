//app_repository.dart
import 'package:flutter_block/data/data_provider/remote/app_service.dart';
import 'package:flutter_block/data/entities/user_list_entity.dart';
import 'package:flutter_block/data/models/user_list_model.dart';

class AppRepository {
  final AppService appService;

  AppRepository({
    required this.appService,
  });

  Future<UserListEntity> getContentUserList(int page, int limit) async {
    UserListResponse response = await appService.fetchUserList(page, limit);
    return UserListEntity(
      datas: response.data!
          .map((data) => UserEntity(
                id: data.id.toString(),
                title: data.firstName,
                titleLast: data.lastName,
                avatar: data.avatar,
              ))
          .toList(),
    );
  }
}
