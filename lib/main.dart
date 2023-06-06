import 'package:bibleapp/network/api_service_impl.dart';
import 'package:bibleapp/storage/path_provider.dart';
import 'package:flutter/material.dart';

import 'app/bible_app.dart';

void main()async {


  WidgetsFlutterBinding.ensureInitialized();
  await PathProviderService.init();
  ApiServiceImpl.initializeApiService();


  runApp( BibleApp());
}