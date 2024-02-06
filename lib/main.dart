import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/user_list/user_list_bloc.dart';
import 'package:flutter_block/data/data_provider/remote/app_service.dart';
import 'package:flutter_block/data/entities/user_list_entity.dart';
import 'package:flutter_block/data/repositories/app_repository.dart';
import 'package:flutter_block/ui/page/detail.page.dart';
import 'package:flutter_block/ui/page/home_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
        path: '/detail',
        builder: (context, state) {
          final UserEntity item = state.extra! as UserEntity;
          return DetailPage(
            item: item,
          );
        }),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserListBloc>(
          create: (BuildContext context) =>
              UserListBloc(repository: AppRepository(appService: AppService())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const HomePage());
  }
}
