// user_list_entity.dart
class UserListEntity {
  final List<UserEntity> datas;

  UserListEntity({
    List<UserEntity>? datas,
  }) : datas = datas ?? [];
}

class UserEntity {
  final String id;
  final String title;
  final String titleLast;
  final String avatar;

  UserEntity({
    String? id,
    String? title,
    String? titleLast,
    String? avatar,
  })  : id = id ?? '',
        title = title ?? '',
        titleLast = titleLast ?? '',
        avatar = avatar ?? '';
}
