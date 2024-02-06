//home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/user_list/user_list_bloc.dart';
import 'package:flutter_block/bloc/user_list/user_list_event.dart';
import 'package:flutter_block/bloc/user_list/user_list_state.dart';
import 'package:flutter_block/data/entities/user_list_entity.dart';
import 'package:flutter_block/data/models/user_list_model.dart';
import 'package:flutter_block/ui/page/detail.page.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, UserEntity> _pagingUserController =
      PagingController(firstPageKey: 1);

  void _setListPaging() {
    _pagingUserController.addPageRequestListener((pageKey) {
      _loadUserList(pageKey);
    });
  }

  void _loadUserList(int pageKey) =>
      context.read<UserListBloc>().add(GetUserList(pageKey: pageKey));

  @override
  void initState() {
    _setListPaging();
    super.initState();
  }

  @override
  void dispose() {
    _pagingUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: _appBody(),
      );

  Widget _appBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocListener<UserListBloc, UserListState>(
            listener: (context, state) {
              if (state is UserListLastPageLoaded) {
                _pagingUserController.appendLastPage(state.data.datas);
              } else if (state is UserListLoaded) {
                _pagingUserController.appendPage(
                    state.data.datas, state.nextPageKey);
              } else if (state is UserListError) {
                _pagingUserController.error = state.message;
              }
            },
            child: RefreshIndicator(
              onRefresh: () => Future.sync(
                () => _pagingUserController.refresh(),
              ),
              child: Builder(builder: (context) {
                return PagedListView<int, UserEntity>(
                  pagingController: _pagingUserController,
                  builderDelegate: PagedChildBuilderDelegate<UserEntity>(
                      itemBuilder: (context, item, index) =>
                          _userListItem(context, item),
                      firstPageProgressIndicatorBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      newPageProgressIndicatorBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      noItemsFoundIndicatorBuilder: (_) => const Center(
                            child: Text(
                              'No items found',
                            ),
                          )),
                );
              }),
            )),
      );

  Widget _userListItem(BuildContext context, UserEntity item) {
    return Card(
        child: ListTile(
      onTap: () {
        context.push('/detail', extra: item);
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.avatar),
      ),
      title: Text(item.title),
      subtitle: Text(item.id),
    ));
  }
}
