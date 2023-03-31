import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@injectableInit 
Future<void> configureDependencies() async {  
  String env = Environment.dev;
  if (kReleaseMode) env = Environment.prod;
  $initGetIt(sl, environment: env);
}
