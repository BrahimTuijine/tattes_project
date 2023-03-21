import 'package:injectable/injectable.dart';
import 'package:products_management/core/database/database.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  MyDatabase get myDatabase => MyDatabase();
}
