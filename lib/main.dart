import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:parking_app/app_config.dart';
import 'package:parking_app/models/hive_parking_place.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(HiveTypeAdapter());
  runApp(AppConfig());
}
