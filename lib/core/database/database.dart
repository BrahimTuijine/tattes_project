// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get ville => text()();
  TextColumn get rue => text()();
  TextColumn get phone => text().unique()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prix => text()();
  TextColumn get libelle => text()();
  TextColumn get categorie => text()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get tva => text()();
  TextColumn get refrence => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Fournissers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get ville => text()();
  TextColumn get rue => text()();
  TextColumn get phone => text().unique()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Clients, Products, Fournissers])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  //! CRUD client
  Future<int> insertClient(ClientsCompanion clientsCompanion) async {
    return await into(clients).insert(clientsCompanion);
  }

  Future<List<Client>> getClients() async {
    return await select(clients).get();
  }

  Future<int> updateClient(ClientsCompanion clientsCompanion) async {
    return (update(clients)
          ..where(
            (t) => t.id.equals(clientsCompanion.id.value),
          ))
        .write(clientsCompanion);
  }

  Future<int> deleteClient(int id) async {
    return await (delete(clients)..where((tbl) => tbl.id.equals(id))).go();
  }

  //! CRUD product
  Future<int> insertProduct(ProductsCompanion productsCompanion) async {
    return await into(products).insert(productsCompanion);
  }

  Future<List<Product>> getProducts() async {
    return await select(products).get();
  }

  Future<int> updateProduct(ProductsCompanion productsCompanion) async {
    return (update(products)
          ..where(
            (t) => t.id.equals(productsCompanion.id.value),
          ))
        .write(productsCompanion);
  }

  Future<int> deleteProduct(int id) async {
    return await (delete(products)..where((tbl) => tbl.id.equals(id))).go();
  }

  //! CRUD fournisseur
  Future<int> insertSupplier(FournissersCompanion fournissersCompanion) async {
    return await into(fournissers).insert(fournissersCompanion);
  }

  Future<List<Fournisser>> getSuppliers() async {
    return await select(fournissers).get();
  }

  Future<int> updateSuppliers(FournissersCompanion fournissersCompanion) async {
    return (update(fournissers)
          ..where(
            (t) => t.id.equals(fournissersCompanion.id.value),
          ))
        .write(fournissersCompanion);
  }

  Future<int> deleteSuppliers(int id) async {
    return await (delete(fournissers)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
