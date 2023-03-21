// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'package:products_management/injection.config.dart';

// GetIt getIt = GetIt.instance;

// @InjectableInit()
// void setup() => getIt.init();


import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import './injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(  
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(getIt); 
