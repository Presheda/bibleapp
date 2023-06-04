import 'package:bibleapp/network/api_service_impl.dart';
import 'package:flutter/material.dart';

import 'app/bible_app.dart';

void main() {


  WidgetsFlutterBinding.ensureInitialized();

  ApiServiceImpl.initializeApiService();

  runApp( BibleApp());
}