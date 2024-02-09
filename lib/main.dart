import 'package:app_movie/config/service/nav_service.dart';
import 'package:app_movie/config/theme/app_theme.dart';
import 'package:app_movie/infrastructure/service/services.dart';
import 'package:app_movie/presentation/views/provider/local_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocalStorageProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: LocalNotificationsService.messagerKey,
          theme: Apptheme().getTheme(),
          navigatorKey: NavService.navigatorKey,
          title: 'App Movie',
          home: const HomePage()),
    );
  }
}
