// ignore_for_file: public_member_api_docs, sort_constructors_first
// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:products_management/core/models/bon_livraison.dart';

part 'database.g.dart';

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get ville => text()();
  TextColumn get rue => text()();
  TextColumn get phone => text()();
  TextColumn get cin => text()();
  TextColumn get numTva => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get productPrice => real()();
  TextColumn get libelle => text()();
  TextColumn get categorie => text()();
  TextColumn get description => text().nullable()();
  RealColumn get tva => real()();
  IntColumn get nbrePiece => integer()();
  IntColumn get nbreProduit => integer().withDefault(const Constant(0))();
  TextColumn get fournisser => text()();
  RealColumn get prixOrTax => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  // prix or tax => prixx ttc - tva (0, 7 , 19)
}

class Fournissers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get ville => text()();
  TextColumn get rue => text()();
  TextColumn get phone => text()();
  TextColumn get tva => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class BonLivraisons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get factureId => text()();
  IntColumn get clientId => integer().references(Clients, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class BonLivraisonsProd extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get bonLivraisonId =>
      integer().references(BonLivraisons, #id, onDelete: KeyAction.cascade)();

  IntColumn get nbrCol => integer()();
  RealColumn get newProductPrice => real()();
}

// class Facture extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get factureUniqeId => text()();
//   IntColumn get clientId => integer().references(Clients, #id)();
//   DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
// }

// class FactureProd extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get productId => integer().references(Products, #id)();
//   IntColumn get factureId =>
//       integer().references(Facture, #id, onDelete: KeyAction.cascade)();
//   IntColumn get nbrCol => integer()();
//   RealColumn get newProductPrice => real()();
// }

@DriftDatabase(
  tables: [
    Clients,
    Products,
    Fournissers,
    BonLivraisons,
    BonLivraisonsProd,
    // Facture,
    // FactureProd
  ],
)
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
    // return await select(clients).get();

    return (select(clients)..where((tbl) => tbl.isDeleted.isValue(false)))
        .get();
  }

  Future<int> updateClient(ClientsCompanion clientsCompanion) async {
    return (update(clients)
          ..where(
            (t) => t.id.equals(clientsCompanion.id.value),
          ))
        .write(clientsCompanion);
  }

  Future<int> deleteClient(int id) async {
    // return await (delete(clients)..where((tbl) => tbl.id.equals(id))).go();
    return (update(clients)..where((tbl) => tbl.id.equals(id))).write(
      const ClientsCompanion(isDeleted: Value(true)),
    );
  }

  //! CRUD product
  Future<int> insertProduct(ProductsCompanion productsCompanion) async {
    return await into(products).insert(productsCompanion);
  }

  Future<List<Product>> getProducts() async {
    // return await select(products).get();
    return (select(products)..where((tbl) => tbl.isDeleted.isValue(false)))
        .get();
  }

  Future<int> updateProduct(ProductsCompanion productsCompanion) async {
    return (update(products)
          ..where(
            (t) => t.id.equals(productsCompanion.id.value),
          ))
        .write(productsCompanion);
  }

  Future<int> deleteProduct(int id) async {
    // return await (delete(products)..where((tbl) => tbl.id.equals(id))).go();
    return (update(products)..where((tbl) => tbl.id.equals(id))).write(
      const ProductsCompanion(isDeleted: Value(true)),
    );
  }

  Future<int> updateNbreProduit(int productId, int newNbreProduit) async {
    return (update(products)..where((tbl) => tbl.id.equals(productId))).write(
      ProductsCompanion(nbreProduit: Value(newNbreProduit)),
    );
  }

  //! CRUD fournisseur
  Future<int> insertSupplier(FournissersCompanion fournissersCompanion) async {
    return await into(fournissers).insert(fournissersCompanion);
  }

  Future<List<Fournisser>> getSuppliers() async {
    // return await select(fournissers).get();
    return (select(fournissers)..where((tbl) => tbl.isDeleted.isValue(false)))
        .get();
  }

  Future<int> updateSuppliers(FournissersCompanion fournissersCompanion) async {
    return (update(fournissers)
          ..where(
            (t) => t.id.equals(fournissersCompanion.id.value),
          ))
        .write(fournissersCompanion);
  }

  Future<int> deleteSuppliers(int id) async {
    // return await (delete(fournissers)..where((tbl) => tbl.id.equals(id))).go();
    return (update(fournissers)..where((tbl) => tbl.id.equals(id))).write(
      const FournissersCompanion(isDeleted: Value(true)),
    );
  }

  //! CRUD bonLisvraison
  Future<int> insertBonLisvraison(
      BonLivraisonsCompanion bonLivraisonsCompanion) async {
    return await into(bonLivraisons).insert(bonLivraisonsCompanion);
  }

  Future<List<BonLivraison>> getBonLisvraison() async {
    return await select(bonLivraisons).get();
  }

  Future<int> updateBonLisvraison(
      BonLivraisonsCompanion bonLivraisonsCompanion) async {
    return (update(bonLivraisons)
          ..where(
            (t) => t.id.equals(bonLivraisonsCompanion.id.value),
          ))
        .write(bonLivraisonsCompanion);
  }

  Future<int> deleteBonLisvraison(int id) async {
    return await (delete(bonLivraisons)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //! bonLisvraisonProd

  Future<int> insertBonLisvraisonProduct(
      BonLivraisonsProdCompanion bonLivraisonsProdCompanion) async {
    return await into(bonLivraisonsProd).insert(bonLivraisonsProdCompanion);
  }

  Future<List<FactureWithClient>> getBonLivrasonData() async {
    final query = select(bonLivraisons).join([
      innerJoin(
        clients,
        clients.id.equalsExp(bonLivraisons.clientId),
      ),
    ]);

    return await query.map((row) {
      final bonLivraison = row.readTable(bonLivraisons);
      final client = row.readTable(clients);
      return FactureWithClient(
          factureId: bonLivraison.id,
          client: client,
          createdAt: bonLivraison.createdAt);
    }).get();
  }

  Future<List<PdfData>> getBonLivrisonFactureData(int bonId) async {
    final query = select(bonLivraisonsProd).join([
      innerJoin(
        bonLivraisons,
        bonLivraisonsProd.bonLivraisonId.equalsExp(bonLivraisons.id),
      ),
      innerJoin(
        products,
        bonLivraisonsProd.productId.equalsExp(products.id),
      ),
    ])
      ..where(bonLivraisons.id.equals(bonId));

    final List<Product> productList = [];
    final List<BonLivraisonsProdData> bonLivraisonsProductList = [];
    final List<PdfData> bonLivraisonPdfData = [];

    await query.map((row) {
      final bonLivraisonsProduct = row.readTable(bonLivraisonsProd);
      final product = row.readTable(products);
      bonLivraisonsProductList.add(bonLivraisonsProduct);
      productList.add(product);
    }).get();
    for (var product in productList) {
      final result = bonLivraisonsProductList
          .where((element) => product.id == element.productId)
          .toList();
      bonLivraisonPdfData.add(PdfData(
          product: product,
          nbrCol: result[0].nbrCol,
          newPrice: result[0].newProductPrice));
    }
    return bonLivraisonPdfData;
  }
}

class PdfData {
  final Product product;
  final int nbrCol;
  final double newPrice;
  PdfData({
    required this.product,
    required this.nbrCol,
    required this.newPrice,
  });
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
