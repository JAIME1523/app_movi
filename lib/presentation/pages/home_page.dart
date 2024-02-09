import 'package:app_movie/presentation/views/provider/local_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/widgets/widgets.dart';
import '../views/provider/provider.dart';
import 'provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider()..createUser(),
        )
      ],
      child: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
   context.watch<LocalStorageProvider>();

    return Scaffold(
      body: SafeArea(
        child: provider.viewSwitch(),
      ),
      bottomNavigationBar: const _BottomNav(),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<HomeProvider>();
    return CustomMenu(
        activeColor: colors.primary,
        inactiveColor: colors.secondary,
        items: <CustomButtom>[
          CustomButtom(
              onPressed: () {
                provider.viewStatus = ViewsStatus.profile;
              },
              icon: Icons.person_2_outlined),
          CustomButtom(
              onPressed: () {
                provider.viewStatus = ViewsStatus.movie;
              },
              icon: Icons.movie_filter_outlined),
          CustomButtom(
              onPressed: () {
                provider.viewStatus = ViewsStatus.maps;
              },
              icon: Icons.map_outlined),
        ]);
  }
}
