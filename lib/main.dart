import 'package:bibleapp/network/api_service_impl.dart';
import 'package:bibleapp/storage/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app/bible_app.dart';

void main()async {


  WidgetsFlutterBinding.ensureInitialized();
  await PathProviderService.init();
  ApiServiceImpl.initializeApiService();

  Bloc.observer =  SimpleBlocObserver();
  runApp( BibleApp());
}



class SimpleBlocObserver extends BlocObserver{

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("Bloc ${bloc} is being transition and ${transition.event} is transition ");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {

    debugPrint("Bloc ${bloc} is being closed ");
    super.onClose(bloc);
  }
}