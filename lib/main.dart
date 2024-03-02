import 'package:flutter/material.dart';
import 'package:market/core/database/cache_helper.dart';
import 'package:market/core/di/dependency_injection.dart';
import 'package:market/core/routes/app_router.dart';
import 'package:market/marketi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper().init();
  runApp(
    MarketiApp(
      appRouter: AppRouter(),
    ),
  );
}


//? dart run build_runner build --delete-conflicting-outputs